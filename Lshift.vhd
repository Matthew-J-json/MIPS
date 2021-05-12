
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Lshift is
    Port ( Din : in STD_LOGIC_VECTOR (25 downto 0);
           Dout : out STD_LOGIC_VECTOR (27 downto 0));
end Lshift;

architecture Behavioral of Lshift is
signal Dout28: std_logic_vector(27 downto 0);
begin
    Dout28 <= Din & "00";
    Dout <= Dout28(27 downto 0);

end Behavioral;
