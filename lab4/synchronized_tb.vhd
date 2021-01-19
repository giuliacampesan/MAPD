library IEEE;
use IEEE.std_logic_1164.all;

entity synchronized_tb is 
end;

architecture tb of synchronized_tb is
	component synchronized
		port (
			
			clk: in std_logic;
			rst: in std_logic;
			d: in std_logic;
			sync: out std_logic
			);
	end component;

	
	signal clk_sig: std_logic := '1';
	signal rst_sig: std_logic;
	signal d_sig: std_logic;
	signal sync_sig: std_logic;

begin 

dut: synchronized port map ( 
			clk => clk_sig,
			rst => rst_sig,
			d => d_sig,
			sync => sync_sig
			);
			
clk_sig	<= not clk_sig after 5 ns;	


test: process 
begin

	rst_sig <= '1';
	d_sig <= '0';
	wait for 20 ns;


	d_sig <= '1';
	wait for 20 ns;

	d_sig <= '0';
	wait for 8 ns;

	d_sig <= '1';
	d_sig <= not d_sig after 5 ns;
	
	wait for 15 ns;
	d_sig <= '0';

	wait;

end process test;
end architecture tb;






















