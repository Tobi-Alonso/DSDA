--includes
	library ieee;
	use ieee.std_logic_1164.all;


entity SintetizadorFrec is
	port(	clock_50: 	in std_logic;
			clock_sel:	in std_logic_vector(2 downto 0);
			clock_out:	out std_logic
		);
	
end SintetizadorFrec;

architecture arc_SintetizadorFrec of SintetizadorFrec is
	
	--Declaracion de constantes de division
		Constant SEMI_T_01: integer:= 250000000;
		Constant SEMI_T_05: integer:= 50000000;
		Constant SEMI_T_1: integer:= 25000000;
		Constant SEMI_T_2: integer:= 12500000;
		Constant SEMI_T_5: integer:= 5000000;

	type contador is range 0 to SEMI_T_01;
	signal cuenta: contador;

	signal estado: bit;
	signal cuenta_max: contador;

	begin

		with clock_sel select
			cuenta_max	<=	SEMI_T_01	when "000",
							SEMI_T_05 	when "001",
							SEMI_T_1	when "010",
							SEMI_T_2 	when "011",
							SEMI_T_5	when "100",
							'0'			when others; --clock de 25MHz, elegido para las opciones no especificadas por simplicidad
		--with clock_sel select





		division : process( clock_50)
			variable cont_aux: contador;

			begin
			if (rising_edge(clock_50)) then

				cont_aux=cuenta+1;
				if cont_aux=>cuenta_max then

					cont_aux=0;
					estado= not estado;
					
				end if ;



				contador<=cont_aux;
			end if ;

		end process ; -- division

end architecture ; -- arc_SintetizadorFrec