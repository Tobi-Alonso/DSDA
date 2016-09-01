--packs
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity FIFO is
	generic(
	  	ADDR_LENGTH: integer :=7;
	  	DATA_WIDTH : integer := 16
	  	);
 	port (
		clock : in std_logic;
		reset: in std_logic;
		--control signals
		we: in std_logic;
		shift: in std_logic;
		address: in std_logic_vector(ADDR_LENGTH-1 downto 0);
		writedata: in std_logic_vector(DATA_WIDTH-1 downto 0);
		readdata : out std_logic_vector(DATA_WIDTH-1 downto 0)
	  ) ;
end entity ; -- FIFO
	
	architecture arch of FIFO is

		type data_vector is array(2**ADDR_LENGTH-2 downto 0 ) of std_logic_vector(DATA_WIDTH-1 downto 0);
		signal memory: data_vector;
		
	begin

		readdata<=memory(0);

		behav : process( clock, reset )
		begin
		  if( reset = '1' ) then
		    	memory<=(others=> (others=>'0'));
		  elsif( rising_edge(clock) ) then
			if shift='1' then
				memory(data_vector'high-1 downto 0) <= memory(data_vector'high downto 1);
				memory(data_vector'high)<=(others =>'0');
			else
				if we='1' then
					memory(to_integer(unsigned(address)))<=writedata;
				end if ;
			end if ;
		  end if ;
		end process ; -- behav
	
	
	end architecture ; -- arch