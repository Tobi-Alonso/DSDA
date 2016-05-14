--includes
	library ieee;
	use ieee.std_logic_1164.all;

entity tb_sintetizadorFrecconPLL is
end tb_sintetizadorFrecconPLL;

architecture arc_tb_sintetizadorFrecconPLL of tb_SintetizadorFrecconPLL is

	--Declaracion de constantes de division de frecuencia
		Constant SEMI_T_01: 	time:= 5 sec;
		Constant SEMI_T_05: 	time:= 1 sec;
		Constant SEMI_T_1: 		time:= 500 ms;
		Constant SEMI_T_2:		time:= 250 ms;
		Constant SEMI_T_5: 		time:= 100 ms;
		Constant SEMI_T_50MHZ:	time:= 10 ns;
		constant SEMI_T_1200:	time:= 416 us; -- aprox

	--estimulos
		signal	clock_50: 	 std_logic:='0';	--iniciacion de clock en 0
		signal	clock_sel:	 std_logic_vector(2 downto 0):="111"; --inicializacion con clock out deshablititado
		signal	clock_out:	 std_logic;
		signal	siete_seg1:	 std_logic_vector(6 downto 0);
		signal	siete_seg0:	 std_logic_vector(6 downto 0);
		signal	pll_lock:	std_logic;

	--declaracion de DUT
		component sintetizadorFrecconPLL is
			port(	clock_50: 	in std_logic;
					clock_sel:	in std_logic_vector(2 downto 0);
					clock_out:	out std_logic;
					siete_seg1:	out std_logic_vector(6 downto 0);
					siete_seg0:	out std_logic_vector(6 downto 0);
					pll_lock:	out std_logic
			);
		end component sintetizadorFrecconPLL;

	--parametros de test
		constant VUELTAS: integer:=1;--numero de periodos en que testeamos el sistema


	begin
		--instanciacion de DUT
			DUT: SintetizadorFrecconPLL port map(clock_50,clock_sel,clock_out,siete_seg1,siete_seg0,pll_lock);

		--generacion del relog
			clock_50<= not (clock_50) after SEMI_T_50MHZ;

		estimulos : process

			variable taux: time;


			begin
				
			
				wait until (pll_lock='1'); -- espero a que el PLL se enganche

				--test de clock de 5Hz 
					wait for SEMI_T_1200;	  	-- espero para no generar carreras
					clock_sel<= "100";			--selecciono salida de 5 Hz
					wait until clock_out'event;	--me sincronizo con el clk de salida
			
					taux:=now;

					test_clk_5 : for i in 0 to (VUELTAS*2-1) loop		
							wait until clock_out'event;
							assert (SEMI_T_5=now-taux)	--verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 5Hz: "& time'image(now-taux)
								severity ERROR;
							taux:=now;
						
					end loop ; -- test_clk_5
					
					--verificacion de display siete segmento

						assert(siete_seg1="0100100")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0000001")
							report "digito menos significativo mal"
							severity ERROR;
					


				--test de clock de 2Hz 

					wait for SEMI_T_1200;	  	-- espero para no generar carreras
					clock_sel<= "011";	--selecciono salida de 2 Hz
					

					test_clk_2 : for i in 0 to (VUELTAS*2-1) loop
							
							wait until clock_out'event; 
							assert (SEMI_T_2=now-taux)	--verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 2Hz: "& time'image(now-taux)
								severity ERROR;
							taux:=now;
						
					end loop ; -- test_clk_2
					
					--verificacion de display siete segmento

						assert(siete_seg1="0010010")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0000001")
							report "digito menos significativo mal"
							severity ERROR;

					

				--test de clock de 1Hz 
					wait for SEMI_T_1200;	  	-- espero para no generar carreras
					clock_sel<= "010";	--selecciono salida de 1 Hz
					

					test_clk_1 : for i in 0 to (VUELTAS*2-1) loop
							wait until clock_out'event;
							assert (SEMI_T_1=now-taux)	--verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 1Hz: "& time'image(now-taux)
								severity ERROR;

							taux:=now;
						
					end loop ; -- test_clk_1
					
					--verificacion de display siete segmento

						assert(siete_seg1="1001111")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0000001")
							report "digito menos significativo mal"
							severity ERROR;
					
				

				--test de clock de 0.5Hz 
					wait for SEMI_T_1200;	  	-- espero para no generar carreras
					clock_sel<= "001";	--selecciono salida de 0.5 Hz

					test_clk_05 : for i in 0 to (VUELTAS*2-1) loop
							wait until clock_out'event;
							assert (SEMI_T_05=now-taux)	--verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 0.5Hz: "& time'image(now-taux)
								severity ERROR;
							taux:=now;
						
					end loop ; -- test_clk_05
					
					--verificacion de display siete segmento

						assert(siete_seg1="0000001")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0100100")
							report "digito menos significativo mal"
							severity ERROR;	



				--test de clock de 0.1Hz 
					wait for SEMI_T_1200;	  	-- espero para no generar carreras
					clock_sel<= "000";	--selecciono salida de 0.1 Hz

					test_clk_01 : for i in 0 to (VUELTAS*2-1) loop
							
							wait until clock_out'event; 
							assert (SEMI_T_01=now-taux)	--verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 0.1Hz: "& time'image(now-taux)
								severity ERROR;
							taux:=now;

					end loop ; -- test_clk_01
					
					--verificacion de display siete segmento

						assert(siete_seg1="0000001")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="1001111")
							report "digito menos significativo mal"
							severity ERROR;
					
					
			--finalizacion de simulacion
				wait for 25 ns;
				assert false
					report "fin de simulacion"
					severity FAILURE;
			
		end process ; -- estimulos


end architecture ; -- arc_tb_sintetizadorFrecconPLL