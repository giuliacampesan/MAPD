library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity baudrate_tb is
end;


architecture tb of baudrate_tb is
	component rs232
		port (
			clk_in: in std_logic;
			baudrate_out: out std_logic
		);
	end component;


signal clk_sig: std_logic := '1';
signal baud_sig: std_logic;


begin 
 main: rs232 port map (
			clk_in => clk_sig,
			baudrate_out => baud_sig
		);


clk_sig <= not clk_sig after 5 ns;

test: process
begin

wait;

end process test;
end architecture tb;


