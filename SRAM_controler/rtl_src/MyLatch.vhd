--latch
--includes
	library ieee;
	use ieee.std_logic_1164.all;

entity MyLatch is
	generic(BUS_WIDTH: integer := 8);
	  port (
		 EN: in std_logic;
		 Din:	in std_logic_vector(BUS_WIDTH-1 downto 0);
		 Dout:  out std_logic_vector(BUS_WIDTH-1 downto 0)
	  ) ;
end entity ; -- MyLatch

architecture arch of MyLatch is
begin
	 process( EN,Din )
		begin
			if (EN='1') then
					Dout<=Din;
				end if ;	
	end process ; 

end architecture ; -- arch