library ieee;
use ieee.std_logic_1164.all;

entity uart is 
port (
	clk: in std_logic;
	busy: out std_logic;
	valid: in std_logic; 
	data: in std_logic_vector (7 downto 0);
	uart_tx: out std_logic);

end entity;

architecture ut of uart is
	component rs232 is
		port (
			clk_in: in std_logic;
			baudrate_out: out std_logic
	);
	end component rs232;

	component statemachine is
		port (
			baud_out: in std_logic;
			clk: in std_logic; 
			valid: in std_logic;
			data: in std_logic_vector (7 downto 0);

			busy: out std_logic; 
			uart_tx: out std_logic
	);
	end component statemachine;

signal baudrate_output: std_logic; 


begin

	rs : rs232
		port map ( 	clk_in => clk,
				baudrate_out => baudrate_output
		);


	sm : statemachine 
		port map (	baud_out => baudrate_output,
				clk => clk,
				valid => valid,
				data => data,
				busy => busy,
				uart_tx => uart_tx
		);
			
	

end ut;













