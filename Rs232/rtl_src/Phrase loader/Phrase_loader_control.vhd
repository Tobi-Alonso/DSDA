--phrase loader controller
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use work.Rs232_tx_pack.all;

entity Phrase_loader_control is
  	port (
		clk:	in std_logic;
		eop:	in std_logic;
		ph_sel:	in std_logic_vector(CANT_PHRASES-1 downto 0);
		all_p:	in std_logic;
		rst:	in std_logic;
		ready:	in std_logic;

		ptr_sel:	out std_logic_vector(PTR_SEL_WIDTH-1 downto 0);
		next_char:	out std_logic;
		load_ptr:	out std_logic;
		char_ready:	out std_logic

 	 ) ;
end entity ; -- Phrase_loader_control

architecture arch of Phrase_loader_control is
	type loader_states is (IDLE,LD_ALL,LD_1,WAIT_ALL,WAIT_1,TX_ALL,TX_1);
	signal current_state: loader_states;
	signal next_state: loader_states;

	--internal signals
		signal ptr_ptr:	std_logic_vector(PTR_SEL_WIDTH-1 downto 0);
		signal ld_ptr_ptr: std_logic;
		signal inc_ptr_ptr: std_logic;
		signal ptr_sel_wire: std_logic_vector(PTR_SEL_WIDTH downto 0);


	--auxiliar signals for sync
		signal all_p_sync:	std_logic;
		signal request: std_logic_vector(CANT_PHRASES-1 downto 0);
		signal aux_sync: std_logic_vector(CANT_PHRASES downto 0);

	begin
		synchronizer1: reg generic map(CANT_PHRASES+1)
								port map(d(CANT_PHRASES)=>all_p,d(CANT_PHRASES-1 downto 0)=>ph_sel,
									rst=>rst,clk=>clk,q=>aux_sync);
		synchronizer2: reg generic map(CANT_PHRASES+1)
								port map(d=>aux_sync, rst=>rst,clk=>clk,
									q(CANT_PHRASES)=>all_p_sync,q(CANT_PHRASES-1 downto 0)=>request);

		ptr_ptr_chooser : process(request)
			begin
				ptr_ptr<=std_logic_vector(to_unsigned(0,PTR_SEL_WIDTH));
				if request/=std_logic_vector(to_unsigned(0,CANT_PHRASES)) then		
					codifier : for i in 0 to CANT_PHRASES-1 loop
						if request(i)='1' then
							ptr_ptr<=std_logic_vector(to_unsigned(i,PTR_SEL_WIDTH));
						end if ;
					end loop ; -- codifier
				end if ;
			
		end process ; -- ptr_ptr_chooser


		current_state_logic : process( clk )
			begin
				if( rising_edge(clk) ) then			
					current_state<=next_state;
				end if ;
		end process ; -- current_state_logic

		next_state_logic : process(current_state,request,all_p_sync,ready,rst,eop,ptr_sel_wire)
			begin
				if rst='1' then
					next_state<=IDLE;
				else
					case( current_state ) is
					
						when IDLE =>
							if all_p_sync='1' then							
								next_state<=LD_ALL;	
							elsif request/=std_logic_vector(to_unsigned(0,CANT_PHRASES)) then
									next_state<=LD_1;
							else
								next_state<=IDLE;
							end if ;

						when LD_ALL =>
							if(ptr_sel_wire=std_logic_vector(to_unsigned(CANT_PHRASES,PTR_SEL_WIDTH+1))) then
								next_state<=IDLE;
							else
								next_state<=WAIT_ALL;
							end if;
						when WAIT_ALL =>
							if (eop='1' and (all_p_sync='0' or ptr_sel_wire/=std_logic_vector(to_unsigned(CANT_PHRASES,PTR_SEL_WIDTH+1)))) then
								-- and (all_p_sync/='0' or ptr_sel/=std_logic_vector(to_unsigned(CANT_PHRASES-1,PTR_SEL_WIDTH))) is used 
								-- to avoid sending the phrases more than once
								next_state<=LD_ALL;
							elsif (eop='0' and ready='1') then
								next_state<= TX_ALL;
							else
								next_state<=WAIT_ALL;						
							end if ;
						when TX_ALL =>	next_state<=WAIT_ALL;

						when LD_1 =>	next_state<= WAIT_1;						
						when WAIT_1 =>
							if (eop='1' and request=std_logic_vector(to_unsigned(0,CANT_PHRASES))) then
								-- and request=std_logic_vector(to_unsigned(0,CANT_PHRASES)), is used 
								-- to avoid sending the phrase more than once
								next_state<=IDLE;
							elsif (eop='0' and ready='1') then
								next_state<= TX_1;
							else
								next_state<=WAIT_1;						
							end if ;
						when TX_1 =>	next_state<=WAIT_1;		

					end case ;
				end if ;	
		end process ; -- next_state_logic




		output_logic : process( current_state )
			begin
				--ptr_sel controlled by counter
				next_char<='0';
				load_ptr<='0';
				char_ready<='0';
				case( current_state ) is			
					when IDLE =>	NULL;

					when LD_ALL =>	load_ptr<='1';
					when WAIT_ALL => NULL;
					when TX_ALL =>	char_ready<='1';
									next_char<='1';

					when LD_1 => load_ptr<='1';
					when WAIT_1 =>	NULL;
					when TX_1 => char_ready<='1';
								 next_char<='1';
				end case ;	
		end process ; -- output_logic

		ptr_sel<=ptr_sel_wire(PTR_SEL_WIDTH-1 downto 0);

		
		--pointer of pointers logic ----used to load all the phrases
			ptr_ptr_inst: counter 	generic map(PTR_SEL_WIDTH+1)
									port map(clk=>clk,
										rst=>rst,
										inc=>inc_ptr_ptr,
										load=>ld_ptr_ptr,
										start_num(PTR_SEL_WIDTH)=>'0',
										start_num(PTR_SEL_WIDTH-1 downto 0)=>ptr_ptr,
										count_out=>ptr_sel_wire,
										overflow=>open);

			--internal signales generation
				with current_state select
					ld_ptr_ptr<=	'1' when IDLE,
									'0' when LD_ALL|WAIT_ALL|TX_ALL,
									'-' when others;

				with current_state select
					inc_ptr_ptr<=	'1' when LD_ALL,
									'0' when WAIT_ALL|TX_ALL,
									'-' when others;

end architecture ; -- arch


