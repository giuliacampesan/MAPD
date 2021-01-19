library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_tb is
end entity mux4_tb;

architecture test of mux4_tb is
	component mux4
		port(
			a1: in std_logic_vector(2 downto 0);
			a2: in std_logic_vector(2 downto 0);
			a3: in std_logic_vector(2 downto 0);
			a4: in std_logic_vector(2 downto 0);
			sel: in std_logic_vector(1 downto 0);
			b: out std_logic_vector(2 downto 0));

	end component;


	signal a1: std_logic_vector(2 downto 0);
	signal a2: std_logic_vector(2 downto 0);
	signal a3: std_logic_vector(2 downto 0);
	signal a4: std_logic_vector(2 downto 0);
 	signal sel: std_logic_vector(1 downto 0);
	signal b: std_logic_vector(2 downto 0);

--signal Clk : std_logic := '1';

begin

	DUT: mux4 
		port map ( a1 => a1, 
			   a2 => a2, 
			   a3 => a3, 
			   a4 => a4, 
			   b => b, 
			   sel => sel);
	
	WaveGen_Proc : process
	begin
		a1 <= "010";
		a2 <= "011";
		a3 <= "100";
		a4 <= "111";

		sel <= "00";
		wait for 1 ns;
		sel <= "01";
		wait for 1 ns;
		sel <= "10";
		wait for 1 ns;
		sel <= "11";
		wait for 1 ns;
	
	end process WaveGen_Proc;

end architecture test;













