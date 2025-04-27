library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Signal_Generator is
Port ( clk: IN std_logic;
    outp: OUT std_logic );
end Signal_Generator;

architecture Behavioral of Signal_Generator is

TYPE state IS (one,two,three);
SIGNAL pr_state1,nx_state1,pr_state2,nx_state2: state;
SIGNAL out1,out2: std_logic;

begin
PROCESS(clk)
BEGIN
    IF(rising_edge(clk)) THEN
        pr_state1 <= nx_state1;
    END IF;
END PROCESS;

PROCESS(clk)
BEGIN
    IF(falling_edge(clk)) THEN
        pr_state2 <= nx_state2;
    END IF;
END PROCESS;

-------------------

PROCESS(pr_state1)
BEGIN
    CASE pr_state1 IS
    WHEN one =>
        out1 <= '0';
        nx_state1 <= two;
    WHEN two => 
        out1 <= '1';
        nx_state1 <= three;
    WHEN three =>
        out1 <= '1';
        nx_state1 <= one;
    END CASE;
END PROCESS;

PROCESS(pr_state2)
BEGIN
    CASE pr_state2 IS
    WHEN one =>
        out2 <= '1';
        nx_state2 <= two;
    WHEN two => 
        out2 <= '0';
        nx_state2 <= three;
    WHEN three =>
        out2 <= '1';
        nx_state2 <= one;
    END CASE;
END PROCESS;

outp <= out1 AND out2;

end Behavioral;
