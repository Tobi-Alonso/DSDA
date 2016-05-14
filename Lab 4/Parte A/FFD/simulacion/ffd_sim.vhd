library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;


entity ffd_sim is
end ffd_sim;
---
architecture behav of ffd_sim is
	component FFD_sr
		port( 	set_int: in std_logic;
			reset_int: in std_logic;
			data_int: in std_logic;
			clk_int: in std_logic;
			Sal_int: out std_logic);
	end component;
--------
--signal set_ext :std_logic :='0';
--signal reset_ext :std_logic :='0';
--signal data_ext :std_logic :='0';
signal clk_ext :std_logic :='0';
signal ff_inputs :std_logic_vector (2 downto 0) := "000";
signal sal_ext :std_logic;

begin
	----instantiate
	--U1 :FFD_sr port map(ff_inputs(2)=>set_int , ff_inputs(1)=>reset_int , ff_inputs(0)=>data_int , clk_ext=>clk_int , sal_ext=>sal_int);
	U1 :FFD_sr port map(ff_inputs(2), ff_inputs(1), ff_inputs(0), clk_ext, sal_ext);
	--U1 :FFD_sr port map(set_ext , reset_ext , data_ext , clk_ext , sal_ext);
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
		for i in 0 to 7 loop	
			ff_inputs <= std_logic_vector(to_unsigned(i,3));
			--reset_ext <= STD_LOGIC_vector(to_unsigned(i,1));
			--for j in 0 to 1 loop
			--	set_ext <= STD_LOGIC_vector(to_unsigned(j,1));
			--	for k in 0 to 1 loop
			--		data_ext <= std_logic_vector(to_unsigned(k,1));
					wait for 97 ns;
			--	end loop;
			--end loop;
		end loop;
	end process;
	----
end behav;
