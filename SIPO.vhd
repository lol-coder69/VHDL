library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sipo_register is
Port(
clock:in STD_LOGIC;
reset:in STD_LOGIC;
d:in STD_LOGIC;
q:out STD_LOGIC_VECTOR(3 downto 0)
);
end sipo_register;

architecture Behaviour of sipo_register is
signal temp_r:STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
process(clock,reset)
begin
if(reset = '1') then
temp_r <= "0000";
elsif(rising_edge(clock))then
temp_r <= temp_r(2 downto 0) & d;
end if;
end process;

q <= temp_r;

end Behaviour;
