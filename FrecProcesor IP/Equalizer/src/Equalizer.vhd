--packs
	library ieee;
	use ieee.std_logic_1164.all;

entity Equalizer is
  generic(ADDR_LENGTH: integer:=4;
  		INIT_ADDR: integer := 0;
  		DATA_WIDTH: integer :=32;
  		LAST_ADDR : integer:= 100
  	);
  port (
	csi_clock :in std_logic;
	rsi_reset :in std_logic;
	--input buffer interface
	avm_ib_read : out std_logic;
	avm_ib_readdata: in std_logic_vector(DATA_WIDTH-1 downto 0);
	avm_ib_address :	out std_logic_vector(ADDR_LENGTH-1 downto 0);
	avm_ib_response: in std_logic_vector(1 downto 0);
	inr_new_pack : in std_logic;
	--output buffer interface
	avm_ob_write : out std_logic;
	avm_ob_writedata: out std_logic_vector(DATA_WIDTH-1 downto 0);
	avm_ob_address :	out std_logic_vector(ADDR_LENGTH-1 downto 0);
	inr_end_send : in std_logic;
	--control reg interface
	avm_ctrl_write: out std_logic;
	avm_ctrl_writedata: out std_logic_vector(7 downto 0);
	--current exponent reg interface
	avm_exp_write : out std_logic;		--load_exp 
	avm_exp_writedata: out std_logic_vector(7 downto 0);
	avm_exp_read : out std_logic;		--load_exp 
	avm_exp_readdata: in std_logic_vector(7 downto 0)
  ) ;
end entity ; -- Equalizer

architecture arch of Equalizer is
	--component declaration
		component Equalizer_ctrl is
		  port (
			clock :in std_logic;
			reset :in std_logic;
			--input buffer interface
			rd : out std_logic;
			response: in std_logic_vector(1 downto 0);
			new_pack : in std_logic;
			--output buffer interface
			wr : out std_logic;
			end_send : in std_logic;
			--current exponent reg interface
			load_exp : out std_logic;
			--counter interface
			load : out std_logic;
			inc : out std_logic;
			last :  in std_logic;
			--control reg interface
			wr_ctrl: out std_logic;
			tx_en: out std_logic;
			herm_en : out std_logic
		  ) ;
		end component ; -- Equalizer_ctrl

		component Equalizer_count is
		  generic(ADDR_LENGTH: integer:=4;
		  		INIT_ADDR: integer := 0;
		  		LAST_ADDR : integer:= 100
		  	);
		  port (
				clk:		in std_logic;
				rst:		in std_logic;
				load:	in std_logic;
				inc:		in std_logic;
				count_out:	out std_logic_vector(ADDR_LENGTH-1 downto 0);
				last:	out std_logic
		 	) ;
		end component ; -- Equalizer_count
	--control register signals
	signal ctrl_reg_tx_en:  std_logic;
	signal ctrl_reg_herm_en :  std_logic;

	--counter signals
	signal count_load :  std_logic;
	signal count_inc :  std_logic;
	signal count_last :  std_logic;

	signal bus_address : std_logic_vector(ADDR_LENGTH-1 downto 0);
	signal bus_data : std_logic_vector(DATA_WIDTH-1 downto 0);

begin
	--control register writedata
	avm_ctrl_writedata<=(0=>ctrl_reg_herm_en, 1=> ctrl_reg_tx_en,others=> '0');

	--data bus connections
	bus_data <=avm_ib_readdata;
	avm_ob_writedata <= bus_data;

	--address bus connections
	avm_ob_address<= bus_address;
	avm_ib_address <= bus_address;

	--current exponent reg interface
	avm_exp_writedata<=(others =>'0');
	avm_exp_read<='0';

	--compoenen inst
		control_unit : Equalizer_ctrl  port map(
										clock => csi_clock   ,
										reset =>  rsi_reset  ,
										--input buffer interface
										rd =>   avm_ib_read ,										
										response => avm_ib_response,
										new_pack => inr_new_pack   ,
										--output buffer interface
										wr =>  avm_ob_write  ,
										end_send =>  inr_end_send  ,
										--current exponent reg interface
										load_exp => avm_exp_write,
										--counter interface
										load =>  count_load  ,
										inc =>  count_inc  ,
										last =>  count_last  ,
										--control reg interface
										wr_ctrl => avm_ctrl_write   ,
										tx_en =>  ctrl_reg_tx_en  ,
										herm_en =>  ctrl_reg_herm_en  
									  ) ;

		Eq_count: Equalizer_count  generic map (ADDR_LENGTH => ADDR_LENGTH  ,
											  		INIT_ADDR => INIT_ADDR ,
											  		LAST_ADDR  => LAST_ADDR 
											  	)
									  port map(
											clk  => csi_clock  ,
											rst  =>  rsi_reset ,
											load  =>  count_load ,
											inc  =>  count_inc ,
											count_out  =>  bus_address ,
											last  =>  count_last 
									 	) ;
end architecture ; -- arch