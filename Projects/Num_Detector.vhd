library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Num_Detector is
Port (clk,rst,d: IN std_logic;
      q: OUT std_logic
       );
end Num_Detector;

architecture Behavioral of Num_Detector is

TYPE state IS (zero,one,two,three);
SIGNAL pr_state,nx_state: state;

begin
PROCESS (clk,rst)
BEGIN
    IF (rst = '1') THEN
        pr_state <= zero;
    ELSIF (rising_edge(clk)) THEN
        pr_state <= nx_state;
    END IF;
END PROCESS;

PROCESS(d,pr_state)
BEGIN
    CASE pr_state IS
    WHEN zero =>
    q <= '0';
        IF (d='1') THEN
            nx_state <= one;
        ELSIF (d='0') THEN
            nx_state <= zero;
        END IF;
        
     WHEN one =>
     q <= '0';
        IF  (d='1') THEN
            nx_state <= two;
        ELSIF (d='0') THEN
            nx_state <= zero;
        END IF; 
        
        WHEN two =>
        q <= '0';
            IF  (d='1') THEN
                nx_state <= three;
            ELSIF (d='0') THEN
                nx_state <= zero;
            END IF; 
         WHEN three =>
         q <= '1';
            IF  (d='1') THEN
                nx_state <= three;
            ELSIF (d='0') THEN
                nx_state <= zero;
            END IF;
     
     END CASE;
END PROCESS;

end Behavioral;
