library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generator_tb is
end entity;

architecture tb of generator_tb is

signal enable: std_logic := '1';
signal clock: std_logic := '0';
signal pulse_out : std_logic;

begin 

main: entity work.generator 
	port map (
			enable => enable,
			clock => clock,
			pulse_out => pulse_out
	);


clock <= not clock after 5 ns;

WaveGen: process 
begin

	enable <= '0';
	wait for 100 ns;
	
	enable <= '1';
	wait for 100 us; 
	enable <= '0';
	wait for 100 us;

end process;
end tb;
	
