--includes
	library ieee;
	use ieee.std_logic_1164.all;


entity SintetizadorFrecconPLL is
	port(	clock_50: 	in std_logic;						--entrada relog 50Mhz
			clock_sel:	in std_logic_vector(2 downto 0);
			clock_out:	out std_logic;						--Reloj de salida
			siete_seg1:	out std_logic_vector(0 to 6);		--digito MS en 7 seg
			siete_seg0:	out std_logic_vector(0 to 6);		--digito mS en 7 seg
			pll_lock:	out std_logic 						--indicador de enganche del PLL
			--;clk_pll:		out std_logic	--genero esta salida para sincronizarme en la simulacion
		);
	
end SintetizadorFrecconPLL;

architecture arc_SintetizadorFrecconPLL of SintetizadorFrecconPLL is
	
	--component declarations
		--conversor BCD a 7 segmentos
			component Deco7Seg is
				port( Nro: in std_logic_vector (3 downto 0);
					Sal: out std_logic_vector (0 to 6));
			end component Deco7Seg;


		--sistema que apartir del reloj de 1.2KHz genera la frecuencia seleccionada
			component DivisorFrec is
				port(	clock_pll: 	in std_logic;
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


		--PLL
			component ip_pll IS
				PORT(
					areset		: IN STD_LOGIC  := '0';
					inclk0		: IN STD_LOGIC  := '0';
					c0			: OUT STD_LOGIC ;
					locked		: OUT STD_LOGIC 
				);
			END component ip_pll;

	--internal signals declaration
		--bus BCD 
			signal digito1: std_logic_vector(3 downto 0);
			signal digito0: std_logic_vector(3 downto 0);

		--entradas de seleccion sincronizadas
			signal syn_clock_sel: std_logic_vector(2 downto 0);

		--salida del PLL
			signal pll_clk_out:	std_logic;


	begin

		ip_pll_inst : ip_pll 		PORT MAP (areset=> '0', inclk0=> clock_50, c0=> pll_clk_out, locked=> pll_lock);
		sicronizadores: registro 	generic map(3)
									port map(d=>clock_sel,clk=>pll_clk_out,q=>syn_clock_sel);
		divisor: DivisorFrec 		port map (pll_clk_out,syn_clock_sel,clock_out,digito1,digito0);
		SieteSeg1: Deco7Seg 		port map (digito1,siete_seg1);
		SieteSeg0: Deco7Seg 		port map (digito0,siete_seg0);		
		
end architecture ; -- arc_SintetizadorFreconPLLc