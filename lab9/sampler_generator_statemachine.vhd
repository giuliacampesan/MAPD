library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gen_sm is 
	port (
		clock: in std_logic;
		uart_rx: in std_logic;
		pulse_out: in std_logic;
		enable: out std_logic
	);
end entity;

architecture sm of gen_sm is

	type state_t is (ENABLED, DISABLED);
	signal state: state_t := DISABLED;
	signal count: unsigned(10 downto 0) := (others => '0');
	--signal uart_latched: std_logic;

begin

main: process(clock) is
begin

if rising_edge(clock) then
	case state is 
		
		when DISABLED => enable <= '0';
			if uart_rx = '0' then
				state <= ENABLED;
			
			else state <= DISABLED;
			end if;

		when ENABLED => enable <= '1';

			if pulse_out = '1' then
				count <= ( count +1 ) mod 10;

				if count = 9 then 
					state <= DISABLED;

				else state <= ENABLED;
				end if;
			end if;
		when others => null;
	end case;
end if;

end process main;
end architecture sm;
	


