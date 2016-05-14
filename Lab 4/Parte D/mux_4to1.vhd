
--declaracion de librerias
library ieee;
use ieee.std_logic_1164.all;

--defincion de multiplexer 4 a 1
entity mux_4to1 is
	port
	(
		-- Input ports
		sel	: in  std_logic_vector(1 downto 0);
		info	: in  std_logic_vector(0 to 3);
		
		-- Output ports
		yout	: out std_logic);
end mux_4to1;



architecture arc_mux_4to1 of mux_4to1 is

	begin
		asignacion_salida: with sel select
								yout <= 	info(0) when "00",
											info(1) when "01",
											info(2) when "10",
											info(3) when "11",
											'Z' when others;

end arc_mux_4to1;
