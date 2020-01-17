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
           reset : in STD_LOGIC;
           dclk : out STD_LOGIC;
           clk_buff: out STD_LOGIC_VECTOR(7 downto 0));
end clock_div;

architecture clock_divider of clock_div is
    -- for DLatchs:
    signal clks: UNSIGNED(7 downto 0);
    
begin
    process(clk,reset)
    begin
        if reset='1' then
            clks <= "00000000";
        elsif clk'EVENT and clk='1' then
           clks(0) <= NOT clks(0);
           for I in 0 to 7 loop
                if RISING_EDGE(clks(I)) then
                    clks(I+1) <= Not clks(I+1);         
                end if;
           end loop;   
        end if;
        dclk <= clks(0);
        clk_buff<=STD_LOGIC_VECTOR(clks);
    end process;
end clock_divider;
