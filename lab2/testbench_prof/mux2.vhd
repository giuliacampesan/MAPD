library IEEE;
use IEEE.std_logic_1164.all;
entity mux2 is
	port(
		a1 : in std_logic_vector(2 downto 0);
		a2 : in std_logic_vector(2 downto 0);
		sel : in std_logic;
		b : out std_logic_vector(2 downto 0));
end mux2;
architecture rtl of mux2 is
begin
	p_mux : process(a1, a2, sel)
	begin
		case sel is
			when '0'	=> b <= a1;
			when '1'	=> b <= a2;
			when others => b <= "000";
		end case;
	end process p_mux;
end rtl;
