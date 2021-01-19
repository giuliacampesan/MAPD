library ieee;
use ieee.std_logic_1164.all;

entity uart_tb is
end;

architecture tb of uart_tb is


	signal clk: std_logic := '0';
	signal busy:  std_logic;
	signal valid: std_logic; 
	signal data: std_logic_vector (7 downto 0);
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
	wait for 868 ns;
	valid <= '1';
	wait for 2 ns;
	valid <= '0'; 
	data <= "10010100";
	wait for 20 us;
	valid <= '1'; 
	wait for 2 ns;
	valid <= '0';
	wait for 600 ns;
	wait;

end process Wavegen_Proc;
end tb;

