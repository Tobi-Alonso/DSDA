--includes
	library ieee;
	use ieee.std_logic_1164.all;

entity DivisorFrec is
	port(	clock_pll: 	in std_logic;
			clock_sel:	in std_logic_vector(2 downto 0);
			clock_out:	out std_logic;
			digito1:	out std_logic_vector(3 downto 0);
			digito0:	out std_logic_vector(3 downto 0)
		);
	
end DivisorFrec;

architecture arc_DivisorFrec of DivisorFrec is
	
	--Declaracion de constantes de division de frecuencia
		Constant SEMI_CUENTA_01: integer:= 6000;
		Constant SEMI_CUENTA_05: integer:= 1200;
		Constant SEMI_CUENTA_1:	 integer:= 600;
		Constant SEMI_CUENTA_2:  integer:= 300;
		Constant SEMI_CUENTA_5:  integer:= 120;

	subtype contador is integer range 0 to SEMI_CUENTA_01;
	signal cuenta: contador:=0;

	signal estado: std_logic:='0';

	begin


		division : process( clock_pll)
			variable cont_aux: contador;

			begin
			if (rising_edge(clock_pll)) then

				cont_aux:=cuenta+1;


				case( clock_sel ) is
				
					when "000" =>
						if (cont_aux >= SEMI_CUENTA_01) then 
							cont_aux:=0;
							estado<= not estado;
							
						end if ;

						digito1<="0000";
						digito0<="0001";

					when "001" =>
						if (cont_aux >=  SEMI_CUENTA_05) then 
							cont_aux:=0;
							estado<= not estado;
							
						end if ;


						digito1<="0000";
						digito0<="0101";



					when "010" =>
						if (cont_aux >=  SEMI_CUENTA_1) then 
							cont_aux:=0;
							estado<= not estado;


						digito1<="0001";
						digito0<="0000";
							
						end if ;

					when "011" =>
						if (cont_aux >= SEMI_CUENTA_2) then 
							cont_aux:=0;
							estado<= not estado;
							
						end if ;

						digito1<="0010";
						digito0<="0000";


					when "100" =>
						if (cont_aux >= SEMI_CUENTA_5) then 
							cont_aux:=0;
							estado<= not estado;
							
						end if ;


						digito1<="0101";
						digito0<="0000";

				
					when others =>
						cont_aux:=0;
						estado<='0';

						digito1<="0000";
						digito0<="0000";

				end case ;

				cuenta<=cont_aux;
			end if ;

		end process ; -- division
		
		clock_out<=estado;


end architecture ; -- arc_DivisorFrec