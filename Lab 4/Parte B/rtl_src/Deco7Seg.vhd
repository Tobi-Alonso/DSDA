library ieee;
use ieee.std_logic_1164.all;

entity Deco7Seg is
	port( Nro: in std_logic_vector (3 downto 0);
			Sal: out std_logic_vector (0 to 6));
end Deco7Seg;

architecture arc_ssa_Deco7Seg of Deco7Seg is

begin
with Nro select
		Sal <= 											"0000001" when "0000",
														"1001111" when "0001",
														"0010010" when "0010",
														"0000110" when "0011",
														"1001100" when "0100",
														"0100100" when "0101",
														"0100000" when "0110",
														"0001111" when "0111",
														"0000000" when "1000",
														"0001100" when "1001",
														"0001000" when "1010",
														"1100000" when "1011",
														"0110001" when "1100",
														"1000010" when "1101",
														"0110000" when "1110",
														"0111000" when "1111",
														"1111111" when others;			
				

end arc_ssa_Deco7Seg;
