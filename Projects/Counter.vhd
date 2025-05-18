LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY Counter IS
PORT(clk: IN std_logic;
    reset: IN std_logic;
    outp: OUT std_logic_vector (3 downto 0));
END ENTITY;

ARCHITECTURE Circuit OF Counter IS
SIGNAL outp2: unsigned (3 downto 0);
BEGIN
    PROCESS(clk)
    BEGIN
    IF(rising_edge(clk)) THEN
    outp2<= outp2 + 1;
        IF (reset='1') THEN
        outp2<= (OTHERS => '0');
        END IF;
    END IF;
    
    END PROCESS;
    outp<= std_logic_vector(outp2);
END ARCHITECTURE;