
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity AND1bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : out STD_LOGIC_vector (1 downto 0));
end AND1bit;

architecture Behavioral of AND1bit is

begin
    C <= '0' & (A and B);

end Behavioral;
