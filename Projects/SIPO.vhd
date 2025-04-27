library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SIPO is
Port (din,rst,clk: IN BIT;
      dout: OUT BIT_VECTOR(6 DOWNTO 0);
      err,data_valid: OUT BIT );
end SIPO;

architecture Behavioral of SIPO is
begin
PROCESS(clk,rst)
    VARIABLE count: INTEGER RANGE 0 TO 10;
    VARIABLE reg: BIT_VECTOR (10 DOWNTO 0);
    VARIABLE temp: BIT;
BEGIN
    IF (rst ='1') THEN
        err <= '0';
        data_valid <= '0';
        reg:= (reg'RANGE => '0');
        temp := '0';
        count := 0;
     ELSIF (clk'EVENT AND clk = '1') THEN
        IF (reg(0) = '0' AND din = '1') THEN
            reg(0) := '1';
        ELSIF (reg(0) = '1') THEN
            count := count +1;
            IF (count < 10) THEN
                reg(count) := din;
            ELSIF (count =10) THEN
                temp := (reg(1) XOR reg(2) XOR reg(3) XOR reg(4) XOR reg(5) XOR reg(6)XOR reg(7) XOR reg(8)) OR NOT reg(9);
                err <= temp;
                count := 0;
                reg(0) := din;
                IF (temp = '0') THEN
                    data_valid <= '1';
                    dout <= reg (7 DOWNTO 1);
                END IF;
            END IF;
        END IF;
     END IF;
END PROCESS;


end Behavioral;
