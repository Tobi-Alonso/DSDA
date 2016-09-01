library IEEE;
use IEEE.std_logic_1164.all;

entity FFT_frame_loader_arch is
 generic(	DATA_WIDTH : integer := 32;
 			FFT_LENGTH: integer := 2048;
 			FRAME_SIZE: integer:= 64
 			);
  port (
	clock : in std_logic;
	reset: in std_logic;
	--control inputs
	load_old : in std_logic;
	load_new : in std_logic;
	next_value : in std_logic;
	transmit_new : in std_logic;
	--data ports
	data_in :in std_logic_vector(DATA_WIDTH-1 downto 0);
	data_out :out std_logic_vector(DATA_WIDTH-1 downto 0)
  ) ;
end entity ; -- FFT_frame_loader_arch

architecture arch of FFT_frame_loader_arch is
	type data_vector is array(FFT_LENGTH - FRAME_SIZE -1 downto 0 ) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal shift_reg : data_vector; 
	signal loader : data_vector; 

begin
	data_out<=data_in when transmit_new= '1' else  loader(data_vector'high);

	process( clock, reset )
	begin
	  if( reset = '1' ) then
	    shift_reg<=(others=>(others=>'0'));
	    loader<=(others=>(others=>'0'));
	  elsif( rising_edge(clock) ) then
		if load_new='1' then
			shift_reg(data_vector'high downto 1) <= shift_reg(data_vector'high-1 downto 0);
			shift_reg(0)<= data_in;
		end if ;

		if load_old='1' then
			loader<=shift_reg;
		elsif next_value='1' then
			loader(data_vector'high  downto 1) <= loader(data_vector'high-1 downto 0);
			loader(0)<= (others => '0');
		end if ;

	  end if ;
	end process ; -- 

end architecture ; -- arch