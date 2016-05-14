--includes
	library ieee;
	use ieee.std_logic_1164.all;

entity registro is
	generic(ANCHO: natural:=8);
	port(
		d :		in std_logic_vector(ANCHO-1 downto 0);
		clk:	in std_logic;
		q : 	out std_logic_vector(ANCHO-1 downto 0));
end entity;

architecture arc_registro of registro is
	begin
	captura: process(clk)
		begin
		if(rising_edge(clk)) then
			q <= d;
		end if;
	end process captura;
end arc_registro;