--package
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

package Rs232_tx_pack is

	--Declaration of divider constants for pll clock out@230400Hz
		constant HALF_COUNT_115200: integer:= 1;
		constant HALF_COUNT_38400: integer:= 3;
		constant HALF_COUNT_9600: integer:= 12;
		constant HALF_COUNT_4800: integer:= 24;

	--Data parameters
		constant CHAR_WIDTH: integer:=8;																		--when changed, must change EOF,MEMORY
		constant MAX_CHARS: integer:=40;																		--when changed, must change addr_length
		constant EOP_CHAR: std_logic_vector(CHAR_WIDTH-1 downto 0):=x"00";	--End Of Phrase
		constant CANT_PHRASES: integer:=4;															--when changed, must change pointers,addr_length
		constant ADDR_LENGTH: natural:= 8;
		constant MEM_SIZE: natural := 2**ADDR_LENGTH;

		--Pointers to phrases
			type matrix is array (integer range <>) of std_logic_vector(ADDR_LENGTH-1 downto 0);
			constant POINTERS: matrix(0 to CANT_PHRASES-1):=(	std_logic_vector(to_unsigned(0,ADDR_LENGTH)),
																std_logic_vector(to_unsigned(MAX_CHARS,ADDR_LENGTH)),
																std_logic_vector(to_unsigned(2*MAX_CHARS,ADDR_LENGTH)),
																std_logic_vector(to_unsigned(3*MAX_CHARS,ADDR_LENGTH))
																 );
			constant PTR_SEL_WIDTH: integer:=2;

		--memory data
			type mem_type is array (MEM_SIZE-1 downto 0)of
									std_logic_vector(CHAR_WIDTH-1 downto 0);
			constant MEMORY: mem_type:=(
				--phrase 1
				000 => x"4C", 001 => x"61", 002 => x"62", 003 => x"3A", 004 => x"20", 005 => x"63", 006 => x"6F", 007 => x"6D", 
				008 => x"70", 009 => x"6C", 010 => x"65", 011 => x"74", 012 => x"61", 013 => x"64", 014 => x"6F", 015 => x"20", 
				016 => x"70", 017 => x"6F", 018 => x"72", 019 => x"20", 020 => x"54", 021 => x"6F", 022 => x"62", 023 => x"69", 
				024 => x"20", 025 => x"50", 026 => x"69", 027 => x"63", 028 => x"6E", 029 => x"61", 030 => x"0A", 031 => x"0D", 

				--phrase 2
				040 => x"43", 041 => x"75", 042 => x"72", 043 => x"73", 044 => x"6F", 045 => x"20", 046 => x"31", 047 => x"65", 
				048 => x"72", 049 => x"20", 050 => x"45", 051 => x"73", 052 => x"63", 053 => x"75", 054 => x"65", 055 => x"6C", 
				056 => x"61", 057 => x"20", 058 => x"53", 059 => x"45", 060 => x"0A", 061 => x"0D", 

				--phrase 3
				080 => x"68", 081 => x"6F", 082 => x"6C", 083 => x"61", 084 => x"20", 085 => x"6D", 086 => x"75", 087 => x"6E", 
				088 => x"64", 089 => x"6F", 090 => x"0A", 091 => x"0D", 

				--phrase 4
				120 => x"50", 121 => x"61", 122 => x"72", 123 => x"61", 124 => x"20", 125 => x"65", 126 => x"6C", 127 => x"20", 
				128 => x"70", 129 => x"72", 130 => x"6F", 131 => x"66", 132 => x"65", 133 => x"20", 134 => x"71", 135 => x"75", 
				136 => x"65", 137 => x"20", 138 => x"6C", 139 => x"6F", 140 => x"20", 141 => x"6D", 142 => x"69", 143 => x"72", 
				144 => x"61", 145 => x"20", 146 => x"70", 147 => x"6F", 148 => x"72", 149 => x"20", 150 => x"68", 151 => x"69", 
				152 => x"70", 153 => x"65", 154 => x"72", 155 => x"74", 156 => x"65", 157 => x"72", 158 => x"6D", 159 => x"69", 
				160 => x"6E", 161 => x"61", 162 => x"6C", 163 => x"0A", 164 => x"0D", 
				--others
				others=> x"00"
			);


	--Declaracion of parity function
		function parity (word: in std_logic_vector) return std_logic;

	--declaracion of components
		--declaration of register
			component reg is
				generic(REG_WIDTH: natural:=8);
				port(
					d :		in std_logic_vector(REG_WIDTH-1 downto 0);
					rst:	in std_logic;
					clk:	in std_logic;
					q : 	out std_logic_vector(REG_WIDTH-1 downto 0));
			end component reg;

		--declaration of shift register
			component shift_reg is
				generic(REG_WIDTH: natural:=8);
				port(
					d :		in std_logic_vector(REG_WIDTH-1 downto 0);
					rst:	in std_logic;
					clk:	in std_logic;
					shift:	in std_logic;
					load:	in std_logic;
					q : 	out std_logic_vector(REG_WIDTH-1 downto 0));
			end component;

		--declaration of timer
			component Timer is
				generic( timeout: integer:= CHAR_WIDTH);
			    port (clk:	in std_logic;
			  		rst:	in std_logic;
			  		start:	in std_logic;
			  		over:	out std_logic
			  ) ;
			end component ; -- Timer

		--declaration of parity calculator
			component Parity_cal is
			  	port (
					clk:	in std_logic;
					calc:	in std_logic;
					char:	in std_logic_vector(CHAR_WIDTH-1 downto 0);

					parity_bit:	out std_logic
			 	 ) ;
			end component ; -- Parity_cal
		
		--declaration of frecuency divider
			component FrecDivider is
				generic(
						--Declaration of divider constants
							HALF_COUNT_00: integer:= 1;
							HALF_COUNT_01: integer:= 3;
							HALF_COUNT_10: integer:= 12;
							HALF_COUNT_11: integer:= 24
					);
				
				port(	clock_pll: 	in std_logic;
						rst:		in std_logic;
						clock_sel:	in std_logic_vector(1 downto 0);
						clock_out:	out std_logic
					);
				
			end component FrecDivider;

		--declaration of reset module
			component Reset_module is
				generic(RST_WIDTH: integer:=7);
			  	port (
					clk: 	in std_logic;
					init:	in std_logic;
					rst:	out std_logic
			 	 ) ;
			end component ; -- Reset_module

		--declaration of phrase loader (loads the phrase/s selected)
			component Phrase_loader is
			  	port (
					clk:	in std_logic;
					ph_sel:	in std_logic_vector(CANT_PHRASES-1 downto 0);
					all_p:	in std_logic;
					rst:	in std_logic;
					ready:	in std_logic;

					char:		out std_logic_vector(CHAR_WIDTH-1 downto 0);
					char_ready:	out std_logic

			 	 ) ;
			end component ; -- Phrase_loader

			--declaration of counter
				component Counter is
					generic(LENGTH: integer:=4);
				 	port (
						clk:		in std_logic;
						rst:		in std_logic;
						inc:		in std_logic;
						load: 		in std_logic;
						start_num:	in std_logic_vector(LENGTH-1 downto 0);
						count_out:	out std_logic_vector(LENGTH-1 downto 0);
						overflow:	out std_logic
				 	) ;
				end component ; -- Counter

			--declaration of pointer generator
				component Pointer_generator is
				  port (
						ptr_sel:	in std_logic_vector(1 downto 0);
						ptr:		out std_logic_vector(ADDR_LENGTH-1 downto 0)
				  ) ;
				end component ; -- Pointer_generator

			--declaration of phrase loader control
				component Phrase_loader_control is
				  	port (
							clk:	in std_logic;
							eop:	in std_logic;
							ph_sel:	in std_logic_vector(CANT_PHRASES-1 downto 0);
							all_p:	in std_logic;
							rst:	in std_logic;
							ready:	in std_logic;

							ptr_sel:	out std_logic_vector(PTR_SEL_WIDTH-1 downto 0);
							next_char:	out std_logic;
							load_ptr:	out std_logic;
							char_ready:	out std_logic

					 	 ) ;
				end component ; -- Phrase_loader_control


			--declaration of null detector
				component Null_detector is
				  port (
						char:		in std_logic_vector(CHAR_WIDTH-1 downto 0);
						eop:	out std_logic
				  ) ;
				end component ; -- Null_detector

			--declaration of 2*n to n Mux
				component Mux is
					generic(BUS_WIDTH: integer:=4
					 );
				  	port (
				  		in0:	in std_logic_vector(BUS_WIDTH-1 downto 0);
				  		in1:	in std_logic_vector(BUS_WIDTH-1 downto 0);
				  		sel:	in std_logic;
				  		z:		out std_logic_vector(BUS_WIDTH-1 downto 0)
				  	) ;
				end component ; -- Mux


			--declaration of ROM memory
				component ROM_memory is
					port(
						clk:		in std_logic;
						address:	in std_logic_vector(ADDR_LENGTH-1 downto 0);
						data_out:	out std_logic_vector(CHAR_WIDTH-1 downto 0)
					);
				end component ROM_memory;

		--declaration of RS232 tx controler
			component Rs232_control is
			  	port (
							clk:			in std_logic;
							estable_frec:	in std_logic;
							char_rdy:		in std_logic;
							info_bit:		in std_logic;
							last_bit_L:		in std_logic;
							parity_bit:		in std_logic;
							rst:			in std_logic;

							transmitting:	out std_logic;
							ready:			out std_logic;
							calc_parity:	out std_logic;
							tx:				out std_logic;
							next_bit:		out std_logic;
							start_timer:	out std_logic
			 	 ) ;
			end component ; -- Rs232_control

		--declaration of inversor
			component inversor is
			  port (
					in_value: in std_logic;
					out_value: out std_logic
			  ) ;
			end component ; -- inversor

		--declaration of AND gate
			component and_gate is
			  port (
				in0:		in std_logic;
				in1:		in std_logic;
				out_value:	out std_logic
			  ) ;
			end component ; -- and_gate

		--declaration of pll
			component ip_pll IS
				PORT
				(
					areset		: IN STD_LOGIC  := '0';
					inclk0		: IN STD_LOGIC  := '0';
					c0			: OUT STD_LOGIC ;
					locked		: OUT STD_LOGIC 
				);
			end component ip_pll;

end package ; -- Rs232_tx_pack 

package body Rs232_tx_pack is

	--Definition of parity function
		--parity_bit= mod2(sum(byte bits))
		function parity (word: in std_logic_vector) return std_logic is
			variable parity_bit: std_logic;
			begin
				parity_bit:='0';
				for i in word'range loop
					if word(i)='1' then
						parity_bit:= not parity_bit;
					end if ;
				end loop ;
				return parity_bit;
		end function;

end Rs232_tx_pack ;