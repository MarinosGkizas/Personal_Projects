library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PISO is
Port (d: IN std_logic_vector (7 downto 0);
      clk,load: IN std_logic;
      dout: OUT std_logic );
end PISO;

architecture Behavioral of PISO is
SIGNAL reg: std_logic_vector ( 7 DOWNTO 0);
begin
    PROCESS(clk)
    BEGIN
    IF (rising_edge(clk)) THEN
        IF (load = '1') THEN reg <= d;
        ELSE reg <= reg (6 downto 0) & '0';
        END IF;
    END IF;
    END PROCESS;
      dout <= reg (7);

end Behavioral;
