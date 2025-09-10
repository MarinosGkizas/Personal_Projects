library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Candy_Machine is
Port ( clk,rst: IN std_logic;
        ni,di,qi: IN BOOLEAN;
        co,no,do: OUT std_logic);
end Candy_Machine;

architecture Behavioral of Candy_Machine is

TYPE state IS (st0,st5,st10,st15,st20,st25,st30,st35,st40,st45);
SIGNAL pr_state,nx_state: state;

begin
PROCESS(rst,clk)
BEGIN
    IF(rst = '1') THEN
        pr_state <= st0;
    ELSIF (rising_edge(clk)) THEN
        pr_state <= nx_state;
    END IF;
END PROCESS;

PROCESS(ni,di,qi,pr_state)
BEGIN
    CASE pr_state IS
        WHEN st0 => 
            co <= '0';
            no <= '0';
            do <= '0';
            IF (ni) THEN nx_state <= st5;
            ELSIF (di) THEN nx_state <= st10;
            ELSIF (qi) THEN nx_state <= st25;
            ELSE nx_state <= st0;
            END IF;
        WHEN st5 =>
            co <= '0';
            no <= '0';
            do <= '0';
            IF (ni) THEN nx_state <= st10;
            ELSIF (di) THEN nx_state <= st15;
            ELSIF (qi) THEN nx_state <= st30;
            ELSE nx_state <= st5;
            END IF;
        WHEN st10 =>
            co <= '0';
            no <= '0';
            do <= '0';
            IF (ni) THEN nx_state <= st15;
            ELSIF(di) THEN nx_state <= st25;
            ELSIF (qi) THEN nx_state <= st35;
            ELSE nx_state <= st10;
            END IF;
        WHEN st15 =>
            co <= '0';
            no <= '0';
            do <= '0';
            IF (ni) THEN nx_state <= st20;
            ELSIF (di) THEN nx_state <= st25;
            ELSIF (qi) THEN nx_state <= st40;
            ELSE nx_state <= st15;
            END IF;
        WHEN st20 =>
            co <= '0';
            no <= '0';
            do <= '0';
            IF (ni) THEN nx_state <= st25;
            ELSIF (di) THEN nx_state <= st30;
            ELSIF (qi) THEN nx_state <= st45;
            ELSE nx_state <= st20;
            END IF;
        WHEN st25 =>
            co <= '1';
            no <= '0';
            do <= '0';            
            nx_state <= st0;          
        WHEN st30 =>
            co <= '1';
            no <= '1';
            do <= '0';            
            nx_state <= st0;
         WHEN st35 =>
            co <= '1';
            no <= '0';
            do <= '1';            
            nx_state <= st0;
         WHEN st40 =>
            co <= '0';
            no <= '1';
            do <= '0';            
            nx_state <= st35;
         WHEN st45 =>
            co <= '0';
            no <= '0';
            do <= '1';            
            nx_state <= st35;  
     END CASE;
     
END PROCESS;
end Behavioral;
