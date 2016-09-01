--packs
	library ieee;
	use ieee.std_logic_1164.all;

entity Edge_detector is
  port (
	clock: in std_logic;
	reset: in std_logic;
	next_data: in std_logic;
	next_fall_edge: out std_logic
  ) ;
end entity ; -- Edge_detector

architecture arch of Edge_detector is
	signal prev_next_data : std_logic;
begin
	process( clock,reset )
	begin
		if reset='1' then
			prev_next_data <='0';
		elsif( rising_edge(clock) ) then
			prev_next_data<=next_data;
		end if ;
	end process ; 

	next_fall_edge <= '1' when (next_data='0' and prev_next_data ='1') else '0';

end architecture ; -- arch