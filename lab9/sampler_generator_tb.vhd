library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is
end entity;


architecture tb of testbench is

signal clock: std_logic := '0';
signal uart_rx: std_logic;
signal baudrate_out: std_logic;


begin 
main: entity work.receiver
	port map (
			clock => clock,
			uart_rx => uart_rx, 
			baudrate_out => baudrate_out
	);

clock <= not clock after 5 ns;

waveGen : process
begin

	uart_rx <= '1';
	wait for 100 ns;
	uart_rx <= '0';
	wait for 86.8 us; 
	uart_rx <= '1';
	wait for 10 us;

end process waveGen;
end tb;
