--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use work.Rs232_tx_pack.all;

entity FrecDivider is
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
	
end FrecDivider;

architecture arc_FrecDivider of FrecDivider is	
	--subtype counter is integer range 0 to max(HALF_COUNT_00,max(HALF_COUNT_01,max(HALF_COUNT_10,HALF_COUNT_11)));
	subtype counter is integer range 0 to HALF_COUNT_11; --range must be to max(HALF_COUNT_00,max(HALF_COUNT_01,max(HALF_COUNT_10,HALF_COUNT_11)
	signal count: counter:=0;
	signal state: std_logic:='0';

	begin
		division : process( clock_pll)
			variable cont_aux: counter;

			begin
				if (rising_edge(clock_pll)) then
					if rst='1' then
						count<=0;
						state<='0';
				
					else 
						cont_aux:=count+1;

						--it shifts the output every HALF_COUNT_(clock_sel) ticks
						case( clock_sel ) is
						
							when "00" =>
								if (cont_aux >= HALF_COUNT_00) then 
									cont_aux:=0;
									state<= not state;								
								end if ;

							when "01" =>
								if (cont_aux >=  HALF_COUNT_01) then 
									cont_aux:=0;
									state<= not state;									
								end if ;

							when "10" =>
								if (cont_aux >=  HALF_COUNT_10) then 
									cont_aux:=0;
									state<= not state;							
								end if ;

							when "11" =>
								if (cont_aux >= HALF_COUNT_11) then 
									cont_aux:=0;
									state<= not state;									
								end if ;

						end case ;

						count<=cont_aux;

					end if;
				end if;
		end process ; -- division
	
		clock_out<=state;
end arc_FrecDivider; -- arc_DivisorFrec