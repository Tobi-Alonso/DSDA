
--declaracion de librerias entidad
	library ieee;
	use ieee.std_logic_1164.all;


entity visor_contadores is	
	port(
					sel:		in std_logic_vector(1 downto 0);
					Salida_7seg:out std_logic_vector(0 to 6) ;

					c0: in std_logic_vector(3 downto 0);
					c1: in std_logic_vector(3 downto 0);
					c2: in std_logic_vector(3 downto 0);
					c3: in std_logic_vector(3 downto 0)
					
					);
end visor_contadores;

architecture arc_visor_contadores of visor_contadores is

	--declaracion de conexiones internas
	signal Bus_Nro: std_logic_vector(3 downto 0);
	
	--declaracion de componentes	
	component Deco7Seg is
		port( Nro: in std_logic_vector (3 downto 0);
				Sal: out std_logic_vector (0 to 6));
	end component Deco7Seg;
	
	
	component mux_4to1 is
		port
		(		-- Input ports
			sel	: in  std_logic_vector(1 downto 0);
			info	: in  std_logic_vector(0 to 3);
					-- Output ports
			yout	: out std_logic
		);
		
	end component mux_4to1;
	
	begin
		--instanciacion de decoficador a 7 segmentos
		Deco:deco7seg port map(Nro=>Bus_Nro,Sal=>Salida_7seg);
		
		--muxs instantiation with generate
		mux_gen:for i in 3 downto 0 generate
			mux:mux_4to1 port map(yout=>Bus_Nro(i),sel=>sel,info(0)=>c0(i),info(1)=>c1(i),info(2)=>c2(i),info(3)=>c3(i));
		end generate mux_gen;

end arc_visor_contadores;
	
	
	
	
	