library ieee;
use ieee.std_logic_1164.all;

entity statemachine is 
port (
	baud_out: in std_logic;
	clk: in std_logic; 
	valid: in std_logic;
	data: in std_logic_vector (7 downto 0);

	busy: out std_logic; 
	uart_tx: out std_logic
	);
end entity;

architecture sm of statemachine is
	type state_t is (IDLE, DATA_VALID, START, B0, B1, B2, B3, B4, B5, B6, B7, STOP);
	signal state: state_t := IDLE;
	signal data_latched: std_logic_vector(7 downto 0);

begin --architecture
main : process(clk) is 
begin --process

if rising_edge(clk) then 
	
	case state is 
		when IDLE => busy <= '0'; uart_tx <= '1'; data_latched <= data;
			if valid = '1' then
				state <= DATA_VALID;
			else state <= IDLE;
			end if;

		when DATA_VALID => busy <= '1'; uart_tx <= '1';
			if baud_out = '1' then
				state <= START;
			else state <= DATA_VALID;
			end if;

		when START=> busy <= '1'; uart_tx <= '0';
			if baud_out = '1' then 
				state <= B0;
			else state <= START;
			end if;

		when B0 =>  busy <= '1'; uart_tx <= data_latched(0);
			if baud_out = '1' then
				state <= B1;
			else state <= B0;
			end if;

		when B1 => busy <= '1'; uart_tx <= data_latched(1); 
			if baud_out = '1' then
				state <= B2;
			else state <= B1;
			end if;

		when B2 => busy <= '1'; uart_tx <= data_latched(2); 
			if baud_out = '1' then
				state <= B3;
			else state <= B2;
			end if;

		when B3 => busy <= '1'; uart_tx <= data_latched(3); 
			if baud_out = '1' then
				state <= B4;
			else state <= B3;
			end if;

		when B4 => busy <= '1'; uart_tx <= data_latched(4); 
			if baud_out = '1' then
				state <= B5;
			else state <= B4;
			end if;

		when B5 => busy <= '1'; uart_tx <= data_latched(5); 
			if baud_out = '1' then
				state <= B6;
			else state <= B5;
			end if;

		when B6 => busy <= '1'; uart_tx <= data_latched(6); 
			if baud_out = '1' then
				state <= B7;
			else state <= B6;
			end if;

		when B7 => busy <= '1'; uart_tx <= data_latched(7); 
			if baud_out = '1' then
				state <= STOP;
			else state <= B7;
			end if;

		when STOP => busy <= '1';
			if baud_out = '1' then
				state <= IDLE;
			else state <= STOP;
			end if;
		when others => busy <='0'; uart_tx <='0'; state <= IDLE;


	end case;
end if;
end process main;
end architecture sm;
			





		
