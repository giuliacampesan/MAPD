LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY state_machine IS
PORT (
    clk_sm, data_valid  : IN STD_LOGIC;
    busy_sm, uart_out : OUT STD_LOGIC;
    data : IN STD_LOGIC_VECTOR(0 TO 7)
    );    
END ENTITY state_machine;

ARCHITECTURE rtl OF state_machine IS
    TYPE state_t IS (IDLE, B1, B2, B3, B4, B5, B6, B7, B8);
    SIGNAL state : state_t:= IDLE;
BEGIN -- architecture rtl
    main : PROCESS (clk_sm)

    BEGIN -- process main
        IF rising_edge(clk_sm) THEN
        CASE state is
            when IDLE => 
            busy_sm<= '1'; 
            IF data_valid = '1' then
                state <= B1;
            end if;
            when B1 => 
            busy_sm <= '1'; 
            uart_out <= data(0);
            state <= B2;
            when B2 => 
            busy_sm <= '1'; 
            uart_out <= data(1);
            state <= B3;
            when B3 => 
            busy_sm <= '1'; 
            uart_out <= data(2);
            state <= B4;
            when B4 => 
            busy_sm <= '1'; 
            uart_out <= data(3);
            state <= B5;
            when B5 => 
            busy_sm <= '1'; 
            uart_out <= data(4);
            state <= B6;
            when B6 => 
            busy_sm <= '1'; 
            uart_out <= data(5);
            state <= B7;
            when B7 => 
            busy_sm <= '1'; 
            uart_out <= data(6);
            state <= B8;
            when B8 => 
            busy_sm <= '0'; 
            uart_out <= data(7);
            state <= IDLE;
                
        END CASE;
        END IF; 
    END PROCESS main;
END ARCHITECTURE rtl;