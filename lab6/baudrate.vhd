library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rs232 is 
	port (
		clk_in: in std_logic;
		baudrate_out: out std_logic
	);

end rs232;


architecture transmit of rs232 is

	
	--signal clk: std_logic;
	--signal baudrate: std_logic;
	constant period : natural := 868;
	signal count: natural range 0 to period -1 := 0 ;	



begin

	--clk <= clk_in;
	--baudrate_out <= baudrate;
	
gen: process(clk_in) is

begin

	if rising_edge(clk_in) then
		count <= (count +1) mod period;
		

		if (count = period-1) then
			baudrate_out <= '1';
		else 
			baudrate_out <= '0';
		end if;
	end if;


end process gen;
end transmit;


	

