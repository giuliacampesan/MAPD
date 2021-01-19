library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity delay_line is
	port (
		clock: in std_logic;
		pulse_out: in std_logic;
		baudrate_out: out std_logic
	);
end entity;

architecture counter of delay_line is

	

	constant half_period : natural := 443;
	signal delay_count: natural range 0 to half_period -1 := 0 ;	
	signal tmp: std_logic := '0';


begin 

main: process(clock) is 
begin

if rising_edge(clock) then 
	if pulse_out = '1' then
		tmp <= '1';
		
	end if;
	if tmp = '1' then
		delay_count <= (delay_count + 1) mod half_period;
		if (delay_count = half_period -1) then
			baudrate_out <= '1';
			tmp <= '0';
		else baudrate_out <= '0';
		end if;
	else baudrate_out <= '0';
	end if;
end if;

end process main;
end counter;
	









