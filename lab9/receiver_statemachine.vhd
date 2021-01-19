library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity main_state_machine is
	port (
		clock: in std_logic;
		uart_rx: in std_logic;
		baudrate: in std_logic;
		data: out std_logic_vector(0 to 7);
		valid: out std_logic
	);
		
		
end entity;

architecture sm of main_state_machine is

type state_t is (IDLE, START, B0, B1, B2,B3, B4, B5,B6, B7, STOP);
signal state : state_t := IDLE;
signal received_data: std_logic_vector(0 to 7);
 
begin


proc: process(clock) is
begin
if rising_edge(clock) then 



	
 	case state is
	when IDLE => valid <='1';
	 
		if uart_rx = '0' then
			state <= START;
		else state <= IDLE;
		end if;
	
	
	when START => valid <= '0';
	if baudrate = '1' then 
		state <= B0;
	end if;


	when B0 => valid <= '0';
	if baudrate = '1' then
		received_data(0) <= uart_rx;
		state <= B1;
	
	else state <= B0;
	end if;


	when B1 => valid <= '0';
	if baudrate = '1' then
		received_data(1) <= uart_rx;
		state <= B2;
	
	else state <= B1;
	end if;


	when B2 => valid <= '0';
	if baudrate = '1' then
		received_data(2) <= uart_rx;
		state <= B3;
	
	else state <= B2;
	end if;


	when B3 => valid <= '0';
	if baudrate = '1' then
		received_data(3) <= uart_rx;
		state <= B4;
	
	else state <= B3;
	end if;


	when B4 => valid <= '0';
	if baudrate = '1' then
		received_data(4) <= uart_rx;
		state <= B5;
	
	else state <= B4;
	end if;

	when B5 => valid <= '0';
	if baudrate = '1' then
		received_data(5) <= uart_rx;
		state <= B6;
	
	else state <= B5;
	end if;


	when B6 => valid <= '0';
	if baudrate = '1' then
		received_data(6) <= uart_rx;
		state <= B7;
	
	else state <= B6;
	end if;


	when B7 => valid <= '0';
	if baudrate = '1' then
		received_data(7) <= uart_rx;
		state <= STOP;
	
	else state <= B7;
	end if;


	when STOP => valid <= '1';
			data <= received_data;
	if uart_rx = '0' then
		--data <= (others => '0');
		state <= IDLE;
	else state <= STOP;
	end if;

	when others => state <= IDLE;
			valid <= '0';
end case;
end if;

end process proc;
end sm;

	






		
			
	



