LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY testbench IS
END testbench;

ARCHITECTURE tb OF testbench IS
    COMPONENT uart_tx IS
        PORT (
            clk_tx, data_valid : IN STD_LOGIC;
            busy, uart_out : OUT STD_LOGIC;
            data : IN STD_LOGIC_VECTOR(0 TO 7)
        );
    END COMPONENT uart_tx;
    SIGNAL clk_tx : STD_LOGIC := '0';
    SIGNAL data_valid, uart_out, busy : STD_LOGIC;
    SIGNAL data : STD_LOGIC_VECTOR(0 TO 7);

BEGIN
    dut : uart_tx PORT MAP(clk_tx, data_valid, busy, uart_out, data);
    clk_tx <= NOT clk_tx AFTER 10 ns;
    PROCESS
    BEGIN
        data_valid <= '1';
        data <= "10101110";
        WAIT FOR 1000 ns;
        WAIT;
    END PROCESS;
END tb;