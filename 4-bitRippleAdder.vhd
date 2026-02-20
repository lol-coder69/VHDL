library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleAdder4 is
Port(
a:in STD_LOGIC_VECTOR(3 downto 0);
b:in STD_LOGIC_VECTOR(3 downto 0);
c:in STD_LOGIC;
s:out STD_LOGIC_VECTOR(3 downto 0);
c_out:out STD_LOGIC
);
end RippleAdder4;

architecture Structural of RippleAdder4 is
component fullAdder
Port(
a:in STD_LOGIC;
b:in STD_LOGIC;
c:in STD_LOGIC;
sum:out STD_LOGIC;
c_out:out STD_LOGIC
);
end component;

signal c0:STD_LOGIC;
signal c1:STD_LOGIC;
signal c2:STD_LOGIC;

begin
fa0:fullAdder Port Map(
a => a(0),
b => b(0),
c => c,
sum => s(0),
c_out => c0
);

fa1:fullAdder Port Map(
a => a(1),
b => b(1),
c => c0,
sum => s(1),
c_out => c1
);

fa2:fullAdder Port Map(
a => a(2),
b => b(2),
c => c1,
sum => s(2),
c_out => c2
);

fa3:fullAdder Port MAp(
a => a(3),
b => b(3),
c => c2,
sum => s(3),
c_out => c_out
);
end Structural;
