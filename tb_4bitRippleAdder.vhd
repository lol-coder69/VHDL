library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RippleAdd4TB is
end RippleAdd4TB;

architecture Behaviour of RippleAdd4TB is
component RippleAdder4
Port(
a:in STD_LOGIC_VECTOR(3 downto 0);
b:in STD_LOGIC_VECTOR(3 downto 0);
c:in STD_LOGIC;
s:out STD_LOGIC_VECTOR(3 downto 0);
c_out:out STD_LOGIC
);
end component;

signal a:STD_LOGIC_VECTOR(3 downto 0):=(others => '0');
signal b:STD_LOGIC_VECTOR(3 downto 0):=(others => '0');
signal c:STD_LOGIC:='0';

signal s:STD_LOGIC_VECTOR(3 downto 0);
signal c_out:STD_LOGIC;

begin
uut:RippleAdder4 Port Map(
a => a,
b => b,
c => c,
s => s,
c_out => c_out
);

stim_proc:process
begin
a <= "0100";
b <= "0011";
c <= '0';
wait for 200 ps;

a <= "1010";
b <= "0100";
c <= '0';
wait for 200 ps;

a <= "1111";
b <= "0001";
c <= '0';
wait for 200 ps;

wait;
end process;

end Behaviour;
