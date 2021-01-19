library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is 
end entity dff_tb;

architecture testbench of dff_tb is
  component dff 
    port (
	clk : in std_logic;
	rst : in std_logic;
	d : in std_logic;
	q : out std_logic);
  end component;

signal clk_signal : std_logic := '1';
signal rst_signal :  std_logic;
signal d_signal : std_logic;
signal q_signal : std_logic;



begin 
  dut: dff port map (
			clk => clk_signal,
			rst => rst_signal,
			d => d_signal,
			q => q_signal);


clk_signal <= not clk_signal after 5 ns;

test: process
begin
    rst_signal <= '0';
    d_signal <= '0';
    wait for 20 ns;
    --assert(q_signal='0') report "Fail 0/0" severity error;
    -- assert assume che la booleana dentro sia vera, sennò scrive la roba di report e decido il grado di severità della cosa



    rst_signal <= '0';
    d_signal <= '1';
    wait for 20 ns;
    --assert(q_signal='1') report "Fail 0/1" severity error;

    
    rst_signal <= '1';
    d_signal <= '1';
    wait for 20 ns;
    --assert(q_signal='1') report "Fail 1/1" severity error;
    
    rst_signal <= '1';
    d_signal <= '0';
    wait for 20 ns;






    rst_signal <= '1';
    d_signal <= 'X';
    wait for 20 ns;
    --assert(q_signal='1') report "Fail 1/X" severity error;


    -- Clear inputs
   rst_signal <= '0';
   d_signal <= '0';

    assert false report "Test done." severity note;
    wait for 20 ns;
 
end process test;
end architecture testbench;




