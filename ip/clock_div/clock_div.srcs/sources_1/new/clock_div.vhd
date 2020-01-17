----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2020 22:50:35
-- Design Name: 
-- Module Name: clock_div - clock_divider
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div is
    Port ( clk : in STD_LOGIC;
           init : in STD_LOGIC;
           dclk : out STD_LOGIC);
end clock_div;

architecture clock_divider of clock_div is
    signal D : STD_LOGIC;
begin
    process(clk,init)
    begin
        if init='1' then
           D <= '0';
        elsif RISING_EDGE(clk) then
           D <= NOT D;
           dclk <= D;
        end if;
    end process;
end clock_divider;
