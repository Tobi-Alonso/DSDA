--RS232 controller
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity Rs232_control is
  port (
		clk:			in std_logic;
		estable_frec:	in std_logic;
		char_rdy:		in std_logic;
		info_bit:		in std_logic;
		last_bit_L:		in std_logic;
		parity_bit:		in std_logic;
		rst:			in std_logic;

		transmitting:	out std_logic;
		ready:			out std_logic;
		calc_parity:	out std_logic;
		tx:				out std_logic;
		next_bit:		out std_logic;
		start_timer:	out std_logic
 	 ) ;
end entity ; -- Rs232_control

architecture arch of Rs232_control is
	type controller_states is (IDLE,START_BIT,SHIFT,PARTITY,STOP_BIT );
	signal current_state: controller_states;
	signal next_state: controller_states;

	--type of coding
begin
	current_state_logic : process( clk )
		begin
			if( rising_edge(clk) ) then			
				current_state<=next_state;
			end if ;
	end process ; -- current_state_logic

	next_state_logic : process(current_state,estable_frec,char_rdy,last_bit_L,rst)
		begin
			if (rst='1' or estable_frec='0') then
					next_state<=IDLE;
			else
				case( current_state) is
					when IDLE =>
							if (char_rdy='1') then
								next_state<=START_BIT;
							else
								next_state<=IDLE;
							end if ;
					when START_BIT =>
							next_state<=SHIFT;
					when SHIFT =>
							if last_bit_L='0' then
								next_state<=PARTITY;
							else
								next_state<=SHIFT;
							end if ;
					when PARTITY =>
							next_state<=STOP_BIT;
					when STOP_BIT =>
							next_state<=IDLE;
				end case ;	
			end if;	
	end process ; -- next_state_logic

	output_logic : process(current_state,info_bit,parity_bit,estable_frec )
		begin
		transmitting<='1';
		ready<='0';
		calc_parity<='0';
		tx<='1';
		next_bit<='0';
		start_timer	<='0';
			case( current_state) is
				when IDLE =>
						ready<=estable_frec;	
						transmitting<='0';	
				when START_BIT =>
						tx<='0';
						calc_parity<='1';--calculate parity
						start_timer<='1';--start timer
				when SHIFT =>
						next_bit<='1';	--loads next bit
						tx<=info_bit;										
				when PARTITY =>
						tx<=parity_bit;
				when STOP_BIT =>
						ready<='1';
			end case ;
			
	end process ; -- output_logic
	

end architecture ; -- arch