--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity reg is
	generic(REG_WIDTH: natural:=8);
	port(
		d :		in std_logic_vector(REG_WIDTH-1 downto 0);
		rst:	in std_logic;
		clk:	in std_logic;
		q : 	out std_logic_vector(REG_WIDTH-1 downto 0));
end entity;

architecture arc_reg of reg is
	begin
	process(clk)
		begin
		if(rising_edge(clk)) then
			if rst='1' then
				q<=(others=>'0');
			else
				q <= d;				
			end if ;
			
		end if;
	end process;
end arc_reg;