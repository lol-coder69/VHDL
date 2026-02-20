library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pipo_reg is
Port(
clock:in std_logic;
reset:in std_logic;
d:in std_logic_vector(3 downto 0);
q:out std_logic_vector(3 downto 0)
);
end pipo_reg;

architecture Behaviour of pipo_reg is
begin
process(clock,reset)
begin
if(reset = '1') then
q <= "0000";
elsif(rising_edge(clock)) then
q <= d;
end if;
end process;

end Behaviour;
