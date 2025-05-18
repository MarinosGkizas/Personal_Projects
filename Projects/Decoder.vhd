LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Decoder IS
PORT(a,b: IN std_logic;
o1,o2,o3,o4: OUT std_logic);
END ENTITY;

ARCHITECTURE Circuit OF Decoder IS
BEGIN
PROCESS(a,b)
BEGIN
IF (a='0' AND b='0')THEN
    o1 <= '0';
    o2 <= '0';
    o3 <= '0';
    o4 <= '1';
 ELSIF (a='0' AND b='1') THEN
    o1 <= '0';
    o2 <= '0';
    o3 <= '1';
    o4 <= '0';
 ELSIF (a='1' AND b='0') THEN
    o1 <= '0';
    o2 <= '1';
    o3 <= '0';
    o4 <= '0';
 ELSIF (a='1' AND b='1') THEN
    o1 <= '1';
    o2 <= '0';
    o3 <= '0';
    o4 <= '0';
END IF;
END PROCESS;
END ARCHITECTURE;
-- I could do it with one 2bit input and one 4 bit output.
