--packs
	library ieee;
	use ieee.std_logic_1164.all;


entity Frame_Output_Buffer_ctrl is
	generic(
		FFT_LENGTH : integer := 2048;
		FRAME_SIZE: integer := 128;
		DELAY: integer:= 128
		);
	port (
		clock : in std_logic;
		reset : in std_logic;
		--Avalon-ST hdsk signals
		valid : in std_logic;
		sop : in std_logic;
		eop : in std_logic;
		err : in std_logic_vector(1 downto 0);
		ready : out std_logic;
		--internal signals
		next_edge : in std_logic;
		max_addr : in std_logic;
		we : out std_logic;
		err_out: out std_logic
	  ) ;
end entity ; -- Frame_Output_Buffer_ctrl

architecture arch of Frame_Output_Buffer_ctrl is
	type state is (IDLE, DISCARD, STORE);
	signal current_state, next_state : state;

	signal Fr_sync_error: std_logic;

	--counter signals
	signal count: natural range 0 to FFT_LENGTH-1;
	signal inc_cnt,clear_cnt :std_logic;
begin
	
	current_state_logic : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    	current_state<= IDLE;
	  elsif( rising_edge(clock) ) then
		current_state<=next_state;
	  end if ;
	end process ; -- current_state_logic

	next_state_logic : process( current_state,err,sop,valid,next_edge,max_addr,eop,count)
	begin
		if err/="00" then
			next_state<=IDLE;
		else
			case( current_state ) is
			
				when IDLE => 
					if sop='1' and valid='1' then
						next_state<= DISCARD;
					else
						next_state<=IDLE;
					end if ;
				
				 when DISCARD  =>
				 	if  valid='1' and count >= FFT_LENGTH -FRAME_SIZE- DELAY -1 then
				 		next_state<= STORE;
				 	else
				 		next_state<= DISCARD;
				 	end if ;

				 when STORE  =>
				 	if next_edge='1' or max_addr='1' then
				 		next_state<= STORE;
				 	else
				 		if valid='1' then
				 			if eop='1' then
				 				next_state<=IDLE;
				 			else
				 				if count>=FFT_LENGTH - DELAY-1 then
				 					next_state<=IDLE;
				 				else
				 					next_state<=STORE;
				 				end if ;
				 			end if ;
				 		else
				 			next_state<=STORE;
				 		end if ;
				 	end if ;
			
			end case ;
			
		end if ;
		
	end process ; -- next_state_logic

	output_logic : process( current_state,err,sop,valid,next_edge,max_addr,eop,count)
	begin
		--default values
			ready<='0';
			we<='0';
			err_out<='0';
			--counter control signals
			inc_cnt<='0';
			clear_cnt<='0';
		if err="00" then
			case( current_state ) is
			
				when IDLE => 
						ready<='1';
					if sop='1' and valid='1' then
						inc_cnt<='1';
					end if ;
				
				 when DISCARD  =>
				 	ready<='1';
				 	if  valid='1'  then
				 		inc_cnt<='1';
				 	end if ;

				 when STORE  =>
				 	if next_edge='0' and max_addr='0' then
				 		ready<='1';

				 		if valid='1' then
				 			we<='1';
				 			if eop='1' then
				 				clear_cnt<='1';
				 			else
				 				if count>=FFT_LENGTH - DELAY-1 then
				 					err_out<='1';
				 					clear_cnt<='1';
				 				else
				 					inc_cnt<='1';
				 				end if ;
				 			end if ;
				 		end if ;
				 	end if ;
			
			end case ;
		end if;
		
	end process ; -- output_logic

	--counter logic
	counter : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    count<=0;
	  elsif( rising_edge(clock) ) then
		if clear_cnt ='1'  then
			count<=0;
		elsif inc_cnt='1' then
			count<=count+1;
		end if ;
	  end if ;
	end process ; -- counter


end architecture ; -- arch