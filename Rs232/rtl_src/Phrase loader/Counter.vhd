--counter
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use work.Rs232_tx_pack.all;

entity Counter is
	generic(LENGTH: integer:=4);
 	port (
		clk:		in std_logic;
		rst:		in std_logic;
		inc:		in std_logic;
		load: 		in std_logic;
		start_num:	in std_logic_vector(LENGTH-1 downto 0);
		count_out:	out std_logic_vector(LENGTH-1 downto 0);
		overflow:	out std_logic
 	) ;
end entity ; -- Counter

architecture arch of Counter is
	signal count: unsigned(LENGTH-1 downto 0);

	begin
		count_out<=std_logic_vector(count);
		process( clk )
			begin
				if( rising_edge(clk) ) then
					if rst='1' then
						count<=(others=>'0');
					elsif load='1' then
						count<=unsigned(start_num);
					elsif inc='1' then
						count<=count+1;
					else
						count<=count;
					end if ;
				end if ;
		end process ;

		overflow<='1' when (count=to_unsigned(2**LENGTH-1,LENGTH)) else '0';
end architecture ; -- arch