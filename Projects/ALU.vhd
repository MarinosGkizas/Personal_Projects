LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY ALU  IS
PORT(A,B: IN std_logic_vector (3 downto 0);
    sel: IN std_logic_vector (2 downto 0);
    outp: OUT std_logic_vector (3 downto 0));
END ENTITY;

ARCHITECTURE Circuit OF ALU IS
BEGIN
    PROCESS(a,b,sel)
    BEGIN
        CASE sel IS
            WHEN "000" => outp <= std_logic_vector(signed(a) + signed(b));
            WHEN "001" => outp <= std_logic_vector (signed(a) - signed(b));
            WHEN "010" => outp <= a AND b;
            WHEN "011" => outp <= a OR b;
            WHEN "100" => outp <= NOT a;
            WHEN "101" => outp <= NOT b;
            WHEN "110" => outp <= std_logic_vector(signed(a) + 1);
            WHEN "111" => outp <= std_logic_vector(signed(b) + 1);
            WHEN OTHERS => outp <= (OTHERS=> 'X');
        END CASE;
    END PROCESS;
END ARCHITECTURE;