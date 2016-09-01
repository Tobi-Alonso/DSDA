--packs
	library ieee;
	use ieee.std_logic_1164.all;

entity FFT_share is
  generic(
	DATA_0_WIDTH : integer := 16;
	DATA_1_WIDTH : integer := 16;
	DATA_OUT_WIDTH : integer := 16
	);
  port (
	csi_clk: in std_logic;
	rsi_reset: in std_logic;

	--data input interface
		--Avalon_ST sink 0 interface
		asi_in0_valid: in std_logic;
		asi_in0_error: in std_logic_vector(1 downto 0);
		asi_in0_startofpacket: in std_logic;
		asi_in0_endofpacket: in std_logic;
		asi_in0_data: in std_logic_vector(DATA_0_WIDTH*2 downto 0);
		asi_in0_ready: out std_logic;
		--Avalon_ST sink 1 interface
		asi_in1_valid: in std_logic;
		asi_in1_error: in std_logic_vector(1 downto 0);
		asi_in1_startofpacket: in std_logic;
		asi_in1_endofpacket: in std_logic;
		asi_in1_data: in std_logic_vector(DATA_1_WIDTH*2 downto 0);
		asi_in1_ready: out std_logic;

	--FFT interface
		--Avalon_STsource fft interface
		aso_FFT_in_valid: out std_logic;
		aso_FFT_in_error: out std_logic_vector(1 downto 0);
		aso_FFT_in_startofpacket: out std_logic;
		aso_FFT_in_endofpacket: out std_logic;
		aso_FFT_in_data: out std_logic_vector(DATA_OUT_WIDTH*2 downto 0);
		aso_FFT_in_ready: in std_logic;
		--Avalon_ST sink fft interface
		asi_FFT_out_valid: in std_logic;
		asi_FFT_out_error: in std_logic_vector(1 downto 0);
		asi_FFT_out_startofpacket: in std_logic;
		asi_FFT_out_endofpacket: in std_logic;
		asi_FFT_out_data: in std_logic_vector(DATA_OUT_WIDTH*2+5 downto 0);
		asi_FFT_out_ready: out std_logic;

	--data output interface
		--Avalon_ST source 0 interface
		aso_out0_valid: out std_logic;
		aso_out0_error: out std_logic_vector(1 downto 0);
		aso_out0_startofpacket: out std_logic;
		aso_out0_endofpacket: out std_logic;
		aso_out0_data: out std_logic_vector(DATA_OUT_WIDTH*2+5 downto 0);
		aso_out0_ready: in std_logic;
		--Avalon_ST source 1 interface
		aso_out1_valid: out std_logic;
		aso_out1_error: out std_logic_vector(1 downto 0);
		aso_out1_startofpacket: out std_logic;
		aso_out1_endofpacket: out std_logic;
		aso_out1_data: out std_logic_vector(DATA_OUT_WIDTH*2+5 downto 0);
		aso_out1_ready: in std_logic;

	--conduit no loaded data error
		coe_no_data_error:  out std_logic
 	 ) ;
end entity ; -- FFT_share

architecture arch of FFT_share is
	
	--################## CONTROLER ###############

		--############# POINTER ###############
		signal mem_addr: natural range 0 to 3;
		--########### SEL_REG ###########
		signal memory: std_logic_vector(3 downto 0);
		signal mem_shift : std_logic;
		signal mem_we: std_logic;
		signal mem_din: std_logic;
		--########### CONTROL IN ###########
		type ctrl_state is (IDLE,SEL_0,SEL_1);
		signal current_state,next_state : ctrl_state;
		signal Sel_in: std_logic;
		--########### CONTROL OUT ###########
		signal Sel_out: std_logic;

