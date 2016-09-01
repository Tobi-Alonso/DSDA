--Register that can be read and written through it's Avalon-MM interfase
--packs
	library ieee;
	use ieee.std_logic_1164.all;

entity MM_reg is
	generic(
		DATA_WIDTH: integer := 8);
	port (
		csi_clk : in std_logic;
		rsi_reset : in std_logic;
		--Slave Avalon- MM interface
		avs_write : in std_logic;
		avs_writedata : in std_logic_vector(7 downto 0);
		avs_read : in std_logic;								--it does not drive drive logic
		avs_readdata : out std_logic_vector(7 downto 0);
		--conduit reading port
		coe_readdata : out std_logic_vector(DATA_WIDTH-1 downto 0);
		--clear interruption receiver
		inr_clear: in std_logic
  ) ;
end entity ; -- MM_reg

architecture arch of MM_reg is 
	signal data : std_logic_vector(7 downto 0);
begin
	avs_readdata <= data;
	--wiring coe_readdata to allow read the correcto number
	coe_readdata(DATA_WIDTH-1) <= data(7);
	coe_readdata(DATA_WIDTH-2 downto 0) <= data(DATA_WIDTH-2 downto 0);

	process( csi_clk, rsi_reset )
	begin
	  if( rsi_reset = '1' ) then
	    	data<=(others=>'0');
	  elsif( rising_edge(csi_clk) ) then
	  	if inr_clear='1' then
	  		data<=(others=> '0');
	  	elsif avs_write ='1' then
			data(DATA_WIDTH-2 downto 0)<=avs_writedata(DATA_WIDTH-2 downto 0);
			data(7 downto DATA_WIDTH-1)<=(others => avs_writedata(7));
	  	end if ;	
	  end if ;
	end process ; -- 

end architecture ; -- arch