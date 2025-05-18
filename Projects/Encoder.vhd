LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY Encoder IS
PORT( x: IN std_logic_vector (7 downto 0);
      y: OUT std_logic_vector (2 downto 0) -- y = log2(x)
);
END ENTITY;

ARCHITECTURE Circuit OF Encoder IS
BEGIN
y <= "000" WHEN x="0000" & x"5" ELSE
     "001" WHEN x= x"21" ELSE
     "010" WHEN x="01101100" ELSE
     "011" WHEN x= x"7" ELSE
     "100" WHEN x= x"12" ELSE
     "101" WHEN x= x"81" ELSE
     "110" WHEN x= x"AA" ELSE
     "111" WHEN x= x"FA" ELSE
    "ZZZ";
END ARCHITECTURE;
