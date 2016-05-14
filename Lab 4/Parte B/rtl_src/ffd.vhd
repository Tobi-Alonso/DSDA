entity ffd is
	port(
		d :		in std_logic;
		clk:	in std_logic;
		q : 	out std_logic;
end entity;

architecture arc_ffd of ffd is
	begin
	captura: process(clk)
		begin
		if(rising_edge(clk)) then
			q <= d;
		end if;
	end process captura;
end arc_ffd;