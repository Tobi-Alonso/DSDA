library ieee;
use ieee.std_logic_1164.all;

entity cont_simu is
end cont_simu;
---
architecture behav of cont_simu is
	
	component cont_lfsr is
	--generic (seed:std_logic_vector (3 downto 0) := "1000");
	
	port( 		clk: in std_logic;
			reset: in std_logic;
			--seed: in std_logic (3 downto 0);
			--clk_int: in std_logic;
			Sal_cont: out std_logic_vector (3 downto 0));
	end component;

	-------

	signal clk_ext :std_logic :='0';
	signal reset_ext :std_logic :='0';
	signal cout :std_logic_vector (3 downto 0);
	
	begin
	----instantiate
	U1 :cont_lfsr port map(clk => clk_ext,reset => reset_ext,sal_cont => cout);
	-----ain stimulus

	Process
	begin
		clk_ext<='0';
		wait for 15 ns;
		clk_ext<='1';
		wait for 15 ns;
	end process;
	-----bin stimulus
	
	process
	begin
		reset_ext<='0';
		wait for 600 ns;
		reset_ext<='1';
		wait for 20 ns;
	end process;
----
end behav;
