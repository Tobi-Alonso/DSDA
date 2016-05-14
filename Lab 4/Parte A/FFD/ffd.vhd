
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity FFD_sr is
	port( set_int: in std_logic;
			reset_int: in std_logic;
			data_int: in std_logic;
			clk_int: in std_logic;
			Sal_int: out std_logic);
end FFD_sr;

architecture beh of FFD_sr is

begin
	process (clk_int,reset_int,Set_int)
	begin
		
		if( reset_int = '1' ) then
		
			sal_int <= '0';
			
		elsif(set_int = '1') then
			
			sal_int <= '1';
		
		elsif(rising_edge(clk_int)) then
		
			sal_int <= data_int;
	
		end if;
	
	end process;
	
end beh;

