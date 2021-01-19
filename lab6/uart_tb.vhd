library ieee;
use ieee.std_logic_1164.all;

entity uart_tb is
end;

architecture tb of uart_tb is


	signal clk: std_logic := '1';
	signal busy:  std_logic;
	signal valid: std_logic:= '0'; 
	signal data: std_logic_vector (0 to 7) :=  "11010010";
	signal uart_tx:  std_logic;

begin

DUT: entity work.uart
port map (
	clk => clk,
	busy => busy,
	valid =>valid,
	data => data,
	uart_tx => uart_tx
);

clk <= not clk after 1 ns;

WaveGen_Proc : process
begin
	
	valid <= '0';
	data <= "11010010";
	wait for 1 ns;
	wait until rising_edge(clk);
	valid <= '1';
	wait until rising_edge(clk);
	valid <= '0'; 
	data <= "10010100";
	wait until busy <= '1';
	wait until busy <= '0';
	valid <= '1'; 
	wait until rising_edge(clk);
	valid <= '0';
	wait until busy <= '1';
	wait until busy <= '0';
	wait;

end process Wavegen_Proc;
end tb;

