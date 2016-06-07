--parity calculator
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

--block that provides the parity bit
entity Parity_cal is
  port (
		clk:	in std_logic;
		calc:	in std_logic;	--input that triggers the calculation
		char:	in std_logic_vector(CHAR_WIDTH-1 downto 0);

		parity_bit:	out std_logic 
 	 ) ;
end entity ; -- Parity_cal

architecture arch of Parity_cal is
begin
	behav : process( clk )
	begin
		if( rising_edge(clk) ) then
			if calc='1' then
				parity_bit<= parity(char);
			end if ;		
		end if ;
	end process ; -- behav

end architecture ; -- arch