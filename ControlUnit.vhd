

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ControlUnit is
    Port (  RegDst   : out STD_LOGIC_vector (1 downto 0);
            jump     : out std_logic_vector (1 downto 0);
            Branch   : out std_logic;
            MemRead  : out std_logic; 
            MemtoReg : out std_logic_vector (1 downto 0);
            ALUop    : out std_logic_vector (5 downto 0);
            MemWrite : out std_logic;
            ALUSrc   : out std_logic_vector (1 downto 0);
            regWrite : out std_logic;
            
            Din      : in STD_LOGIC_VECTOR (5 downto 0);
            reset    : in STD_LOGIC
            );
end ControlUnit;

architecture Behavioral of ControlUnit is begin
    process(Din, reset) begin
        case reset is
            when '1' =>
                RegDst <= "00";   ALUsrc <= "00";  regWrite <= '0'; 
                MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                Branch <= '0';   ALUop <= Din; jump <= "00";
            when '0' =>
                case Din is
                    --J-TYPE
                    when "00" &x"2" =>
                        RegDst <= "10";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "01";
                    
                    when "00" &x"3" =>
                        RegDst <= "10";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "01";
                    
                    --I-type
                    when "00" & x"8" => --addi
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                    when "00" & x"9" => --addiu
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                    when "00" & x"c" => --andi
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                    when "00" & x"D" => --ori
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                    when "10" & x"3" => --lw
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "01"; MemRead <= '1'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                    when "10" & x"B" => --sw
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '1'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                    when "00" & x"4" => --beq
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '1';   ALUop <= Din; jump <= "00";
                    when "00" & x"5" => --bne
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '1';   ALUop <= Din; jump <= "00";
                    when "00" & x"A" => --slti
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                    when "00" & x"B" => --sltiu
                        RegDst <= "00";   ALUsrc <= "01";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                        
                    --R-type
                    when "00" & x"0" =>
                        RegDst <= "01";   ALUsrc <= "00";  regWrite <= '1'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0';
                        Branch <= '0';   ALUop <= Din; jump <= "00";
        
                    when others =>
                        RegDst <= "01";   ALUsrc <= "00";  regWrite <= '0'; 
                        MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0';
                        Branch <= '0';   ALUop <= Din; jump <= "00";
                end case;
                when others => 
                    RegDst <= "01";   ALUsrc <= "00";  regWrite <= '0'; 
                    MemtoReg <= "00"; MemRead <= '0'; MemWrite <= '0'; 
                    Branch <= '0';   ALUop <= Din; jump <= "00";
            end case;
        end process;
         


end Behavioral;
