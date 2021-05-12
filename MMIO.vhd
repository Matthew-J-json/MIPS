----------------------------------------------------------------------------------
-- only lw and sw

--if instruction is lw and the address is 48 then output is Din
-- if instruction is lw and  address is not 48, output is read_data
--if instruction is sw and address is 52, 

--lw
    --if mem address = 48, put x"000000" & Din into the register
--sw 
    --if mem address = 52, put content of source register (data2) into mmio
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MMIO is port(
    
    Memread   : in std_logic;                      --memread (from control unit)
    MemWrite  : in std_logic;                      --memwrite (control unit)
    Din       : in std_logic_vector (7 downto 0);  --Din (bigIO)
    ALUout    : in std_logic_vector (31 downto 0); --memaddr
    data2     : in std_logic_vector (31 downto 0); --from regfile
    read_data : in std_logic_vector (31 downto 0); --from datamem
    Dout      : out std_logic_vector (31 downto 0)

);
end MMIO;

architecture Behavioral of MMIO is

    signal lw : std_logic_vector(31 downto 0);
    signal internalReg : std_logic_vector (31 downto 0) := (others => '0');
begin

    logic: process (memread, memwrite) begin
        if (memread = '1') then                 --if memread is true, then it's lw
            if (ALUout = x"00000030") then      --if aluout (which is the memaddr) is 48 
                dout <= x"000000" & Din;          --dout is Din padded to 32 
            end if;
                
        elsif (memwrite = '1') then             --if memwrite is true, then it's sw
            if (ALUout=x"00000034") then        --if aluout (which is the memaddr) is 52
                internalReg <= data2;           --internal register is now data2
                dout <= read_data;              --dout is read_data
            end if;
        else 
            dout <= read_data;
        end if;
        
    end process logic;

end Behavioral;
