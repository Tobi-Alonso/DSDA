--DoubleInOutReg
--includes
	library ieee;
	use ieee.std_logic_1164.all;

	entity DoubleInOutReg is
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
	end entity ; -- DoubleInOutReg
	
	architecture arch of DoubleInOutReg is
		signal data: std_logic_vector(BUS_WIDTH-1 downto 0);
	begin
		load_process : process( clock )
		begin
			if( rising_edge(clock) ) then
				if rst='1' then
					data<=(others=>'0');
				elsif load='1' then
						if ld1_2='1' then
							data<=IO1;
						else
							data<=IO2;
						end if ;
				end if ;
			end if ;
		end process ; -- load_process
		
		--output logic
		IO1<=data when (OE1='1' and( load='0' or ld1_2='0'))	else (others=>'Z');
		IO2<=data when (OE2='1' and( load='0' or ld1_2='1'))	else (others=>'Z');
			
	end architecture ; -- arch