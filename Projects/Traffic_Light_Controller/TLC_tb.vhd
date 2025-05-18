----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2025 11:07:00
-- Design Name: 
-- Module Name: TLC_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TLC_tb is
--  Port ( );
end TLC_tb;

architecture Behavioral of TLC_tb is

component TLC is
Port ( clk,rst: IN std_logic;
       NS_RED,NS_YELLOW,NS_GREEN: OUT std_logic;
       WE_RED,WE_YELLOW,WE_GREEN: OUT std_logic;
       counter_o: OUT INTEGER );
end component;

SIGNAL clk,rst: std_logic:= '0';
SIGNAL NS_RED,NS_YELLOW,NS_GREEN,WE_RED,WE_YELLOW,WE_GREEN: std_logic;
SIGNAL counter_o: INTEGER;

begin
DUT: TLC PORT MAP(clk => clk, rst => rst,NS_RED => NS_RED, NS_YELLOW => NS_YELLOW, NS_GREEN => NS_GREEN, WE_RED => WE_RED, WE_YELLOW => WE_YELLOW, WE_GREEN => WE_GREEN, counter_o => counter_o);

clk <= NOT clk after 100ns;
rst <= '1' , '0' after 100ns;


end Behavioral;
