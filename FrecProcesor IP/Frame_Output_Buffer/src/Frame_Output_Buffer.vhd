--packs
	library ieee;
	use ieee.std_logic_1164.all;
	
entity Frame_Output_Buffer is
  generic(
	FFT_LENGTH : integer := 2048;
	FRAME_SIZE: integer := 128;
	DATA_WIDTH : integer := 16;
	DELAY: integer:= 128
	);
  port (
	csi_clk: in std_logic;
	rsi_reset: in std_logic;
	--Avalon_ST sink interfase
	asi_valid: in std_logic;
	asi_error: in std_logic_vector(1 downto 0);
	asi_startofpacket: in std_logic;
	asi_endofpacket: in std_logic;
	asi_data: in std_logic_vector(DATA_WIDTH*2-1 downto 0);
	asi_ready: out std_logic;
	--output interfase (Avalon conduit)
	coe_async_next: in std_logic;
	coe_real_out: out std_logic_vector(DATA_WIDTH-1 downto 0);
	coe_imag_out: out std_logic_vector(DATA_WIDTH-1 downto 0);
	coe_error_out: out std_logic_vector(2 downto 0)
  ) ;
end entity ; -- Frame_Output_Buffer

architecture arch of Frame_Output_Buffer is
	
	--log2ceil function definition
		function log2ceil (n : integer) return integer is
			variable m, p : integer;
		begin
			 m := 0;
			 p := 1;
			 for i in 0 to n loop
			    if p < n then
			      m := m + 1;
			      p := p * 2;
			    end if;
			 end loop;
			return m;
		end function;
	
	--component declaration
		component Frame_Output_Buffer_ctrl is
			generic(
				FFT_LENGTH : integer := 2048;
				FRAME_SIZE: integer := 128;
				DELAY: integer:= 128
				);
			port (
				clock : in std_logic;
				reset : in std_logic;
				--Avalon-ST hdsk signals
				valid : in std_logic;
				sop : in std_logic;
				eop : in std_logic;
				err : in std_logic_vector(1 downto 0);
				ready : out std_logic;
				--internal signals
				next_edge : in std_logic;
				max_addr : in std_logic;
				we : out std_logic;
				err_out: out std_logic
			  ) ;
		end component ; -- Frame_Output_Buffer_ctrl

		component FIFO is
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
		end component ; -- FIFO

		component Counter_1 is
			generic(
				ADDR_LENGTH: integer :=7
				);
			port (
				clock: in std_logic;
				reset: in std_logic;
				inc: in std_logic;
				dec: in std_logic;
				out_count: out std_logic_vector(ADDR_LENGTH-1 downto 0);
				max_value: out std_logic;
				dec_error: out std_logic
			  ) ;
		end component ; -- Counter_1

		component Edge_detector is
		  port (
			clock: in std_logic;
			reset: in std_logic;
			next_data: in std_logic;
			next_fall_edge: out std_logic
		  ) ;
		end component ; -- Edge_detector

	signal aux_async  : std_logic;
	signal wire_next : std_logic;
	signal wire_we_inc   : std_logic;
	signal wire_shift_dec   : std_logic;
	signal wire_max_addr   : std_logic;
	signal wire_error: std_logic;

	signal bus_fifo_addr : std_logic_vector( log2ceil ( FRAME_SIZE) +1-1 downto 0);





begin

	--component instantiation
		control:  Frame_Output_Buffer_ctrl 
			generic map(
				FFT_LENGTH  => FFT_LENGTH  ,
				FRAME_SIZE =>  FRAME_SIZE 
				)
			port map(
				clock  => csi_clk  ,
				reset  => rsi_reset  ,
				--Avalon-ST hdsk signals
				valid  =>  asi_valid ,
				sop  =>   asi_startofpacket,
				eop  =>   asi_endofpacket,
				err  =>  asi_error ,
				ready  => asi_ready  ,
				--internal signals
				next_edge  => wire_shift_dec  ,
				max_addr  =>  wire_max_addr ,
				we  =>  wire_we_inc ,
				err_out =>   coe_error_out(0)
			  ) ;

		real_fifo: FIFO 
			generic map(
			  	ADDR_LENGTH =>  log2ceil ( FRAME_SIZE) +1,
			  	DATA_WIDTH  =>   DATA_WIDTH
			  	)
		 	port map(
				clock  => csi_clk  ,
				reset =>   rsi_reset,
				--control signals
				we => wire_we_inc  ,
				shift =>   wire_shift_dec,
				address =>  bus_fifo_addr ,
				writedata =>  asi_data(DATA_WIDTH*2-1 downto DATA_WIDTH),
				readdata  =>   coe_real_out
			  ) ;

		imag_fifo:  FIFO 
			generic map(
			  	ADDR_LENGTH =>  log2ceil ( FRAME_SIZE) +1  ,
			  	DATA_WIDTH  =>   DATA_WIDTH
			  	)
		 	port map(
				clock  =>csi_clk   ,
				reset => rsi_reset  ,
				--control signals
				we =>  wire_we_inc ,
				shift =>  wire_shift_dec ,
				address =>  bus_fifo_addr ,
				writedata =>  asi_data(DATA_WIDTH-1 downto 0),
				readdata  =>  coe_imag_out 
			  ) ;

		pointer_generator:  Counter_1 
			generic map(
				ADDR_LENGTH =>  log2ceil ( FRAME_SIZE) +1
				)
			port map(
				clock => csi_clk  ,
				reset => rsi_reset  ,
				inc =>  wire_we_inc ,
				dec =>  wire_shift_dec ,
				out_count =>  bus_fifo_addr ,
				max_value =>   wire_max_addr,
				dec_error =>  coe_error_out(1)
			  ) ;

		Next_detect: Edge_detector 
		  port map(
			clock =>  csi_clk ,
			reset =>  rsi_reset ,
			next_data => wire_next  ,
			next_fall_edge =>  wire_shift_dec 
		  ) ;

	coe_error_out(2)<= '1' when asi_error/="00" else '0'; --asi_error carries error from previous procesing stages
	
	sync_next : process( csi_clk,rsi_reset )
	begin
		if rsi_reset='1' then
			aux_async<='0';
			wire_next<='0';
		elsif( rising_edge(csi_clk) ) then
			aux_async<=coe_async_next;
			wire_next<=aux_async;
		end if ;
	end process ; -- sync_next

end architecture ; -- arch