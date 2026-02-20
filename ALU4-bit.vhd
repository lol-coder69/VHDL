library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu_4bit is
Port(
a:in std_logic_vector(3 downto 0);
b:in std_logic_vector(3 downto 0);
opcode:in std_logic_vector(2 downto 0);
res:out std_logic_vector(7 downto 0);
zf:out std_logic;
sf:out std_logic;
ovflow:out std_logic
);
end alu_4bit;

architecture Behaviour of alu_4bit is
signal tempRes:std_logic_vector(7 downto 0);
signal tempOvf:std_logic;
begin
process(a,b,opcode)
begin
tempOvf <= '0';
case opcode is
when "000" => 
tempRes <= "0000" & (a + b);
if(a(3) = b(3) and tempRes(3) /= a(3)) then
tempOvf <= '1';
end if;
when "001" => 
tempRes <= "0000" & (a - b);
if(a(3) /= b(3) and tempRes(3) /= a(3)) then
tempOvf <= '1';
end if;
when "010" => 
tempRes <= "0000" & (a and b);
when "011" => 
tempRes <= "0000" & (a or b);
when "111" => 
tempRes <= "0000" & (a - 1);
when "110" =>
tempRes <= "0000" & (a + 1);
when "100" =>
tempRes <= "0000" & (a xor b);
when "101" =>
tempRes <=  a * b;
when others =>
tempRes <= "00000000";
end case;
end process;

res <= tempRes;
sf <= tempRes(7);
ovflow <= tempOvf;

process(tempRes)
begin
if(tempRes = "00000000") then
zf <= '1';
else
zf <= '0';
end if;
end process;

end Behaviour;
