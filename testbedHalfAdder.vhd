library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ha_TestBed is
end ha_TestBed;

architecture Behaviour of ha_TestBed is
component Half_adder
Port(
   a:in STD_LOGIC;
   b:in STD_LOGIC;
   sum:out STD_LOGIC;
   carry:out STD_LOGIC
);
end component;

signal a_in: STD_LOGIC := '0';
signal b_in: STD_LOGIC := '0';

signal sum_out: STD_LOGIC;
signal carry_out: STD_LOGIC;

begin
   uut:Half_adder Port Map(
      a => a_in,
      b => b_in,
      sum => sum_out,
      carry => carry_out
);

stim_proc: process
begin
   a_in <= '0';
   b_in <= '0';
   wait for 200 ps;

   a_in <= '1';
   b_in <= '0';
   wait for 200 ps;

   a_in <= '0';
   b_in <= '1';
   wait for 200 ps;

   a_in <= '1';
   b_in <= '1';
   wait for 200 ps;

   wait;
end process;

end Behaviour;
