

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;


entity ADD is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           C : out STD_LOGIC_VECTOR (31 downto 0));
end ADD;

architecture Behavioral of ADD is
signal a33, b33:  std_logic_vector(32 downto 0):=(others=>'0');
signal sum:  std_logic_vector(32 downto 0):=(others=>'0');
begin

a33 <= '0'& A;
b33 <='0' & B;
sum <= a33 + b33;
C <= sum (31 downto 0);
end Behavioral;
