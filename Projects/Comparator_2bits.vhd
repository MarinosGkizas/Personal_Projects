LIBRARY IEEE;
USE IEEE.std_logic_1164.all;


ENTITY Comp IS
PORT( a,b: IN std_logic_vector (1 downto 0);
a_eq_b,a_bigger_b,a_smaller_b: OUT std_logic);
END ENTITY;

ARCHITECTURE Circuit OF Comp IS
BEGIN

PROCESS(a,b)
BEGIN
   IF (a(1) > b(1) OR (a(1) = b(1) AND a(0) > b(0))) THEN
    a_bigger_b <= '1' ;
    a_smaller_b <= '0';
    a_eq_b <= '0';
    ELSIF (b(1) > a(1) OR (a(1) = b(1) AND b(0) > a(0))) THEN
    a_smaller_b <= '1';
    a_bigger_b <= '0' ;
    a_eq_b <= '0';
    ELSIF (a(1) = b(1) AND a(0) = b(0)) THEN 
    a_eq_b <= '1';
    a_bigger_b <= '0' ;
    a_smaller_b <= '0';
    END IF;
    END PROCESS;
--a_eq_b <= '1' when a(1) = b(1) AND a(0) = b(0);    
--a_bigger_b <= '1' when a(1) > b(1) OR (a(1) = b(1) AND a(0) > b(0));
--a_smaller_b <= '1' when b(1) > a(1) OR (a(1) = b(1) AND b(0) > a(0));
END ARCHITECTURE;