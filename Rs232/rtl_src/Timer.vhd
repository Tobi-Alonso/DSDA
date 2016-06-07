--Timer
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity Timer is
	generic( timeout: integer:= 7);
    port (clk:	in std_logic;
  		rst:	in std_logic;
  		start:	in std_logic;
  		over:	out std_logic
  ) ;
end entity ; -- Timer

architecture arch of Timer is
	signal count: natural range 0 to 7;
	signal active: std_logic;
	begin

		behav : process( clk )
		begin
			if( rising_edge(clk) ) then
				if (rst='1') then
					count<=0;
				elsif start='1' then
					count<=timeout-1;
				elsif count>0 then
					count<=count-1;
				end if;
			end if ;
		end process ; -- start_detectbehav
		
		over<='0' when count=0 else '1';

end architecture ; -- arch
