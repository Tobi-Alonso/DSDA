-- SRAM controler pack
library ieee;
	use ieee.std_logic_1164.all;

package SRAM_controler_pack is
	--constant declaration
		constant DATA_WIDTH: integer :=16;
		constant ADDR_WIDTH: integer:=20;

	--component declaration
		--SREM controler declaration
			component SRAM_controler is
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
			end component ; -- SRAM_controler
		--flip flop D declaration
			component ffd is
				port(
					d :	in std_logic;
					rst:	in std_logic;
					clk:	in std_logic;
					q : 	out std_logic
					);
			end component;

		--Latch declaration
			component MyLatch is
				generic(BUS_WIDTH: integer := 8);
				  port (
					 EN: in std_logic;
					 Din:	in std_logic_vector(BUS_WIDTH-1 downto 0);
					 Dout:  out std_logic_vector(BUS_WIDTH-1 downto 0)
				  ) ;
			end component ; -- MyLatch


		--Double input output register declaration
			component DoubleInOutReg is
				generic(BUS_WIDTH: integer := 8);
				port (
					clock: 		in std_logic;
					rst:			in std_logic;
					--load control inputs
					load: 		in std_logic;
					ld1_2:		in std_logic;
					--output control inputs
					OE1:		in std_logic;
					OE2:		in std_logic;
					--data input output ports
					IO1: 		inout std_logic_vector(BUS_WIDTH-1 downto 0);
					IO2: 		inout std_logic_vector(BUS_WIDTH-1 downto 0)			
				  ) ;
			end component ; -- DoubleInOutReg

		--Control unit declaration
			component ControlUnit is
				  port (
					clock: 	in std_logic;
					rst: 	in std_logic;
					--interfase to sistem
					rd:		in std_logic;
					wr:		in std_logic;
					eoop:	out std_logic;
					--controler signals
					LatchAddr_L:	out std_logic;
					DR_LD:		out std_logic;
					LD_S_M: 		out std_logic;
					DR_O2M:		out std_logic;
					DR_O2S:		out std_logic;

					-- memory control output
					CE_L:			out std_logic;
					WE_L:			out std_logic;
					OE_L:			out std_logic;
					UB_L:			out std_logic;
					LB_L:			out std_logic
				  ) ;
			end component ; -- ControlUnit

	
end package ; -- SRAM_controler_pack 