library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity receiver is
	port (
		uart_rx: in std_logic;
		clock: in std_logic;
		valid: out std_logic;
		data: out std_logic_vector( 7 downto 0)
	);
end entity;


architecture arch of receiver is

component sampler_generator is 
	port (
		clock: in std_logic;
		uart_rx: in std_logic;
		baudrate_out: out std_logic
	);
end component sampler_generator;

component main_state_machine is
	port (
		clock: in std_logic;
		uart_rx: in std_logic;
		baudrate: in std_logic;
		data: out std_logic_vector(7 downto 0);
		valid: out std_logic
	);
end component main_state_machine;

signal baudrate: std_logic;

begin

	gen : sampler_generator
	port map (
		clock => clock,
		uart_rx => uart_rx,
		baudrate_out => baudrate
	);

	sm : main_state_machine
	port map (
		clock => clock,
		uart_rx => uart_rx,
		baudrate => baudrate,
		data => data,
		valid => valid
	);


end arch;			


