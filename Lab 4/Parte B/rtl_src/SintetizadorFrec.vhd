--includes
	library ieee;
	use ieee.std_logic_1164.all;


entity SintetizadorFrec is
	port(	clock_50: 	in std_logic;						--entrada relog 50Mhz
			clock_sel:	in std_logic_vector(2 downto 0);	
			clock_out:	out std_logic;						--Reloj de salida
			siete_seg1:	out std_logic_vector(0 to 6);		--digito MS en 7 seg
			siete_seg0:	out std_logic_vector(0 to 6)		--digito mS en 7 seg
		);
	
end SintetizadorFrec;

architecture arc_SintetizadorFrec of SintetizadorFrec is
	
	--component declarations

		--conversor BCD a 7 segmentos
			component Deco7Seg is
				port( Nro: in std_logic_vector (3 downto 0);
					Sal: out std_logic_vector (0 to 6));
			end component Deco7Seg;

		--sistema que apartir del reloj de 50M genera la frecuencia seleccionada		
			component DivisorFrec is
				port(	clock_50: 	in std_logic;
						clock_sel:	in std_logic_vector(2 downto 0);
						clock_out:	out std_logic;
						digito1:	out std_logic_vector(3 downto 0);
						digito0:	out std_logic_vector(3 downto 0)
					);
			end component DivisorFrec;

		--registro utilizado para sincronizar las entradas de seleccion
			component registro is
				generic(ANCHO: natural:=8);
				port(
					d :		in std_logic_vector(ANCHO-1 downto 0);
					clk:	in std_logic;
					q : 	out std_logic_vector(ANCHO-1 downto 0)
					);
			end component registro;


	--internal signals declaration
		--bus BCD 
			signal digito1: std_logic_vector(3 downto 0);
			signal digito0: std_logic_vector(3 downto 0);
			
		--entradas de seleccion sincronizadas
			signal syn_clock_sel: std_logic_vector(2 downto 0);


	begin

		sicronizadores: registro 	generic map(3)
									port map(d=>clock_sel,clk=>clock_50,q=>syn_clock_sel);
		divisor: DivisorFrec 		port map (clock_50,syn_clock_sel,clock_out,digito1,digito0);
		SieteSeg1: Deco7Seg 		port map (digito1,siete_seg1);
		SieteSeg0: Deco7Seg 		port map (digito0,siete_seg0);




end architecture ; -- arc_SintetizadorFrec