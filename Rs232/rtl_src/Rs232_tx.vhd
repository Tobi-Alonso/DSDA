--Rs232 transmiter top level
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

	entity Rs232_tx is
 	 	port(
 	 		--clock related
			clk_50M:	in std_logic;
			clk_sel:	in std_logic_vector(1 downto 0);	--the RS232 frecuency is choosen by this inputs
			--ON signal
			ini_tx:		in std_logic;
			--message selection
			ph_sel:		in std_logic_vector(CANT_PHRASES-1 downto 0);	--the rising edge of each input triggers the transmision of one phrase
			all_p:		in std_logic;			--the rising edge of this input triggers the transmision of all the phrases
			--outputs
			not_estable_frec:	out std_logic;	-- to LED that indicates that the sistem it's not working due to the pll isn't locked
			tx:					out std_logic; 	--bitstream, to rs232 interfase
			transmitting:		out std_logic;	--to LED that indicates that the sistem is transmitting in that moment
			tx_active:			out std_logic 	--to LED that indicates that the sistem is turn ON and it has been reset
	  	) ;
	end entity ; -- Rs232_tx

	architecture arch of Rs232_tx is
	
		--internal signals
			signal pll_out_wire: std_logic;
			signal pll_lock_wire: std_logic;
			signal meta_wire: std_logic;
			signal sync_pll_lock_wire: std_logic;
			signal tx_clk_wire: std_logic;
			signal rst_wire_clk_tx : std_logic;
			signal rst_wire: std_logic;
			signal char_ready_wire: std_logic;
			signal info_bit_wire: std_logic;
			signal last_bit_wire: std_logic;
			signal parity_bit_wire: std_logic;
			signal ready2send_wire: std_logic;
			signal calc_parity_wire: std_logic;
			signal shift_reg_wire: std_logic;
			signal start_timer_wire: std_logic;
			signal not_rst_wire: std_logic;
			signal ph_sel_inv:	std_logic_vector(CANT_PHRASES-1 downto 0);

			signal data_bus: std_logic_vector(CHAR_WIDTH-1 downto 0);
			signal parity_bus: std_logic_vector(CHAR_WIDTH-1 downto 0);

		begin
		--LSB in shift register to control unit
			info_bit_wire<=parity_bus(0);

		--inversion of phrase selector due to the push bottons have a pull up resistor  and the sistem was designed for pull down resistor
			ph_sel_inversion: for i in 0 to CANT_PHRASES-1 generate
				inv: inversor 	port map(ph_sel(i),ph_sel_inv(i));
			end generate ; -- ph_sel_inversion

		--the PLL generates a 230400Hz clock from the 50 MHz clock provided on the board
			pll: ip_pll 						port map('0',clk_50M,pll_out_wire,pll_lock_wire );
		--frecDivider generates the 4 posible RS232 frecuencies from the 230400Hz clock provided by the PLL
			frec_div: FrecDivider 	generic map(HALF_COUNT_115200,HALF_COUNT_38400,HALF_COUNT_9600,HALF_COUNT_4800)
															port map(pll_out_wire,rst_wire_clk_tx,clk_sel,tx_clk_wire );
		--pll lock output sincronizer. 
			lock_sink:	reg	generic map(2)	
									port map(d(0)=>pll_lock_wire,d(1)=>meta_wire,rst=>rst_wire,		
									clk=>tx_clk_wire,q(0)=>meta_wire, q(1)=>sync_pll_lock_wire );
		--shift register used for the serial to parallel conversion
			shift_register: shift_reg	generic map(CHAR_WIDTH)
																port map(data_bus,rst_wire,tx_clk_wire,shift_reg_wire,char_ready_wire,parity_bus );
		--reset blocks that generate a short rst pulse for the frec. divider and a larger pulse for the rest of the sistem
			reset_mod_clk_tx: Reset_module	generic map(5)
																			port map(pll_out_wire,ini_tx,rst_wire_clk_tx );
			reset_mod: Reset_module			generic map(5)
																	port map(tx_clk_wire,ini_tx,rst_wire );						
		--not_estable_frec output logic
			inversor1: inversor			port map(sync_pll_lock_wire,not_estable_frec );
		-- block that provides the parity bit
			parity_calc: Parity_cal	port map(tx_clk_wire,calc_parity_wire,parity_bus,parity_bit_wire );
		--tx_active output logic
			inversor2: inversor			port map(rst_wire,not_rst_wire );
			and_g: and_gate					port map(not_rst_wire,ini_tx,tx_active );
		--timer that tells the control unit when the MSB is been transmited
			shift_timer: timer			port map(tx_clk_wire,rst_wire,start_timer_wire,last_bit_wire);
		--block in charge of procesion the phrases request and loading to the shift register each charater from the memory
			phrase_lr:Phrase_loader	port map(
												clk=>tx_clk_wire,
												ph_sel=>ph_sel,
												all_p=>all_p,
												rst=>rst_wire,
												ready=>ready2send_wire,

												char=>data_bus,
												char_ready=>char_ready_wire
											);
			--RS232 control unit
				rs232_ctrl:Rs232_control	port map( 
													clk=>tx_clk_wire,
													estable_frec=>sync_pll_lock_wire,
													char_rdy=>char_ready_wire,
													info_bit=>info_bit_wire,
													last_bit_L=>last_bit_wire,
													parity_bit=>parity_bit_wire,
													rst=>rst_wire,

													transmitting=>transmitting,
													ready=>	ready2send_wire,	
													calc_parity=>calc_parity_wire,
													tx=>tx,			
													next_bit=>shift_reg_wire,		
													start_timer=>start_timer_wire
											 	 ) ;
	end architecture ; -- arch