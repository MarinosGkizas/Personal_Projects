library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

--Traffic Light Controller
entity TLC is
Port ( clk,rst: IN std_logic;
       NS_RED,NS_YELLOW,NS_GREEN: OUT std_logic;
       WE_RED,WE_YELLOW,WE_GREEN: OUT std_logic;
       counter_o: OUT INTEGER );
end TLC;

architecture Behavioral of TLC is

TYPE state IS (S0,S1,S2,S3);
SIGNAL pr_state,nx_state : state;

SIGNAL counter: INTEGER:= 0;
CONSTANT GREEN_TIME :INTEGER:=10;
CONSTANT YELLOW_TIME : INTEGER := 3;

begin
PROCESS(clk,rst)
BEGIN
   IF (rst = '1') THEN
        pr_state <= S0;
        counter <= GREEN_TIME;
   ELSIF rising_edge(clk) THEN 
    IF counter = 0 THEN
        pr_state <= nx_state;
         IF (nx_state = S0 OR nx_state = S2) THEN
            counter <= GREEN_TIME;
        ELSE
            counter <= YELLOW_TIME;
        END IF;
    ELSE
        counter <= counter -1;
    END IF;
   END IF;
END PROCESS;

PROCESS(pr_state)
BEGIN
                
        CASE pr_state IS
        WHEN S0 => 
            NS_RED <= '0';
            NS_YELLOW <= '0';
            NS_GREEN <= '1';
            
            WE_RED <= '1';
            WE_YELLOW <= '0';
            WE_GREEN <= '0';
            
            nx_state <= S1;
            
            
        WHEN S1 =>
            NS_RED <= '0';
            NS_YELLOW <= '1';
            NS_GREEN <= '0';
            
            WE_RED <= '1';
            WE_YELLOW <= '0';
            WE_GREEN <= '0';
            
            nx_state <= S2;
            
        WHEN S2 =>
            NS_RED <= '1';
            NS_YELLOW <= '0';
            NS_GREEN <= '0';
            
            WE_RED <= '0';
            WE_YELLOW <= '0';
            WE_GREEN <= '1';
            
            nx_state <= S3;
            
        WHEN S3 =>
            NS_RED <= '1';
            NS_YELLOW <= '0';
            NS_GREEN <= '0';
            
            WE_RED <= '0';
            WE_YELLOW <= '1';
            WE_GREEN <= '0';
            
            nx_state <= S0;
            
            
        
        END CASE;
 
END PROCESS;

counter_o <= counter; --For testbench access only
end Behavioral;
