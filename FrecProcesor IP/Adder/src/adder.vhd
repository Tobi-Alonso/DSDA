--packs
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity adder is
  generic( 
  	DATA_WIDTH: integer:= 8;
  	PIPELINED: boolean := false
  		);
  port (
  	csi_clk: in std_logic;
  	rsi_rst : in std_logic;
  	coe_in_0: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	coe_in_1: in std_logic_vector(DATA_WIDTH-1 downto 0);
  	coe_sum: out std_logic_vector(DATA_WIDTH-1 downto 0)	
  ) ;
end entity ; -- adder

architecture arch of adder is
	signal sum: std_logic_vector(DATA_WIDTH-1 downto 0);
begin
	sum <= std_logic_vector(signed(coe_in_0) + signed(coe_in_1));
	
	pipe_logic: if PIPELINED generate
		process(rsi_rst,csi_clk)
		begin
			if rsi_rst='1' then
					sum<=(others=>'0');
			elsif rising_edge(csi_clk) then
				coe_sum<=sum;
			end if ;
		
		end process ; -- 
	end generate;


	no_pipe_logic: if not PIPELINED generate
		coe_sum<=sum;
	end generate;
end architecture ; -- arch