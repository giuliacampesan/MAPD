library IEEE;
use IEEE.std_logic_1164.all;

entity my_fsm1tb is
end entity;

architecture tb of my_fsm1tb is
	component my_fsm1 
		port (
			TOG_EN, CLK, CLR : in std_logic;
		Z1: out std_logic);
	end component;


signal tog_en, clr: std_logic;
signal clk: std_logic := '1';
signal z1: std_logic;

begin 
dut :my_fsm1 port map (
			TOG_EN => tog_en,
			CLK => clk,
			CLR => clr,
			Z1 => z1);

clk  <= not clk after 5 ns;

test: process
begin
		tog_en <= '0';
		clr <= '0';

		wait for 33 ns; 

		tog_en <= '0';
		clr <= '1'; 
		wait for 27 ns;

		tog_en <= '0';
		clr <= '0'; 
		
		wait for 20 ns;

		tog_en <= '1';
		clr <= '0'; 

		wait for 30 ns;

		tog_en <= '1'; 
		clr <= '1'; 

		wait for 20 ns;

end process test; 
end architecture tb;







	
