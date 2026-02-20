library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_4bitalu is
end tb_4bitalu;

architecture Behaviour of tb_4bitalu is
component alu_4bit 
Port(
a:in std_logic_vector(3 downto 0);
b:in std_logic_vector(3 downto 0);
opcode:in std_logic_vector(2 downto 0);
res:out std_logic_vector(7 downto 0);
zf:out std_logic;
sf:out std_logic;
ovflow:out std_logic
);
end component;

signal a:std_logic_vector(3 downto 0) := (others => '0');
signal b:std_logic_vector(3 downto 0) := (others => '0');
signal opcode:std_logic_vector(2 downto 0) := (others => '0');

signal res:std_logic_vector(7 downto 0);
signal zf:std_logic;
signal sf:std_logic;
signal ovflow:std_logic;

begin
uut: alu_4bit Port Map(
a => a,
b => b,
opcode => opcode,
res => res,
zf => zf,
sf => sf,
ovflow => ovflow
);

stim_proc:process
begin
a <= "0101";
b <= "0011";

opcode <= "000";
wait for 200 ps;

opcode <= "001";
wait for 200 ps;

opcode <= "010";
wait for 200 ps;

opcode <= "011";
wait for 200 ps;

opcode <= "111";
wait for 200 ps;

opcode <= "110";
wait for 200 ps;

opcode <= "100";
wait for 200 ps;

a <= "0101";
b <= "0101";

opcode <= "001";
wait for 200 ps;

a <= "0011";
b <= "0101";

opcode <= "001";
wait for 200 ps;

a <= "0111";
b <= "0111";

opcode <= "000";
wait for 200 ps;

a <= "1110";
b <= "1100";

opcode <= "101";
wait for 200 ps;

wait;
end process;

end Behaviour;
