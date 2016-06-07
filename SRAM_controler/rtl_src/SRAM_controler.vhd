--SRAM controler top level
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.SRAM_controler_pack.all;

entity SRAM_controler is
generic(	DATA_WIDTH: integer :=16;
			ADDR_WIDTH: integer:=20);
  port (
	clock: 		in std_logic;
	rst:			in std_logic;
	--sistem intarfase
	wr:			in std_logic;
	rd: 			in std_logic;
	AddrIN:	in std_logic_vector(ADDR_WIDTH-1 downto 0);
	SDB:		inout std_logic_vector(DATA_WIDTH-1 downto 0);	--sistem data bus
	eoop: 		out std_logic;
	--memory interfase
	CE_L:			out std_logic;
	WE_L:			out std_logic;
	OE_L:			out std_logic;
	UB_L:			out std_logic;
	LB_L:			out std_logic;
	MDB:			inout std_logic_vector(DATA_WIDTH-1 downto 0);	--memoriy data interfase
	AddrOUT:		out std_logic_vector(ADDR_WIDTH-1 downto 0)
  ) ;
end entity ; -- SRAM_controler

architecture arch of SRAM_controler is
	--internal signals
		signal LatchEN_wire: std_logic;
		signal FilteredLatchEN_wire: std_logic;

		signal load_wire: std_logic;
		signal ld1_2_wire: std_logic;
		signal dr_o2m_wire: std_logic;
		signal dr_o2s_wire: std_logic;

	begin

		CU: ControlUnit	port map(
										clock=> clock , 	 
										rst=> rst , 
										--interfase to sistem	 
										rd=>  rd,		 
										wr=>  wr,		 
										eoop=>eoop  ,	
										--controler signals		 
										LatchAddr_L=> LatchEN_wire ,	 
										DR_LD=> load_wire ,		 
										LD_S_M=>ld1_2_wire  , 		 
										DR_O2M=> dr_o2m_wire,		 
										DR_O2S=> dr_o2s_wire ,		 

										-- memory control output
										CE_L=>  CE_L,			 
										WE_L=>  WE_L,			 
										OE_L=>  OE_L,			 
										UB_L=>  UB_L,			 
										LB_L=>  LB_L
									);

		DataReg: DoubleInOutReg	generic map(DATA_WIDTH)
										port map(	clock=>  clock, 		 
													rst=> rst ,			 
													--load control inputs
													load=> load_wire , 		 
													ld1_2=> ld1_2_wire ,		 
													--output control inputs
													OE1=>  dr_o2m_wire,		 
													OE2=>dr_o2s_wire  ,		 
													--data input output ports
													IO1=>MDB , 		
													IO2=>  SDB				
											);


		AdrrLatch:  MyLatch 	generic map(ADDR_WIDTH)
									port map( 	EN=> FilteredLatchEN_wire, 
												Din=>AddrIN ,
												Dout=>   AddrOUT
										);

		GitchFilter: ffd	port map( 	d => LatchEN_wire,	
									rst=> rst,	
									clk=>clock	,	
									q =>FilteredLatchEN_wire	
						);





end architecture ; -- arch