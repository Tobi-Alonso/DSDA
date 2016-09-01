--packs
	library ieee;
	use ieee.std_logic_1164.all;

entity Conduit_reg_load is
	generic(
		DATA_WIDTH: integer := 8 );
	port (
		csi_clk : in std_logic;
		rsi_reset : in std_logic;
		--conduit writing port
		coe_writedata : in std_logic_vector(DATA_WIDTH-1 downto 0);
		--conduit reading port
		coe_readdata : out std_logic_vector(DATA_WIDTH-1 downto 0);
		--clear interruption receiver
		inr_load: in std_logic
  ) ;
end entity ; -- Conduit_reg_load

architecture arch of Conduit_reg_load is 
	signal data : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal EN: std_logic;
begin
	EN<= inr_load;
	coe_readdata <= data;
	
	process( csi_clk, rsi_reset )
	begin
	  if( rsi_reset = '1' ) then
	    	data<=(others=>'0');
	  elsif( rising_edge(csi_clk) and EN='1'  ) then
		data<=coe_writedata;	  	
	  end if ;
	end process ; -- 
end architecture ; -- arch