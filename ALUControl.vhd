
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ALUControl is
    Port ( aluop : in STD_LOGIC_VECTOR (5 downto 0);
           funct: in std_logic_vector (5 downto 0);
           Dout : out STD_LOGIC_VECTOR (3 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is begin


    process (aluop, funct) begin
        case aluop is
            when "00" & x"0" =>
                case funct is
                    --R-types
                    when "100000" => Dout <= "0010"; --add
                    when "100001" => Dout <= "0010"; --add unsigned
                    when "100010" => Dout <= "0110"; --sub
                    when "100011" => Dout <= "0110"; --sub unsigned
                    when "100100" => Dout <= "0000"; --and
                    when "100101" => Dout <= "0001"; --or
                    when "100110" => Dout <= "0011"; --xor
                    when "100111" => Dout <= "1100"; --nor
                    when "101010" => Dout <= "1010"; --slt
                    when "101011" => Dout <= "1010"; --sltu
                    when others   => Dout <= "1111"; --she bust
                end case;
            when "00" & x"8" => --addi
                Dout <= x"2";
            when "00" & x"9" => --addiu
                Dout <= x"2";
            when "00" & x"c" => --andi
                Dout <= x"0";
            when "00" & x"D" => --ori
                Dout <= x"1";
            when "10" & x"3" => --lw
                Dout <= x"2";
            when "10" & x"B" => --sw
                Dout <= x"2";
            when "00" & x"4" => --beq
                Dout <= x"6";
            when "00" & x"5" => --bne
                Dout <= x"6";
            when "00" & x"A" => --slti
                Dout <= x"6";
            when "00" & x"B" => --sltiu
                Dout <= x"6";
            when others =>      --she bust 
                Dout <= x"0"; 
        end case;
        
    end process;
end Behavioral;
