library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbed_fa is
end testbed_fa;

architecture Behaviour of testbed_fa is
component fullAdder
Port(
a:in STD_LOGIC;
b:in STD_LOGIC;
c:in STD_LOGIC;
sum:out STD_LOGIC;
c_out:out STD_LOGIC
);
end component;

signal a: STD_LOGIC := '0';
signal b: STD_LOGIC := '0';
signal c: STD_LOGIC := '0';

signal c_out: STD_LOGIC;
signal sum: STD_LOGIC;

begin
uut:fullAdder Port Map(
a => a,
b => b,
c => c,
sum => sum,
c_out => c_out
);

sim_proc:process
begin
a <= '0';
b <= '0';
c <= '0';
wait for 200 ps;

a <= '0';
b <= '0';
c <= '1';
wait for 200 ps;

a <= '0';
b <= '1';
c <= '0';
wait for 200 ps;

a <= '0';
b <= '0';
c <= '0';
wait for 200 ps;

a <= '1';
b <= '0';
c <= '0';
wait for 200 ps;

a <= '1';
b <= '1';
c <= '0';
wait for 200 ps;

a <= '1';
b <= '0';
c <= '1';
wait for 200 ps;

a <= '1';
b <= '1';
c <= '1';
wait for 200 ps;

wait;
end process;
end Behaviour;
