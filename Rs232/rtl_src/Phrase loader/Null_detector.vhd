--null detector
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity Null_detector is
  port (
		char:		in std_logic_vector(CHAR_WIDTH-1 downto 0);
		eop:	out std_logic
  ) ;
end entity ; -- Null_detector

architecture arch of Null_detector is
	begin
		process( char )
			begin
				eop<='0';
				if char=EOP_CHAR then
					eop<='1';
				end if ;
		end process ; 
end architecture ; -- arch