begin
	--#############	 INPUT MULTIPLEXER ######################
		in_mux : process( 	Sel_in,
								asi_in0_valid,asi_in0_error,asi_in0_startofpacket,asi_in0_endofpacket,asi_in0_data,
								asi_in1_valid,asi_in1_error,asi_in1_startofpacket,asi_in1_endofpacket,asi_in1_data,
								aso_FFT_in_ready )
		begin

			asi_in0_ready<= aso_FFT_in_ready and not(Sel_in);
			asi_in1_ready<= aso_FFT_in_ready and Sel_in;					
		


			if Sel_in='0' then
				--handshake signals
				aso_FFT_in_valid <=   asi_in0_valid;
				aso_FFT_in_error <=   asi_in0_error;
				aso_FFT_in_startofpacket <=   asi_in0_startofpacket;
				aso_FFT_in_endofpacket <=   asi_in0_endofpacket;

				--data signal
				aso_FFT_in_data<=(others=>'0');
				aso_FFT_in_data(0)<=asi_in0_data(0);	--inverse bit
				aso_FFT_in_data(DATA_0_WIDTH downto 1) <=   asi_in0_data(DATA_0_WIDTH downto 1);	--imag part
				aso_FFT_in_data(DATA_0_WIDTH*2 downto DATA_0_WIDTH+1) <=   asi_in0_data(DATA_0_WIDTH*2 downto DATA_0_WIDTH+1)	;  --real part

			else
				--handshake signals
				aso_FFT_in_valid <=   asi_in1_valid;
				aso_FFT_in_error <=   asi_in1_error;
				aso_FFT_in_startofpacket <=   asi_in1_startofpacket;
				aso_FFT_in_endofpacket <=   asi_in1_endofpacket;

				--data signal
				aso_FFT_in_data<=(others=>'0');
				aso_FFT_in_data(0)<=asi_in1_data(0);	--inverse bit
				aso_FFT_in_data(DATA_1_WIDTH downto 1) <=   asi_in1_data(DATA_1_WIDTH downto 1);--imag part
				aso_FFT_in_data(DATA_1_WIDTH*2 downto DATA_1_WIDTH+1) <=   asi_in1_data(DATA_1_WIDTH*2 downto DATA_1_WIDTH+1)	;  --real part	
			end if ;
		end process ; -- in_mux

	--#############	 OUTPUT DEMULTIPLEXER ######################
		--data signals
		aso_out0_data<=asi_FFT_out_data;
		aso_out1_data<=asi_FFT_out_data;

		--handshake signals
		out_demux : process( 	Sel_out,
								asi_FFT_out_valid,asi_FFT_out_error,asi_FFT_out_startofpacket,asi_FFT_out_endofpacket,asi_FFT_out_data,
								aso_out0_ready,aso_out1_ready )
		begin
			--default values
			aso_out0_valid <=   '0';
			aso_out0_error <=   "00";
			aso_out0_startofpacket <=   '0';
			aso_out0_endofpacket <=   '0';

			aso_out1_valid <=   '0';
			aso_out1_error <=   "00";
			aso_out1_startofpacket <=   '0';
			aso_out1_endofpacket <=   '0';

			if Sel_out='0' then
				aso_out0_valid <=   asi_FFT_out_valid;
				aso_out0_error <=   asi_FFT_out_error;
				aso_out0_startofpacket <=   asi_FFT_out_startofpacket;
				aso_out0_endofpacket <=   asi_FFT_out_endofpacket;

				asi_FFT_out_ready<=aso_out0_ready;

			else
				aso_out1_valid <=   asi_FFT_out_valid;
				aso_out1_error <=   asi_FFT_out_error;
				aso_out1_startofpacket <=   asi_FFT_out_startofpacket;
				aso_out1_endofpacket <=   asi_FFT_out_endofpacket;

				asi_FFT_out_ready<=aso_out1_ready;
				
			end if ;
		end process ; -- in_mux

	--################## CONTROLER ###############

		--############# POINTER ###############
			point : process( csi_clk,rsi_reset)
				begin
				  if( rsi_reset = '1' ) then
				    mem_addr<=0;
				    coe_no_data_error<='0';
				  elsif( rising_edge(csi_clk) ) then
				 	 coe_no_data_error<='0'; --default value
					if mem_shift='1' then

						if mem_we='1' then
							null;
						else
							if mem_addr/=0 then					
								mem_addr<=mem_addr-1;	
							end if ;			
						end if ;

						if mem_addr=0 then
							coe_no_data_error<='1';
						end if ;						
					else
						if mem_we='1' then
							mem_addr<=mem_addr+1;	
						else
							null;			
						end if ;			
					end if ;
				  end if ;
				end process ; -- point

		--########### SEL_REG ###########
			sel_register : process( csi_clk,rsi_reset )
			begin
			  if(rsi_reset = '1' ) then
			    	memory<= (others=>'0');
			  elsif( rising_edge(csi_clk) ) then
				if mem_shift ='1' then
					if mem_we='1' then
						memory(2 downto 0)<=memory(3 downto 1);
						memory(mem_addr-1)<=mem_din;
						memory(3)<='0';
					else						
						memory(2 downto 0)<=memory(3 downto 1);
						memory(3)<='0';
					end if ;
				else
					if mem_we='1' then
						memory(mem_addr)<=mem_din;
					end if ;
				end if ;
			  end if ;
			end process ; -- sel_register

		--########### CONTROL IN ###########
			current_state_logic : process( csi_clk, rsi_reset )
			begin
			  if( rsi_reset = '1' ) then
			    	current_state<=IDLE;
			  elsif( rising_edge(csi_clk) ) then
				current_state<=next_state;
			  end if ;
			end process ; -- current_state_logic

			nex_state_logic : process( current_state, aso_FFT_in_ready,
											asi_in0_startofpacket,asi_in0_valid,asi_in0_endofpacket,
											asi_in1_startofpacket,asi_in1_valid,asi_in1_endofpacket )
			begin
				case( current_state ) is
				
					when IDLE =>
						if (asi_in0_startofpacket and asi_in0_valid) ='1' then
							next_state<= SEL_0;
						else
							if (asi_in1_startofpacket and asi_in1_valid) = '1' then
								next_state<=SEL_1;
							else
								next_state<=IDLE;
							end if ;
						end if ;
						
					when SEL_0 =>
						if (asi_in0_valid and asi_in0_endofpacket and aso_FFT_in_ready) = '1' then
							next_state<=IDLE;
						else
							next_state<=SEL_0;
						end if ;

					when SEL_1=>
						if (asi_in1_valid and asi_in1_endofpacket and aso_FFT_in_ready)='1' then
							next_state<=IDLE;
						else
							next_state<=SEL_1;
						end if ;
				
				end case ;
			end process ; -- nex_state_logic

			output_logic : process( current_state,
											asi_in0_startofpacket,asi_in0_valid,
											asi_in1_startofpacket,asi_in1_valid )
			begin
				mem_we<='0';
				mem_din<='0';
				Sel_in<='0';
				case( current_state ) is
				
					when IDLE =>
						if (asi_in0_startofpacket and asi_in0_valid) = '1' then
							mem_we<='1';
						else
							if (asi_in1_startofpacket and asi_in1_valid) = '1' then
								mem_we<='1';
								mem_din<='1';
							end if ;
						end if ;
						
					when SEL_0 =>
						null;

					when SEL_1=>
						Sel_in<='1';
				
				end case ;
				
			end process ; -- output_logic

		--########### CONTROL OUT ###########
			mem_shift <= asi_FFT_out_endofpacket and asi_FFT_out_valid and not( not(asi_FFT_out_error(0)) and asi_FFT_out_error(1)) and aso_out0_ready when Sel_out='0' else
							asi_FFT_out_endofpacket and asi_FFT_out_valid and not( not(asi_FFT_out_error(0)) and asi_FFT_out_error(1))  and aso_out1_ready;

			Sel_out<= memory(0);

end architecture ; -- arch