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
           dclk : in STD_LOGIC);
end clock_div;

architecture clock_divider of clock_div is
    -- for DLatchs:
    signal Q: UNSIGNED(7 downto 0);
    signal D: UNSIGNED(7 downto 0);
    signal clks: UNSIGNED(7 downto 0);
    
begin
    process(clk)
    begin
        if clk'EVENT and clk='1' then
            clks(0)<=clk;
            for I in 0 to 3 loop
--                dclk <= clk;
                if clks(I)='1' then
                    Q(I)<=D(I);
                    D(I)<=not Q(I);
                    clks(I+1)<=Q(I);               
                end if;
            end loop;     
        end if;
    end process;
end clock_divider;
