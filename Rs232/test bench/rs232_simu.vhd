--Rs232 Test Bench
--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity Rs232_simu is 	 	
end entity ; -- Rs232_simu

architecture behav of Rs232_simu is

	signal clk: std_logic:='0';
	signal clk_sel_in: std_logic_vector(1 downto 0):="00";
	signal ini_tx_in: std_logic:='0';
	signal ph_sel_in: std_logic_vector (3 downto 0):="0000";
	signal all_p_in: std_logic;	
	signal not_estable_frec_out: std_logic;
	signal tx_out: std_logic;
	signal transmitting_out: std_logic;
	signal tx_active_out: std_logic;


begin
	U1: rs232_tx port map(clk , clk_sel_in , ini_tx_in , 
					ph_sel_in , all_p_in , 
					not_estable_frec_out , 
					tx_out , transmitting_out , tx_active_out);
	--ph_sel_in<="0000";
	clk_sel_in<="00";


	process
	begin
		clk<='1';
		wait for 10 ns;
		clk<='0';
		wait for 10 ns;
	end process;
	
	process
	begin
		ini_tx_in<='0';
		wait for 2000 ns;
		ini_tx_in<='1';
		wait;
	end process;

	process
	begin
		wait for 1000 ns;
		all_p_in <= '0';
		ph_sel_in<="0000";
		wait for 11000 ns;
		ph_sel_in<="0001";
		wait for 12000 ns;
		ph_sel_in<="0000";
		wait for 12000 ns;
		ph_sel_in<="0010";
		wait for 12000 ns;
		ph_sel_in<="0000";
		wait for 12000 ns;
		ph_sel_in<="0100";
		wait for 12000 ns;
		ph_sel_in<="0000";
		wait for 12000 ns;
		ph_sel_in<="1000";
		wait for 12000 ns;
		ph_sel_in<="0000";
		wait for 12000 ns;
		ph_sel_in<="0000";
		all_p_in <= '1';
		wait for 12000 ns;

	end process;
	
end architecture; 








	
