--phrase loader
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity Phrase_loader is
  port (
		clk:	in std_logic;
		ph_sel:	in std_logic_vector(CANT_PHRASES-1 downto 0);
		all_p:	in std_logic;
		rst:	in std_logic;
		ready:	in std_logic;

		char:		out std_logic_vector(CHAR_WIDTH-1 downto 0);
		char_ready:	out std_logic

 	 ) ;
end entity ; -- Phrase_loader

architecture arch of Phrase_loader is
	--Internal signals declarations
	signal load_ptr_wire: std_logic;
	signal next_char_wire: std_logic;
	signal eop_wire: std_logic;

	signal ptr_sel_bus: std_logic_vector(PTR_SEL_WIDTH-1 downto 0);
	signal ptr_bus: std_logic_vector(ADDR_LENGTH-1 downto 0);
	signal counter_out_bus: std_logic_vector(ADDR_LENGTH-1 downto 0);
	signal address_bus: std_logic_vector(ADDR_LENGTH-1 downto 0);
	signal data_bus: std_logic_vector(CHAR_WIDTH-1 downto 0);


	begin
		--counter used to address the characters in the ROM memory
			count: Counter 	generic map(ADDR_LENGTH)
						port map(clk,'0',next_char_wire,load_ptr_wire,ptr_bus,counter_out_bus,open);
		
		--block that provides the pointer to the phrase requested				
			Pointer_gen:Pointer_generator port map(ptr_sel_bus,ptr_bus);
		--phrase loader control unit				
			PLControl: Phrase_loader_control port map(
							clk=>clk,
							eop=>eop_wire,
							ph_sel=>ph_sel,
							all_p=>all_p,
							rst=>rst,
							ready=>ready,

							ptr_sel=>ptr_sel_bus,
							next_char=>	next_char_wire,
							load_ptr=>	load_ptr_wire,
							char_ready=> char_ready
						);
		--Mux used to simplify and reduce the states of the control unit and it reduces the reaction time			
			addr_mux: Mux 		generic map(ADDR_LENGTH)	
								port map(counter_out_bus,ptr_bus,load_ptr_wire,address_bus  );
		--memory that holds the phrases
			memory: ROM_memory 	port map(clk,address_bus,data_bus );
		--block the detects the NULL caracter, which indicates the prhase end
			Null_detect:Null_detector port map(data_bus,eop_wire);
							
		char<=data_bus;


end architecture ; -- arch