--Conduit register that loads a new value when a MM master access to it's memory, the wridata port it is not used
--packs
	library ieee;
	use ieee.std_logic_1164.all;

entity Conduit_reg_MM_load is
	generic(
		DATA_WIDTH: integer:= 8);
	port (
		csi_clk : in std_logic;
		rsi_reset : in std_logic;
		--Slave Avalon- MM interface
		avs_write : in std_logic;
		avs_writedata : in std_logic_vector(7 downto 0); --fake writing port to avoid qsys error msj
		avs_read: in std_logic;
		avs_readdata: out std_logic_vector(7 downto 0);
		--conduit writing port
		coe_writedata : in std_logic_vector(DATA_WIDTH-1 downto 0);--real writing port
		--conduit reading port
		coe_readdata : out std_logic_vector(DATA_WIDTH-1 downto 0)
  ) ;
end entity ; -- Conduit_reg_MM_load

architecture arch of Conduit_reg_MM_load is 
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
	  elsif( rising_edge(csi_clk) and avs_write ='1'  ) then
			data(DATA_WIDTH-2 downto 0)<=coe_writedata(DATA_WIDTH-2 downto 0);
			data(7 downto DATA_WIDTH-1)<=(others => coe_writedata(DATA_WIDTH-1));	
	  end if ;
	end process ; -- 
end architecture ; -- arch