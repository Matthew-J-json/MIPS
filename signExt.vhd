
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sign_extension is
    Port ( a : in STD_LOGIC_VECTOR (15 downto 0);
           extended : out STD_LOGIC_VECTOR (31 downto 0) := ( others => '0'));
end sign_extension;

architecture Behavioral of sign_extension is 
signal firstbit : std_logic;
signal extendedIn : std_logic_vector (31 downto 0);

begin
    firstbit <= a(15);
    
    process begin
        if (firstbit = '0') then
            extendedIn <= x"0000" & a;
            wait;
        else
            extendedIn <= x"FFFF" & a;
            wait;
        end if;
        extended <= extendedIn;
    end process;

end Behavioral;
