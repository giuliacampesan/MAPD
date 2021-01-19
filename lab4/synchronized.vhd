library IEEE;
use IEEE.std_logic_1164.all;



entity synchronized is
	port ( 
		d: in std_logic; 
		clk: in std_logic;
		reset: in std_logic;
		sync: out std_logic
		);
end entity synchronized;



architecture synchronized_input of synchronized is 
	component dff is
		port (
			clk : in std_logic;
			rst : in std_logic;
			d : in std_logic;
			q : out std_logic);

	end component dff;



	signal internal: std_logic;



begin
	dffA:dff
		port map (
			clk => clk,
			d => d,
			q => internal,
			rst => reset
			);
	dffB:dff
		port map (
			clk => clk,
			d => internal,
			q => sync,
			rst => reset
			);


end synchronized_input;			
		
