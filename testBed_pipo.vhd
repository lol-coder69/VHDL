library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_pipo_reg is
end tb_pipo_reg;

architecture Behavior of tb_pipo_reg is
    component pipo_reg
    port(
         clock : in  std_logic;
         reset : in  std_logic;
         d     : in  std_logic_vector(3 downto 0);
         q     : out std_logic_vector(3 downto 0)
        );
    end component;

    signal clock : std_logic := '0';
    signal reset : std_logic := '0';
    signal d     : std_logic_vector(3 downto 0) := (others => '0');

    signal q     : std_logic_vector(3 downto 0);

    constant clock_period : time := 200 ps;
   
begin
    uut: pipo_reg port map (
          clock => clock,
          reset => reset,
          d     => d,
          q     => q
        );
    clk_process :process
    begin
        clock <= '0';
        wait for clock_period/2;
        clock <= '1';
        wait for clock_period/2;
    end process;
    stim_proc: process
    begin	
        reset <= '1';
        d <= "1111"; 
        wait for 400 ps;

        reset <= '0';
        d <= "1010";
        wait for 400 ps;

        d <= "0101"; 
        wait for 400 ps;
 
        d <= "1111"; 
        wait for 400 ps;

        reset <= '1';
        wait for 200 ps;

        wait; 
    end process;

end Behavior;
