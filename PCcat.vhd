

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PCcat is
    Port ( pcadd : in STD_LOGIC_VECTOR (31 downto 0);
           shifted : in STD_LOGIC_VECTOR (27 downto 0);
           Jadd : out STD_LOGIC_VECTOR (31 downto 0));
end PCcat;

architecture Behavioral of PCcat is

begin
Jadd <= pcadd(31 downto 28) & shifted;


end Behavioral;
