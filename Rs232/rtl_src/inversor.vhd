--inversor
--includes
	library ieee;
	use ieee.std_logic_1164.all;

entity inversor is
  port (
		in_value: in std_logic;
		out_value: out std_logic
  ) ;
end entity ; -- inversor

architecture arch of inversor is
begin
	out_value<=not(in_value);
end architecture ; -- arch