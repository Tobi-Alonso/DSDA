--reset module
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity Reset_module is
	generic(RST_WIDTH: integer:=7);
  	port (
		clk: 	in std_logic;
		init:	in std_logic;
		rst:	out std_logic
 	 ) ;
end entity ; -- Reset_module

architecture arch of Reset_module is
	type rst_state is (IDLE,TIMER_ON,RST_ON,RST_OFF);
	signal current_state: rst_state;
	signal next_state: rst_state;
	signal aux_sync: std_logic;
	signal sync_init: std_logic;

	signal timer: natural range 0 to RST_WIDTH-1;
begin
	sync: reg 	generic map(2)
				port map(d(0)=>init,d(1)=>aux_sync,rst=>'0',
					clk=>clk,q(0)=>aux_sync,q(1)=>sync_init);

	current_state_logic : process( clk )
		begin
			if( rising_edge(clk) ) then			
				current_state<=next_state;
			end if ;
	end process ; -- current_state_logic	

	nextstate_logic : process( current_state,sync_init ,timer)
		begin
			case( current_state ) is
				when IDLE =>
					if sync_init='0' then
						next_state<=IDLE;
					else
						next_state<=TIMER_ON;
					end if ;
				when TIMER_ON => 
					next_state<=RST_ON;
				when RST_ON =>
					if timer=0 then
						next_state<=RST_OFF;
					else
						next_state<=RST_ON;
					end if ;
				when RST_OFF => 
					if sync_init='1' then
						next_state<=RST_OFF;
					else
						next_state<=IDLE;
					end if ;
			
			end case ;
	end process ; -- nextstate_logic

	--output logic
	with current_state select
		rst<=	'1' when RST_ON|TIMER_ON|IDLE,
				'0' when others;

	Countdown : process( clk )
	begin
		if( rising_edge(clk) ) then
			if current_state=TIMER_ON then
				timer<=RST_WIDTH-1;
			elsif timer>0 then
				timer<=timer-1;
			end if ;
		end if ;
	end process ; -- Countdown


end architecture ; -- arch