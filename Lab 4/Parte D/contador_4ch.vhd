--includes
	library ieee;
	use ieee.std_logic_1164.all;
	
----------------------------------------------------------------------
--		contador de 4 canales con entrada de reloj de 1hz a partir de --
--		reloj de 50mhz. contadores lfsr, up, down, gray 4bits.		  --
--		salida 7 segmentos.														  --
----------------------------------------------------------------------
	
entity contador_4ch is						
	port(	clock_ext: 	in std_logic;	--entrada de reloj externo
			cont_select:	in std_logic_vector(1 downto 0);--seleccion de contador
			reset_ext:	in std_logic;
			--digito1:	out std_logic_vector(3 downto 0);
			salida:	out std_logic_vector(0 to 6)--salida 7segmentos
		);
	
end contador_4ch;


architecture beh of contador_4ch is
	
	--declaracion de componentes
	
	component DivisorFrec is
			port(	clock_50: 	in std_logic;
					clock_sel:	in std_logic_vector(2 downto 0);
					clock_out:	out std_logic;
					digito1:	out std_logic_vector(3 downto 0);
					digito0:	out std_logic_vector(3 downto 0)
				);
	end component DivisorFrec;
		
	component cont_lfsr is
			port( clk: in std_logic;
					reset: in std_logic;
					Sal_cont: out std_logic_vector (3 downto 0));
	end component cont_lfsr;
	
	component cont_up is
			port( clk: in std_logic;
					reset: in std_logic;
					Sal_cont: out std_logic_vector (3 downto 0));
	end component cont_up;
	
	component cont_down is
			port( clk: in std_logic;
					reset: in std_logic;
					Sal_cont: out std_logic_vector (3 downto 0));
	end component cont_down;
	
	component cont_gray is
			port( clk: in std_logic;
					reset: in std_logic;
					Sal_cont: out std_logic_vector (3 downto 0));
	end component cont_gray;
	
	component visor_contadores is	
	port(
					sel:		in std_logic_vector(1 downto 0);
					Salida_7seg:out std_logic_vector(0 to 6) ;

					c0: in std_logic_vector(3 downto 0);
					c1: in std_logic_vector(3 downto 0);
					c2: in std_logic_vector(3 downto 0);
					c3: in std_logic_vector(3 downto 0)
					
					);
	end component visor_contadores;
	
	--declaracion de variables internas
		signal clock: std_logic;
		signal bus0: std_logic_vector(3 downto 0);
		signal bus1: std_logic_vector(3 downto 0);
		signal bus2: std_logic_vector(3 downto 0);
		signal bus3: std_logic_vector(3 downto 0);
	
	begin--architecture
		
		--instanciacion de componentes
		
		divisor: DivisorFrec port map (clock_50=>clock_ext,clock_sel=>"010",clock_out=>clock,digito1=>open,digito0=>open);
		c_lfsr:	cont_lfsr	port map	(clk=>clock,reset=>reset_ext,sal_cont=>bus0);
		c_up:		cont_up		port map	(clk=>clock,reset=>reset_ext,sal_cont=>bus1);
		c_down:	cont_down	port map	(clk=>clock,reset=>reset_ext,sal_cont=>bus2);
		c_gray:	cont_gray	port map	(clk=>clock,reset=>reset_ext,sal_cont=>bus3);
		v_cont:	visor_contadores	port map	(sel=>cont_select,salida_7seg=>salida,c0=>bus0,c1=>bus1,c2=>bus2,c3=>bus3);
		
end beh;