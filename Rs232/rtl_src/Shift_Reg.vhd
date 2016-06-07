--Shift Register

--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity shift_reg is
	generic(REG_WIDTH: natural:=8);
	port(
		d :		in std_logic_vector(REG_WIDTH-1 downto 0);
		rst:	in std_logic;
		clk:	in std_logic;
		shift:	in std_logic;
		load:	in std_logic;
		q : 	out std_logic_vector(REG_WIDTH-1 downto 0));
end entity;

architecture arc_shift_reg of shift_reg is
	signal values: std_logic_vector(REG_WIDTH-1 downto 0);
	begin
	q<=values;

	process(clk)
		begin
		if(rising_edge(clk)) then
		
			if rst='1' then
				values<= (others=>'0');

			elsif shift='1' then
				values(REG_WIDTH-1)<='0';
				values(REG_WIDTH-2 downto 0)<=values(REG_WIDTH-1 downto 1);
				--values<=values ror 1;
			elsif load='1' then			
				values <= d;				
			end if ;
			
		end if;
	end process;
end arc_shift_reg;