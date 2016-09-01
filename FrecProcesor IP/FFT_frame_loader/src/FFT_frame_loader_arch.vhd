library IEEE;
use IEEE.std_logic_1164.all;

entity FFT_frame_loader_arch is
 generic(	DATA_WIDTH : integer := 32;
 			FFT_LENGTH: integer := 128
 			);
  port (
	clock : in std_logic;
	--control inputs
	shift : in std_logic;
	--data ports
	data_in :in std_logic_vector(DATA_WIDTH-1 downto 0);
	data_out :out std_logic_vector(DATA_WIDTH-1 downto 0)
  ) ;
end entity ; -- FFT_frame_loader_arch

architecture arch of FFT_frame_loader_arch is
	type data_vector is array(FFT_LENGTH -1 downto 0 ) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal shift_reg : data_vector; 

begin
	data_out<= shift_reg(FFT_LENGTH -1);

	process( clock)
	begin
	  if( rising_edge(clock) ) then
		if shift='1' then
			shift_reg(FFT_LENGTH -1 downto 1) <= shift_reg(FFT_LENGTH -2 downto 0);
			shift_reg(0)<= data_in;
		end if ;
	  end if ;
	end process ; -- 

end architecture ; -- arch