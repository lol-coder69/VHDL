library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu_8bit is
end tb_alu_8bit;

architecture Behavior of tb_alu_8bit is
    component alu_8bit
    port(
         a      : in  std_logic_vector(7 downto 0);
         b      : in  std_logic_vector(7 downto 0);
         opcode : in  std_logic_vector(3 downto 0);
         res    : out std_logic_vector(15 downto 0);
         zf     : out std_logic;
         sf     : out std_logic;
         cf     : out std_logic
        );
    end component;
    signal a      : std_logic_vector(7 downto 0) := (others => '0');
    signal b      : std_logic_vector(7 downto 0) := (others => '0');
    signal opcode : std_logic_vector(3 downto 0) := (others => '0');
    signal res    : std_logic_vector(15 downto 0);
    signal zf     : std_logic;
    signal sf     : std_logic;
    signal cf     : std_logic;
    constant clock_period : time := 100 ps;
    signal clk : std_logic := '0';
begin
    uut: alu_8bit port map (
          a => a, 
          b => b, 
          opcode => opcode, 
          res => res, 
          zf => zf, 
          sf => sf,
          cf => cf
        );
    clk_process :process
    begin
        clk <= '0'; wait for clock_period/2;
        clk <= '1'; wait for clock_period/2;
    end process;
    stim_proc: process
    begin		
        a <= "11111111"; b <= "11111111";
        opcode <= "0000";
        wait for 200 ps;

        a <= "00001010"; b <= "00010100";
        opcode <= "0001";
        wait for 200 ps;

        a <= "00001111"; b <= "00001111";
        opcode <= "0010";
        wait for 200 ps;

        a <= "11110000"; b <= "10101010";
        opcode <= "0011";
        wait for 200 ps;

        a <= "11110000"; b <= "00001111";
        opcode <= "0111";
        wait for 200 ps;

        a <= "11111111"; b <= "11111111";
        opcode <= "0110";
        wait for 200 ps;

        a <= "10101010"; b <= "01010101";
        opcode <= "0100";
        wait for 200 ps;

        a <= "00000101";
        opcode <= "0101";
        wait for 200 ps;

        a <= "00000101";
        opcode <= "1000";
        wait for 200 ps;

        b <= "00001010";
        opcode <= "1001";
        wait for 200 ps;

        b <= "00001010";
        opcode <= "1010";
        wait for 200 ps;

        opcode <= "1111";
        wait for 200 ps;
    end process;

end Behavior;
