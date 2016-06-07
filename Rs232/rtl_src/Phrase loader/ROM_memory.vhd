--ROM memory
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use work.Rs232_tx_pack.all;
	
entity ROM_memory is
	port(
		clk:		in std_logic;
		address:	in std_logic_vector(ADDR_LENGTH-1 downto 0);
		data_out:	out std_logic_vector(CHAR_WIDTH-1 downto 0)
	);
end ROM_memory;

architecture sync_rom of ROM_memory is
	begin
		process (clk)
			begin
				if rising_edge(clk)then
					data_out<=MEMORY(to_integer(unsigned(address)));
				end if;
		end process;
end architecture sync_rom;