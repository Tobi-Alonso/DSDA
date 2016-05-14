
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.ALL;

entity cont_gray is
	--generic (seed:std_logic_vector (3 downto 0) := "1000");
	
	port( clk: in std_logic;
			reset: in std_logic;
			--seed: in std_logic (3 downto 0);
			--clk_int: in std_logic;
			Sal_cont: out std_logic_vector (3 downto 0));
end cont_gray;

architecture beh of cont_gray is

	--signal feedback:std_logic;
	signal buses_ant:std_logic_vector(3 downto 0):="0000";
	signal buses_post:std_logic_vector(3 downto 0):="0100";
	
begin
			
	process (clk)
	begin
			--feedback <= buses(1) xor buses(0);
			if(rising_edge(clk)) then
				if(reset='0') then
					buses_ant<="0000";
					buses_post<="0000";
				else
					case buses_ant is
						when "0000" =>	buses_post <= "0001";
						when "0001" =>	buses_post <= "0011";
						when "0011" =>	buses_post <= "0010";
						when "0010" =>	buses_post <= "0110";
						when "0110" =>	buses_post <= "0111";
						when "0111" =>	buses_post <= "0101";
						when "0101" =>	buses_post <= "0100";
						when "0100" =>	buses_post <= "1100";
						when "1100" =>	buses_post <= "1101";
						when "1101" =>	buses_post <= "1111";
						when "1111" =>	buses_post <= "1110";
						when "1110" =>	buses_post <= "1010";
						when "1010" =>	buses_post <= "1011";
						when "1011" =>	buses_post <= "1001";
						when "1001" =>	buses_post <= "1000";
						when others => buses_post <= "0000";
					end case;
				end if;
			end if;	
			sal_cont<=buses_post;
			buses_ant<=buses_post;
		
	end process;
	
end beh;

