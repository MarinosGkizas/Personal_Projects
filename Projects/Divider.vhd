library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Divider is
GENERIC(n: INTEGER := 3);
Port (a,b: IN INTEGER RANGE 0 TO 7;
    rest: OUT INTEGER RANGE 0 TO 7;
    err: OUT std_logic;
    y: OUT std_logic_vector (n downto 0)
     );
end Divider;

architecture Behavioral of Divider is

begin

PROCESS(a,b)

VARIABLE temp1,temp2: INTEGER RANGE 0 TO 7;

BEGIN
    temp1:=a;
    temp2 :=b;
    IF(b=0) THEN
        err <= '1';
    ELSE 
        err <= '0';
    END IF;
    
    FOR i IN N DOWNTO 0 LOOP
        IF (temp1 >= temp2 * 2**i) THEN
            y(i) <= '1';
            temp1 := temp1 - temp2 * 2**i;
        ELSE y(i) <= '0';
        END IF;
    END LOOP;
rest <= temp1;
END PROCESS;



end Behavioral;
