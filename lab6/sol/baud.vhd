LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
ENTITY baud IS
    PORT (
        clk : IN STD_LOGIC;
        boudrate : OUT STD_LOGIC
        );
END ENTITY baud;

ARCHITECTURE rtl OF baud IS
signal cnt : unsigned(9 downto 0) := (others => '0');
constant divisor : unsigned(9 downto 0) := to_unsigned(867, 10);

BEGIN -- architecture rtl
    main : PROCESS (clk) IS
    BEGIN -- process main
        IF rising_edge(clk) THEN
        cnt <= cnt +1;

        IF (cnt = divisor) THEN
        boudrate <= '1';
        cnt <= (others => '0');
        ELSE 
        boudrate <= '0';
        end if;
        end if;
    END PROCESS main;
END ARCHITECTURE rtl;