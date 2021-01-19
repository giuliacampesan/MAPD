library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity receiver_tb is
end entity;

architecture tb of receiver_tb is


signal 

uart_rx: std_logic := '1';
signal clock: std_logic := '0';
signal valid: std_logic;
signal data: std_logic_vector (0 to 7);

 
begin
DUT:
entity work.receiver

port map (
		uart_rx => uart_rx,
		clock => clock,
		valid => valid,
		data => data
);

clock <= not clock after 5 ns;

WaveGen: process is
begin

wait for 1 us;
uart_rx <= '0';
wait for 8.68 us;
uart_rx <= '1';
wait for 8.68 us;
uart_rx <= '1';
wait for 8.68 us;
uart_rx <= '0';
wait for 8.68 us;
uart_rx <= '1';
wait for 8.68 us;
uart_rx <= '0';
wait for 8.68 us;
uart_rx <= '1';
wait for 8.68 us;
uart_rx <= '1';
wait for 8.68 us;
uart_rx <= '0';
wait for 8.68 us;
uart_rx <= '1';
wait for 8.68 us;
uart_rx <= '1';
wait for 100 us; 
wait;

end process WaveGen;
end tb;















