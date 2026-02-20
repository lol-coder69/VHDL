library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbedsipo is
end testbedsipo;

architecture Behaviour of testbedsipo is
component sipo_register
Port(
clock:in STD_LOGIC;
reset:in STD_LOGIC;
d:in STD_LOGIC;
q:out STD_LOGIC_VECTOR(3 downto 0)
);
end component;

signal clock:STD_LOGIC := '0';
signal reset:STD_LOGIC := '0';
signal d:STD_LOGIC := '0';

signal q:STD_LOGIC_VECTOR(3 downto 0);

constant clkPeriod:time := 200 ps;

begin
uut:sipo_register Port Map(
clock => clock,
reset => reset,
d => d,
q => q
);
clkProcess:process
begin
clock <= '0';
wait for clkPeriod/2;

clock <= '1';
wait for clkPeriod/2;
end process;

stim_proc:process
begin
reset <= '1';
wait for 400 ps;
reset <= '0';

d <= '1';
wait for 200 ps;

d <= '0';
wait for 200 ps;

d <= '1';
wait for 200 ps;

d <= '1';
wait for 200 ps;

d <= '0';
wait for 200 ps;

wait;
end process;

end Behaviour;