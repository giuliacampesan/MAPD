library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity top is

  port (

    CLK100MHZ    : in  std_logic;
    uart_rxd_out : out std_logic;
    uart_txd_in  : in  std_logic);

end entity top;

architecture str of top is

begin
  process(CLK100MHZ) is
  begin
    if rising_edge(CLK100MHZ) then
      uart_rxd_out <= uart_txd_in;
    end if;
  end process;

end architecture str;
