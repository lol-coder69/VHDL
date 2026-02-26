library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_8bit is
Port(
a:in std_logic_vector(7 downto 0);
b:in std_logic_vector(7 downto 0);
opcode:in std_logic_vector(3 downto 0);
res:out std_logic_vector(15 downto 0);
zf:out std_logic;
sf:out std_logic
);
end alu_8bit;

architecture Behaviour of alu_8bit is
signal tempRes:std_logic_vector(15 downto 0);
begin
process(a,b,opcode)
begin

case opcode is
when "0000" => 
tempRes <= a * b;
when "0001" => 
tempRes <= "00000000" & (a + b);
when "0010" => 
tempRes <= "00000000" & (a - b);
when "0011" => 
tempRes <= "00000000" & (a and b);
when "0111" => 
tempRes <= "00000000" & (a or b);
when "0110" =>
tempRes <= "00000000" & (a nand b); 
when "0100" =>
tempRes <= "00000000" & (a xor b);
when "0101" =>
tempRes <=  "00000000" & (a + 1);
when "1000" =>
tempRes <= "00000000" & (a - 1);
when "1001" =>
tempRes <= "00000000" & (b - 1);
when "1010" =>
tempRes <= "00000000" & (b + 1);
when others =>
tempRes <= "0000000000000000";
end case;
end process;

res <= tempRes;
sf <= tempRes(15);

process(tempRes)
begin
if(tempRes = "0000000000000000") then
zf <= '1';
else
zf <= '0';
end if;
end process;

end Behaviour;
