LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY uart_tx IS
    PORT (
        clk_tx, data_valid : IN STD_LOGIC;
        busy, uart_out : OUT STD_LOGIC;
        data : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
        );    
END ENTITY uart_tx;

ARCHITECTURE rtl OF uart_tx IS --architecture
COMPONENT baud IS
    PORT (
        clk : IN STD_LOGIC;
        boudrate : OUT STD_LOGIC
        );
END COMPONENT baud;

COMPONENT state_machine IS
    PORT (
        clk_sm, data_valid  : IN STD_LOGIC;
        busy_sm, uart_out : OUT STD_LOGIC;
        data : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
        );    
END COMPONENT state_machine; 


signal boudclock: std_logic;

BEGIN -- architecture rtl
    bd : baud
    PORT MAP(
        clk  => clk_tx,
        boudrate => boudclock
    );

    sm : state_machine
    PORT MAP(
        data => data,
        data_valid => data_valid,
        clk_sm => boudclock,
        uart_out => uart_out,
        busy_sm => busy
    );
END ARCHITECTURE rtl;