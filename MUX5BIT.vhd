
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX5BIT is
    Port ( 
           S : in STD_LOGIC_VECTOR (1 downto 0);
           A : in STD_LOGIC_VECTOR (4 downto 0);
           B : in STD_LOGIC_VECTOR (4 downto 0);
           C : in STD_LOGIC_VECTOR (4 downto 0);
           D : out STD_LOGIC_VECTOR (4 downto 0));
end MUX5BIT;

architecture Behavioral of MUX5BIT is

begin

    with S select 
    D <= A when "00",
         B when "01",
         C when "10",
         '1'&x"F" when others;

end Behavioral;
