--FFT input adapter

library IEEE;
use IEEE.std_logic_1164.all;

entity FFT_input_adap is
   generic(	DATA_WIDTH: integer :=16;
   			INVERT: boolean :=false
  	);
  port (
  	--csi_clk and reset
	csi_clk			:in std_logic;
	rsi_reset		:in std_logic;
	--input Avalon-ST interface
	asi_sink_data	:in std_logic_vector(DATA_WIDTH*2-1 downto 0)  ; 
	asi_sink_valid 	:in std_logic;
	asi_sink_ready :out std_logic;
	asi_sink_error 	:in std_logic_vector(1 downto 0) ;
	asi_sink_startofpacket 	:in std_logic;  
	asi_sink_endofpacket  	:in std_logic;  
	--Output Avalon-ST interface
	aso_source_data    :out std_logic_vector(DATA_WIDTH*2 downto 0);
	aso_source_valid 	:out std_logic;
	aso_source_ready  :in std_logic;
	aso_source_error 	:out std_logic_vector(1 downto 0);
	aso_source_startofpacket 	:out std_logic;  
	aso_source_endofpacket  	:out std_logic
  ) ;
end entity ; -- FFT_input_adap

architecture arch of FFT_input_adap is
begin
	aso_source_data(0)<= '1' when INVERT else '0';
	aso_source_data(DATA_WIDTH*2 downto 1)<=asi_sink_data;
	--handshake signal generation
		--input
		asi_sink_ready<=aso_source_ready;
		--output
		aso_source_valid<=asi_sink_valid;
		aso_source_startofpacket <=asi_sink_startofpacket ;
		aso_source_endofpacket<=asi_sink_endofpacket;
		aso_source_error<=asi_sink_error;
end architecture ; -- arch