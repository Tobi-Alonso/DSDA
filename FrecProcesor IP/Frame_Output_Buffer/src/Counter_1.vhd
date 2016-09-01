--packs
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity Counter_1 is
	generic(
		ADDR_LENGTH: integer :=7
		);
	port (
		clock: in std_logic;
		reset: in std_logic;
		inc: in std_logic;
		dec: in std_logic;
		out_count: out std_logic_vector(ADDR_LENGTH-1 downto 0);
		max_value: out std_logic;
		dec_error: out std_logic
	  ) ;
end entity ; -- Counter_1

architecture arch of Counter_1 is
	signal count : unsigned(ADDR_LENGTH-1 downto 0);
begin
	behav : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    count<=(others=>'0');
	    dec_error<='0';
	  elsif( rising_edge(clock) ) then
	  dec_error<='0'; --default value
		if dec='1' then
			if inc='1' then
				null;
			else
				if count/=to_unsigned(0,ADDR_LENGTH) then					
					count<=count-1;	
				else
					dec_error<='1';
				end if ;			
			end if ;
		else
			if inc='1' then
				count<=count+1;	
			else
				null;			
			end if ;			
		end if ;
	  end if ;
	end process ; -- behav

	out_count<= std_logic_vector(count);
	max_value<= '1' when count=2**ADDR_LENGTH-1 else '0';
end architecture ; -- arch