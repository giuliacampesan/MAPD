library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generator is 
	port (  
		enable: in std_logic;
		clock: in std_logic;
		pulse_out: out std_logic
	);

end generator;


architecture pulse of generator is

	
	--signal clk: std_logic;
	--signal baudrate: std_logic;
	constant period : natural := 868;
	signal count: natural range 0 to period -1 := 867 ;	



begin

	--clk <= clock;
	--baudrate_out <= baudrate;
	
gen: process(clock) is

begin
	
	if rising_edge(clock) then
	

		if enable = '0' then
			count <= 0;
			pulse_out <= '0'; 
		
		else 

	
			count <= (count +1) mod period;
		

			if (count = period-1) then
				pulse_out <= '1';
			else 
				pulse_out <= '0';
			end if;

		end if;

	end if;


end process gen;
end pulse;


	

