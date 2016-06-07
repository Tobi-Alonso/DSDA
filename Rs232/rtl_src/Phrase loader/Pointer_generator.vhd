--pointer generator
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use work.Rs232_tx_pack.all;

entity Pointer_generator is
  port (
		ptr_sel:	in std_logic_vector(PTR_SEL_WIDTH-1 downto 0);
		ptr:		out std_logic_vector(ADDR_LENGTH-1 downto 0)
  ) ;
end entity ; -- Pointer_generator

architecture arch of Pointer_generator is
	begin
		ptr <= POINTERS(to_integer(unsigned(ptr_sel)));
end architecture ; -- arch