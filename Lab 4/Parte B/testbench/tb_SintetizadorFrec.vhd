--includes
	library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.ALL;

entity tb_sintetizadorFrec is
end tb_sintetizadorFrec;

architecture arc_tb_sintetizadorFrec of tb_SintetizadorFrec is

	--Declaracion de constantes de division de frecuencia
		Constant SEMI_T_01: 	time:= 5 sec;
		Constant SEMI_T_05: 	time:= 1 sec;
		Constant SEMI_T_1: 		time:= 500 ms;
		Constant SEMI_T_2:		time:= 250 ms;
		Constant SEMI_T_5: 		time:= 100 ms;
		Constant SEMI_T_50MHZ:	time:= 10 ns;

	--estimulos
		signal	clock_50: 	 std_logic:='0';	--iniciacion de clock en 0
		signal	clock_sel:	 std_logic_vector(2 downto 0):="111"; --inicializacion con clock out deshablititado
		signal	clock_out:	 std_logic;
		signal	siete_seg1:	 std_logic_vector(6 downto 0);
		signal	siete_seg0:	 std_logic_vector(6 downto 0);

	--declaracion de DUT
		component SintetizadorFrec is
			port(	clock_50: 	in std_logic;
					clock_sel:	in std_logic_vector(2 downto 0);
					clock_out:	out std_logic;
					siete_seg1:	out std_logic_vector(6 downto 0);
					siete_seg0:	out std_logic_vector(6 downto 0)
			);
		end component SintetizadorFrec;

	--parametros de test
		constant VUELTAS: integer:=1;--numero de periodos en que testeamos el sistema


	begin
		--instanciacion de DUT
			DUT: SintetizadorFrec port map(clock_50,clock_sel,clock_out,siete_seg1,siete_seg0);

		--generacion del relog
			clock_50<= not (clock_50) after SEMI_T_50MHZ;

		estimulos : process

			variable taux: time;


			begin
			
				wait until falling_edge(clock_50); 
				
				
				--test de clock de 5Hz 
					clock_sel<= "100";
					wait until rising_edge(clock_50);--entrada syncronizada

					test_clk_5 : for i in 0 to (VUELTAS*2-1) loop
							taux:=now;
							wait until clock_out'event; 
							assert (SEMI_T_5=now-taux)	--verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 5Hz: "& time'image(now-taux)
								severity ERROR;
						
					end loop ; -- test_clk_5
					
					--verificacion de display siete segmento

						assert(siete_seg1="0100100")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0000001")
							report "digito menos significativo mal"
							severity ERROR;

					
				--test de clock de 2Hz 
					clock_sel<= "011";
					--wait until clock_out'event;

					test_clk_2 : for i in 0 to (VUELTAS*2-1) loop
							taux:=now;
							wait until clock_out'event; 
							assert (SEMI_T_2=now-taux) --verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 2Hz: "& time'image(now-taux)
								severity ERROR;
						
					end loop ; -- test_clk_2
					
					--verificacion de display siete segmento

						assert(siete_seg1="0010010")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0000001")
							report "digito menos significativo mal"
							severity ERROR;


				--test de clock de 1Hz 
					clock_sel<= "010";
					--wait until clock_out'event;

					test_clk_1 : for i in 0 to (VUELTAS*2-1) loop
							taux:=now;
							wait until clock_out'event; 
							assert (SEMI_T_1=now-taux) --verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 1Hz: "& time'image(now-taux)
								severity ERROR;
						
					end loop ; -- test_clk_1
					
					--verificacion de display siete segmento

						assert(siete_seg1="1001111")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0000001")
							report "digito menos significativo mal"
							severity ERROR;
					
					
				--test de clock de 0.5Hz 
					clock_sel<= "001";
					--wait until clock_out'event;

					test_clk_05 : for i in 0 to (VUELTAS*2-1) loop
							taux:=now;
							wait until clock_out'event; 
							assert (SEMI_T_05=now-taux) --verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 0.5Hz: "& time'image(now-taux)
								severity ERROR;
						
					end loop ; -- test_clk_05
					
					--verificacion de display siete segmento

						assert(siete_seg1="0000001")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="0100100")
							report "digito menos significativo mal"
							severity ERROR;


				--test de clock de 0.1Hz 
					clock_sel<= "000";
					--wait until clock_out'event;

					test_clk_01 : for i in 0 to (VUELTAS*2-1) loop
							taux:=now;
							wait until clock_out'event; 
							assert (SEMI_T_01=now-taux) --verificacion de semiperiodo
								report "frecuencia erronea, semiperiodo de 0.1Hz: "& time'image(now-taux)
								severity ERROR;

					end loop ; -- test_clk_01
					
					--verificacion de display siete segmento

						assert(siete_seg1="0000001")
							report "digito mas significativo mal"
							severity ERROR;

						assert(siete_seg0="1001111")
							report "digito menos significativo mal"
							severity ERROR;

			--finilizacion de simulacion
				wait for 25 ns;
				assert false
					report "fin de simulacion"
					severity FAILURE;
			
		end process ; -- estimulos


end architecture ; -- arc_tb_sintetizadorFrec