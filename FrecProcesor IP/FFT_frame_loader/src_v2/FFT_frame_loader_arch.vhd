library IEEE;
use IEEE.std_logic_1164.all;

entity FFT_frame_loader_arch is
 generic(	DATA_WIDTH : integer := 32;
 			FFT_LENGTH: integer := 128;
 			FRAME_SIZE: integer:= 32
 			);
  port (
	clock : in std_logic;
	reset: in std_logic;
	--control inputs
	shift_old : in std_logic;
	shift_new : in std_logic;
	load_old : in std_logic;
	--data ports
	data_in :in std_logic_vector(DATA_WIDTH-1 downto 0);
	data_out :out std_logic_vector(DATA_WIDTH-1 downto 0)
  ) ;
end entity ; -- FFT_frame_loader_arch

architecture arch of FFT_frame_loader_arch is
	type data_vector is array( natural range <> ) of std_logic_vector(DATA_WIDTH-1 downto 0);
	--type data_vector is array(FFT_LENGTH - FRAME_SIZE -1 downto 0 ) of std_logic_vector(DATA_WIDTH-1 downto 0);
	--type data_vector2 is array(FFT_LENGTH -1 downto 0 ) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal shift_reg : data_vector(FFT_LENGTH - FRAME_SIZE -1 downto 0 ) ; 
	signal loader : data_vector(FFT_LENGTH -1 downto 0 ); 

begin
	data_out<= loader(FFT_LENGTH -1);

	process( clock, reset )
	begin
	  if( reset = '1' ) then
	    shift_reg<=(others=>(others=>'0'));
	    loader<=(others=>(others=>'0'));
	  elsif( rising_edge(clock) ) then
		if shift_old='1' then
			shift_reg(FFT_LENGTH - FRAME_SIZE -1 downto 1) <= shift_reg(FFT_LENGTH - FRAME_SIZE -2 downto 0);
			shift_reg(0)<= data_in;
		end if ;

		if load_old='1' then
			loader(FFT_LENGTH - FRAME_SIZE -1 downto 0 )<=shift_reg;
		elsif shift_new='1' then
			loader(FFT_LENGTH -1  downto 1) <= loader(FFT_LENGTH -2 downto 0);
			loader(0)<= data_in;
		end if ;

	  end if ;
	end process ; -- 

end architecture ; -- arch