library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fullAdder is
Port(
a:in STD_LOGIC;
b:in STD_LOGIC;
c:in STD_LOGIC;
sum:out STD_LOGIC;
carry:out STD_LOGIC;
c_out:out STD_LOGIC
);
end fullAdder;

architecture Structural of fullAdder is
component Half_Adder --implements the Half_adder entity from halfadder.vhd
Port(
a:in STD_LOGIC;
b:in STD_LOGIC;
sum:out STD_LOGIC;
carry:out STD_LOGIC
);  
end component;

signal s1:STD_LOGIC;
signal c1:STD_LOGIC;
signal c2:STD_LOGIC;
--implements 2 half adder logic circuits for the full adder logic
begin
HA_1:Half_Adder Port Map(
a => a,
b => b,
sum => s1,
carry => c1
); --1st half adder 
HA_2:Half_Adder Port Map(
a => s1,
b => c,
sum => sum,
carry => c2
);--2nd half adder

c_out <= c1 or c2;

end Structural;
