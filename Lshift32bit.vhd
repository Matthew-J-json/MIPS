
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Lshift32bit is
    Port ( Din : in STD_LOGIC_VECTOR (31 downto 0);
           Dout : out STD_LOGIC_VECTOR (31 downto 0));
end Lshift32bit;

architecture Behavioral of Lshift32bit is
signal Dout34: std_logic_vector(33 downto 0);
begin
    Dout34 <= Din & "00";
    Dout <= Dout34(31 downto 0);

end Behavioral;
