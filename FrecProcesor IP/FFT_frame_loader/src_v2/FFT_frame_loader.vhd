library IEEE;
use IEEE.std_logic_1164.all;

entity FFT_frame_loader is
 generic(	DATA_WIDTH : integer := 32;
 			FFT_LENGTH: integer := 128;
 			FRAME_SIZE: integer:= 32
 			);
  port (
	csi_clk: in std_logic;
	rsi_reset: in std_logic;
	--input Avalon-ST interface
	asi_ready: out std_logic;
	asi_valid: in std_logic;
	asi_error: in std_logic_vector(1 downto 0);
	asi_data :in std_logic_vector(DATA_WIDTH-1 downto 0);
	--Output Avalon-ST interface
	aso_ready: in std_logic;
	aso_valid: out std_logic;
	aso_error: out std_logic_vector(1 downto 0);
	aso_endofpacket: out std_logic;
	aso_startofpacket: out std_logic;
	aso_data :out std_logic_vector(DATA_WIDTH-1 downto 0)
	);
end entity ; -- FFT_frame_loader

architecture arch of FFT_frame_loader is
	component FFT_frame_loader_ctrl is
		generic(	
			FFT_LENGTH: integer := 128;
		 	FRAME_SIZE: integer:= 32
		 	);
		  port (
			clock: in std_logic;
			reset: in std_logic;
			--control signals
			shift_old : out std_logic;
			shift_new : out std_logic;
			load_old : out std_logic;
			--input handshake signals
			in_ready: out std_logic;
			in_valid: in std_logic;
			in_error: in std_logic_vector(1 downto 0);
			--output handshake signals
			out_ready: in std_logic;
			out_valid: out std_logic;
			out_error: out std_logic_vector(1 downto 0);
			out_eop: out std_logic;
			out_sop: out std_logic
		);
	end component ; -- FFT_frame_loader_ctrl

	component FFT_frame_loader_arch is
		 generic(	
		 	DATA_WIDTH : integer := 16;
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
		end component ; -- FFT_frame_loader_arch



	signal wire_shift_old       : std_logic;    
	signal wire_shift_new     : std_logic;      
	signal wire_load_old     : std_logic;      
begin

	control: FFT_frame_loader_ctrl 
				generic map(	FFT_LENGTH,
								FRAME_SIZE)
				port map(
					clock =>csi_clk ,    
					reset   => rsi_reset,    
					--control signals
					shift_old       =>wire_shift_old ,    
					shift_new     =>wire_shift_new,      
					load_old     => wire_load_old,       
					--input handshake signals
					in_ready    =>asi_ready ,      
					in_valid     => asi_valid,     
					in_error    => asi_error,     
					--output handshake signals
					out_ready  =>aso_ready ,       
					out_valid    => aso_valid,      
					out_error    => aso_error,      
					out_eop   => aso_endofpacket,       
					out_sop => aso_startofpacket );

	sistem_arch: FFT_frame_loader_arch 
					generic map(	DATA_WIDTH,
									FFT_LENGTH,
									FRAME_SIZE)
					port map(	
						clock => csi_clk    ,
						reset=>rsi_reset     ,
						--control inputs
						shift_old => wire_shift_old    ,
						shift_new =>wire_shift_new     ,
						load_old =>wire_load_old    ,
						--data ports
						data_in => asi_data    ,
						data_out =>   aso_data  
						);
end architecture ; -- arch