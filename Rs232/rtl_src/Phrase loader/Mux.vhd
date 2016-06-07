--mux 8 to 4
--includes
	library ieee;
	use ieee.std_logic_1164.all;

entity Mux is
	generic(BUS_WIDTH: integer:=4
	 );
  	port (
  		in0:	in std_logic_vector(BUS_WIDTH-1 downto 0);
  		in1:	in std_logic_vector(BUS_WIDTH-1 downto 0);
  		sel:	in std_logic;
  		z:		out std_logic_vector(BUS_WIDTH-1 downto 0)
  	) ;
end entity ; -- Mux

architecture arch of Mux is
begin
z<=in0 when (sel='0') else in1;
end architecture ; -- arch