--packs
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity Equalizer_count is
  generic(ADDR_LENGTH: integer:=4;
  		INIT_ADDR: integer := 0;
  		LAST_ADDR : integer:= 100
  	);
  port (
		clk:		in std_logic;
		rst:		in std_logic;
		load:	in std_logic;
		inc:		in std_logic;
		count_out:	out std_logic_vector(ADDR_LENGTH-1 downto 0);
		last:	out std_logic
 	) ;
end entity ; -- Equalizer_count

architecture arch of Equalizer_count is
	signal count: unsigned(ADDR_LENGTH-1 downto 0);

begin
	count_out<=std_logic_vector(count);
	last<='1' when (count=to_unsigned(LAST_ADDR,ADDR_LENGTH)) else '0';


	behav : process( clk, rst)
	begin
	  if( rst= '1' ) then
	    count<=(others=>'0');
	  elsif( rising_edge(clk) ) then
		if load='1' then
			count<=to_unsigned(INIT_ADDR,ADDR_LENGTH);
		elsif inc='1' then
			count<=count+1;
		else
			count<=count;
		end if ;
	  end if ;
	end process ; -- behav


end architecture ; -- arch
