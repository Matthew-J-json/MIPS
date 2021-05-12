--========================================================================
---ECE445 Spring 2014
---Instruction Memeory containing the test program for jump instructions
---=======================================================================
--------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

entity instmem is
    Port ( read_inst : in  STD_LOGIC_VECTOR (31 downto 0);
           inst_out : out  STD_LOGIC_VECTOR (31 downto 0));
end instmem;

architecture Behavioral of instmem is 
signal a1,a2,a3,a4:std_logic_vector(7 downto 0);
type instmem is array (0 to (64*4-1) ) of std_logic_vector (7 downto 0);
signal RAM: instmem:=(
							
							--x"20",x"10",x"00",x"30",-- 0x00: addi $s0, $zero, 48 
							--x"8e",x"08",x"00",x"00",-- 0x04: lw $t0, 0($s0) 
							--x"ae",x"08",x"00",x"04",-- 0x08: sw $t0, 4($s0) 
							--x"21",x"08",x"00",x"01",-- 0x0C: addi $t0, $t0, 1 
							--x"ac",x"08",x"00",x"08",-- 0x10: sw $t0, 8($zero) 
							--x"8c",x"09",x"00",x"08",-- 0x14: lw $t1, 8($zero) 
							--x"ae",x"09",x"00",x"04",-- 0x18: sw $t1, 4($s0) 
							--x"01",x"20",x"40",x"20",-- 0x1C: add $t0, $t1, $zero 
							--x"08",x"00",x"00",x"03",-- 0x20: j loop 
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",
							x"00",x"00",x"00",x"00",-- 0x00: (empty location)
							x"00",x"00",x"00",x"00",-- 0x04: (empty location)
							x"00",x"00",x"00",x"00",-- 0x08: (empty location)
							x"00",x"00",x"00",x"00",-- 0x0c: (empty location)
							x"00",x"00",x"00",x"00",-- 0x20: (empty location)
							x"00",x"00",x"00",x"00",-- 0x24: (empty location)
							x"00",x"00",x"00",x"00",-- 0x28: (empty location)
							x"00",x"00",x"00",x"00",-- 0x2C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x30: (empty location)
							x"00",x"00",x"00",x"00",-- 0x34: (empty location)
							x"00",x"00",x"00",x"00",-- 0x38: (empty location)
							x"00",x"00",x"00",x"00",-- 0x3C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x40: (empty location)
							x"00",x"00",x"00",x"00",-- 0x44: (empty location)
							x"00",x"00",x"00",x"00",-- 0x48: (empty location)
							x"00",x"00",x"00",x"00",-- 0x4C: (empty location)
							x"00",x"00",x"00",x"00",-- 0x50: (empty location)
							x"00",x"00",x"00",x"00",-- 0x54: (empty location)
							x"8c",x"0b",x"00",x"30",-- 0x58: (lw $t3, 48($zero))             #lw from 48($zero) is read from MMIO, which will take from Din
							x"00",x"00",x"40",x"20",-- 0x5C: (add  $t0, $zero, $zero         # $t0 will be the "previous" value)
							x"20",x"09",x"00",x"01",-- 0x60: (addi $t1, $zero, 1 	         # first value = 1)
							x"20",x"11",x"00",x"01",-- 0x64: (addi $s1, $zero, 1	         # $s1 = 1 so I can compare to the integers LSB)
							x"31",x"32",x"00",x"01",-- 0x68: (main:	andi $s2, $t1, 1         # get LSB of $t1	)
							x"12",x"51",x"00",x"05",-- 0x6C: (beq  $s2, $s1, odd	    # if LSB of $t1 is 1, then value is odd, branch to odd)
							x"0c",x"10",x"00",x"0e",-- 0x70: (jal even                  # jump and link to even)
							x"21",x"2a",x"00",x"00",-- 0x74: (addi $t2, $t1, 0 	        # $t2 is $t1 )
							x"01",x"28",x"48",x"20",-- 0x78: (add  $t1, $t1, $t0        # $t1 is $t1 + $t0 (current + previous))
							x"01",x"60",x"40",x"20",-- 0x7C: (add $t0, $t3, $zero       # $t0 is the previous $t1)
							x"08",x"10",x"00",x"03",-- 0x80: (j  main                   # go back to main)
							x"01",x"29",x"50",x"20",-- 0x84: (odd:    add $t2, $t1, $t1 # $t2 is 2*$t1)
							x"01",x"20",x"40",x"20",-- 0x88: (add $t0, $t1, $zero       # $t0 is $t1)
							x"01",x"40",x"48",x"20",-- 0x8C: (add $t1, $t2, $zero       # $t1 is $t2 = 2*$t1)
							x"08",x"10",x"00",x"03",-- 0x90: (j main	                # go back to main)
							x"12",x"51",x"00",x"02",-- 0x94: (even:   beq  $s2, $s1, evenfalse	# if LSB of $t1 is 1, then value is odd, branch to odd)
							x"20",x"02",x"00",x"01",-- 0x98: (eventrue: addi $v0, $zero, 1)
							x"03",x"e0",x"00",x"08",-- 0x9C: (jr $ra)
							x"00",x"00",x"10",x"20",-- 0xA0: (evenfalse:	add $v0, $zero, $zero)
							x"03",x"e0",x"00",x"08",-- 0xA4: (jr $ra			# return to the jal instruction)
							x"00",x"00",x"00",x"00",-- 0xA8: (empty location)
							x"00",x"00",x"00",x"00",-- 0xAC: (empty location)
							x"00",x"00",x"00",x"00",-- 0xB0: (empty location)
							x"00",x"00",x"00",x"00",-- 0xB4: (empty location)
							x"00",x"00",x"00",x"00",-- 0xB8: (empty location)
							x"00",x"00",x"00",x"00",-- 0xBC: (empty location)
							x"00",x"00",x"00",x"00",-- 0xC0: (empty location)
							x"00",x"00",x"00",x"00",-- 0xC4: (empty location)
							x"00",x"00",x"00",x"00",-- 0xC8: (empty location)
							x"00",x"00",x"00",x"00",-- 0xCC: (empty location)
							x"00",x"00",x"00",x"00",-- 0xD0: (empty location)
							x"00",x"00",x"00",x"00",-- 0xD4: (empty location)
							x"00",x"00",x"00",x"00",-- 0xD8: (empty location)
							x"00",x"00",x"00",x"00",-- 0xDC: (empty location)
							x"00",x"00",x"00",x"00",-- 0xE0: (empty location)
							x"00",x"00",x"00",x"00",-- 0xE4: (empty location)
							x"00",x"00",x"00",x"00",-- 0xE8: (empty location)
							x"00",x"00",x"00",x"00",-- 0xEC: (empty location)
							x"00",x"00",x"00",x"00",-- 0xF0: (empty location)
							x"00",x"00",x"00",x"00",-- 0xF4: (empty location)
							x"00",x"00",x"00",x"00",-- 0xF8: (empty location)
							x"00",x"00",x"00",x"00" -- 0xFF: (empty location)--255
							);	
begin	
	a1<=read_inst(7 downto 0);
	a2<=read_inst(7 downto 0)+1;
	a3<=read_inst(7 downto 0)+2;
	a4<=read_inst(7 downto 0)+3;
inst_out(7 downto 0)  <= RAM(conv_integer(unsigned(a4)));
inst_out(15 downto 8) <= RAM(conv_integer(unsigned(a3)));
inst_out(23 downto 16)<= RAM(conv_integer(unsigned(a2)));
inst_out(31 downto 24)<= RAM(conv_integer(unsigned(a1)));
end Behavioral;
