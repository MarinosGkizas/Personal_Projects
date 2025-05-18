library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FSM_1 is
Port ( clk,rst,inp: IN std_logic;
    outp: OUT std_logic_vector (1 downto 0) );
end FSM_1;

architecture Behavioral of FSM_1 is
TYPE state IS (one,two,three,four);
SIGNAL pr_state,nx_state: state;
begin

PROCESS(clk)
BEGIN
    IF (rst='1') THEN
        pr_state <= one;
    ELSIF (rising_edge(clk)) THEN
        pr_state <= nx_state;
    END IF;
END PROCESS;

PROCESS(pr_state)
BEGIN
    CASE pr_state IS
        WHEN one =>
            outp <= "00";
            IF(inp = '0') THEN
                nx_state <= one;
            ELSIF (inp='1') THEN
                nx_state<= two;
            END IF;
         WHEN two =>
            outp <= "01";
            IF(inp = '0') THEN
                nx_state <= three;
            ELSIF (inp='1') THEN
                nx_state <= four;
            END IF;
         WHEN three =>
            outp <= "10";
            IF(inp = '0') THEN
                nx_state <= three;
            ELSIF (inp = '1') THEN
                nx_state <= four;
            END IF;
         WHEN four =>
            outp <= "11";
            IF(inp = '0') THEN
                nx_state <= two;
            ELSIF (inp = '1') THEN
                nx_state <= one;
            END IF;
     END CASE;
END PROCESS;


end Behavioral;
