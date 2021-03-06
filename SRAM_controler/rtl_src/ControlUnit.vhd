--ControlUnit.vhd v 3

--includes
	library ieee;
	use ieee.std_logic_1164.all;

	entity ControlUnit is
	  port (
		clock: 	in std_logic;
		rst: 	in std_logic;
		--interfase to sistem
		rd:		in std_logic;
		wr:		in std_logic;
		eoop:	out std_logic;
		--controler signals
		LatchAddr_L:	out std_logic;
		DR_LD:		out std_logic;
		LD_S_M: 		out std_logic;
		DR_O2M:		out std_logic;
		DR_O2S:		out std_logic;

		-- memory control output
		CE_L:			out std_logic;
		WE_L:			out std_logic;
		OE_L:			out std_logic;
		UB_L:			out std_logic;
		LB_L:			out std_logic
	  ) ;
	end entity ; -- ControlUnit
	
	architecture arch of ControlUnit is
		type controler_states is (IDLE,RD1,RD2,WR1,WR2);	
		signal current_state: controler_states;
		signal next_state: controler_states;

		signal async_eoop: std_logic;			
			-- memory control output
		signal	async_CE_L: std_logic;			
		signal	async_WE_L: std_logic;			
		signal	async_OE_L: std_logic;			
		signal	async_UB_L: std_logic;			
		signal	async_LB_L: std_logic;	
		signal	async_LatchAddr_L: std_logic;	

	begin
		current_state_logic : process( clock )
		begin
			if( rising_edge(clock) ) then
				current_state<=next_state;
			end if ;
		end process ; -- current_state_logic
		
		next_state_logic : process( current_state,rd,wr,rst)
		begin
			if rst='1' then
				next_state<=IDLE;
			else
				case( current_state ) is	
					when IDLE =>
							if wr='1' then
								next_state<=WR1;
							elsif rd='1' then
								next_state<=RD1;
							else
								next_state<=IDLE;
							end if ;
					when RD1 =>	next_state<= RD2;
					when RD2 =>
						if (rd='1') then
							next_state<= RD2;
						else
							next_state<=IDLE;
						end if ;
					when WR1 => next_state<=WR2;							
					when WR2 => next_state<=IDLE;	
				end case ;						
			end if ;
		end process ; -- next_state_logic
		
		no_pipe_output_logic : process( current_state,rd,wr )
		begin		
			DR_LD<='0';		
			LD_S_M<='0'; 		
			DR_O2M<='0';		
			DR_O2S<='0';		
			case( current_state ) is
				when IDLE => DR_LD<='1';	
				when RD1=> 	LD_S_M<='1';
								DR_LD<='1';	
				when RD2=>	DR_O2S<='1';	
				when WR1=>	DR_O2M<='1';			
				when WR2=>	DR_O2M<='1';
			end case ;


		end process ; -- output_logic

		piped_output_logic : process(next_state )
		begin
			async_LatchAddr_L<='0';	
			async_eoop<='1';			
			-- memory control output
			async_CE_L<='1';			
			async_WE_L<='1';			
			async_OE_L<='1';	
			-- constant memory control output		
			async_UB_L<='0';			
			async_LB_L<='0';		
			case( next_state ) is
				when IDLE => async_LatchAddr_L<='1';
				when RD1=> 	async_OE_L<='0';
								async_CE_L<='0';
								async_eoop<='0';
				when RD2=>	NULL;
				when WR1=>	async_eoop<='0';
								async_CE_L<='0';
								async_WE_L<='0';					
				when WR2=>	NULL;
			end case ;
			
		end process ; -- piped_output_logic

		output_pipelining : process( clock )
		begin
			if rising_edge(clock) then
				LatchAddr_L<=async_LatchAddr_L;
				eoop<=async_eoop;			
				CE_L<=async_CE_L;			
				WE_L<=async_WE_L;			
				OE_L<=async_OE_L;			
				UB_L<=async_UB_L;			
				LB_L<=async_LB_L;	
			end if ;
		end process ; -- output_pipelining

	end architecture ; -- arch
