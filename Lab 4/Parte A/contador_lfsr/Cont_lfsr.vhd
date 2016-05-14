
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity cont_lfsr is
	generic (seed:std_logic_vector (3 downto 0) := "1000");
	
	port( clk: in std_logic;
			reset: in std_logic;
			--seed: in std_logic (3 downto 0);
			--clk_int: in std_logic;
			Sal_cont: out std_logic_vector (3 downto 0));
end cont_lfsr;

architecture beh of cont_lfsr is

	component FFD_sr
		port( 	set_int: in std_logic;
			reset_int: in std_logic;
			data_int: in std_logic;
			clk_int: in std_logic;
			Sal_int: out std_logic);
	end component;
	
	signal feedback:std_logic;
	signal buses:std_logic_vector(3 downto 0);
	
begin
		ff1: FFD_sr port map (set_int=>reset , reset_int=>'0' , data_int=>feedback , clk_int=>clk , sal_int=>buses(3) );
		ffs: for i in 2 downto 0 generate
			ff2: FFD_sr port map (set_int=>'0' , reset_int=>reset , data_int=>buses(i+1) , clk_int=>clk , sal_int=>buses(i) );
		end generate ffs;
	
	process (clk)
	begin
			feedback <= buses(1) xor buses(0);
			sal_cont<=buses;
			
		
	end process;
	
end beh;

