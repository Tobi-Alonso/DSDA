--packs
	library ieee;
	use ieee.std_logic_1164.all;


entity Equalizer_ctrl is
  port (
	clock :in std_logic;
	reset :in std_logic;
	--input buffer interface
	rd : out std_logic;
	response: in std_logic_vector(1 downto 0);
	new_pack : in std_logic;
	--output buffer interface
	wr : out std_logic;
	end_send : in std_logic;
	--current exponent reg interface
	load_exp : out std_logic;
	--counter interface
	load : out std_logic;
	inc : out std_logic;
	last :  in std_logic;
	--control reg interface
	wr_ctrl: out std_logic;
	tx_en: out std_logic;
	herm_en : out std_logic
  ) ;
end entity ; -- Equalizer_ctrl

architecture arch of Equalizer_ctrl is
	type state is (INIT,IDLE,READING,WRITING,SEND,WAIT_1,WAIT_2);
	signal current_state, next_state : state;


begin

	current_state_logic : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    	current_state<= INIT;
	  elsif( rising_edge(clock) ) then
		current_state<= next_state;
	  end if ;
	end process ; -- current_state_logic

	next_state_logic : process( current_state,new_pack, end_send,last,response )
	begin
		case( current_state ) is
		 	when INIT =>
		 		next_state<= IDLE;
			when IDLE =>
				if new_pack='0' then
					next_state<=IDLE;
				else
					next_state<=READING;
				end if ;
				
			when READING =>
				if response="00" then
					next_state<=WRITING;
				else
					next_state<=READING;
				end if ;
				
			when WRITING =>
				if last='0' then
					next_state<=READING;
				else
					next_state<=SEND;
				end if ;

			when  SEND =>
				next_state<= WAIT_1;
			when WAIT_1 =>
				if end_send='0' then
					if new_pack='0' then
						next_state<=WAIT_1;
					else
						next_state<=WAIT_2;	
					end if ;
				else
					if new_pack='0' then
						next_state<=IDLE;
					else
						next_state<=READING;		
					end if ;
				
				end if ;

			when WAIT_2 =>
				if end_send='0' then
					next_state<=WAIT_2;
				else
					next_state<=READING;
				end if ;
		end case ;
	end process ; -- next_state_logic

	output_logic : process( current_state,end_send,new_pack)
	begin
		--input buffer control
		rd <='0';
		--output buffer control
		wr <='0';
		--pointer gen control
		load <='0';
		inc <='0';
		--control reg interface
		wr_ctrl <= '0';
		tx_en <= '0';
		herm_en  <= '1'; 	--always '1'
		--current exponent reg interface
		load_exp<= '0';

		case( current_state ) is	
			when INIT =>
				wr_ctrl<='1';	--hermite symmetry enable
			when IDLE =>
				load<='1';	
				load_exp<='1';		
			when READING =>
				rd<='1';
			when WRITING =>
				wr<='1';
				inc<='1';

			when  SEND =>
				wr_ctrl<='1';
				tx_en<='1';

			when WAIT_1 =>
				load<='1';
				if end_send='1' and new_pack='1' then
					load_exp<='1';
				end if ;

			when WAIT_2 =>
				load_exp<='1';
		end case ;
	end process ; -- output_logic

end architecture ; -- arch