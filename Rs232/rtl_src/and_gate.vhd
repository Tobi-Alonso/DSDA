--and gate
--includes
	library ieee;
	use ieee.std_logic_1164.all;

entity and_gate is
  port (
	in0:		in std_logic;
	in1:		in std_logic;
	out_value:	out std_logic
  ) ;
end entity ; -- and_gate

architecture arch of and_gate is
begin
	out_value<=in0 and in1;
end architecture ; -- arch