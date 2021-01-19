library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sampler_generator is 
	port (
		clock: in std_logic;
		uart_rx: in std_logic;
		baudrate_out: out std_logic
	);
end entity;

architecture archt of sampler_generator is
	component generator is 
		port (
			enable: in std_logic;
			clock: in std_logic;
			pulse_out: out std_logic
	);

	end component generator;

	component gen_sm is
		port (
			clock: in std_logic;
			uart_rx: in std_logic;
			pulse_out: in std_logic;
			enable: out std_logic
	);
	end component gen_sm;

	component delay_line is
	port (
		clock: in std_logic;
		pulse_out: in std_logic;
		baudrate_out: out std_logic
	);
	end component;

signal enable: std_logic;
signal pulse_out:
std_logic;

begin 
	gen : generator 
	port map (
			enable => enable,
			clock => clock,
			pulse_out => pulse_out
	);

	rec : gen_sm 
	port map (
			clock => clock,
			uart_rx => uart_rx,
			pulse_out => pulse_out,
			enable => enable
	);

	del : delay_line
	port map (
			clock => clock,
			pulse_out => pulse_out,
			baudrate_out => baudrate_out
	);

end archt;

	






