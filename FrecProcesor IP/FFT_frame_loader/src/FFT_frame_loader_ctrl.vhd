
library IEEE;
use IEEE.std_logic_1164.all;

entity FFT_frame_loader_ctrl is
generic(	FFT_LENGTH: integer := 128;
 			FRAME_SIZE: integer:= 32
 			);
  port (
	clock: in std_logic;
	reset: in std_logic;
	--control signals
	shift : out std_logic;
	load_new : out std_logic;
	--input handshake signals
	in_ready: out std_logic;
	in_valid: in std_logic;
	in_error: in std_logic_vector(1 downto 0);
	--output handshake signals
	out_ready: in std_logic;
	out_valid: out std_logic;
	out_error: out std_logic_vector(1 downto 0);
	out_eop: out std_logic;
	out_sop: out std_logic
  ) ;
end entity ; -- FFT_frame_loader_ctrl

architecture arch of FFT_frame_loader_ctrl is
	type states is (READ_NEW,SOP,SEND);
	signal current_state: states;
	signal next_state: states;

	--internat signals
	signal count : natural range 0 to FFT_LENGTH -1;
	signal clear : std_logic;
	signal inc: std_logic;
begin
	
	current_state_logic : process( clock, reset )
	begin
		if( reset = '1' ) then
		  	current_state<=READ_NEW;
		elsif( rising_edge(clock) ) then
		current_state<=next_state;
		end if ;
	end process ; -- current_state_logic


	next_state_logic: process(current_state,out_ready,count, in_valid)
	begin
		case( current_state ) is		
			when READ_NEW=>
				if in_valid='1' and count=FRAME_SIZE-1 then
					next_state <= SOP;
				else
					next_state <=READ_NEW;
				end if ;
			when SOP=>
				if out_ready='1' then
					next_state <=SEND;
				else
					next_state <=SOP;
				end if ;
			when SEND=>
				if out_ready='1' and count=FFT_LENGTH-1 then
					next_state <= READ_NEW;
				else
					next_state <=SEND;
				end if ;		
		end case ;
		
	end process ; -- next_state_logic

	output_logic : process(current_state,count,out_ready,in_valid)
	begin
		--internal signals
		clear<='0';
		inc<='0';
		--control signals
		shift <='0';
		load_new<='0';
		--output handshake signals
		out_sop<='0';
		out_eop<='0';		
		out_valid<='0';
		--input handshake signals
		in_ready<='0';
		case( current_state ) is	
			when READ_NEW=>
				load_new<='1';
				in_ready<='1';
				if in_valid='1' then
					shift<='1';
					inc<='1';
					if count=FRAME_SIZE-1 then
						clear<='1';
					end if ;
				end if ;
			when SOP=>
				out_valid<='1';
				out_sop<='1';
				if out_ready='1' then
					shift<='1';
					inc<='1';
				end if ;
			when SEND=>	
				out_valid<='1';
				if out_ready='1' then
					shift<='1';
					inc<='1';
					if count=FFT_LENGTH-1 then
							clear<='1';
							out_eop<='1';
					end if ;	
				end if ;	
								
		
		end case ;
	end process ; -- output_logic 

	error_gen : process( clock )
	begin
		if( rising_edge(clock) ) then
			out_error<=in_error;
		end if ;
	end process ; -- error_gen
	

	--counter logic
	counter : process( clock, reset )
	begin
	  if( reset = '1' ) then
	    count<=0;
	  elsif( rising_edge(clock) ) then
		if clear ='1'  then
			count<=0;
		elsif inc='1' then
			count<=count+1;
		end if ;
	  end if ;
	end process ; -- counter

end architecture ; -- arch