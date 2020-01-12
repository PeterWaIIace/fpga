----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2019 13:27:43
-- Design Name: 
-- Module Name: bi_buff - Behavioral
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

entity bi_buff is
    Port ( clk : in STD_LOGIC;
           drctn : in STD_LOGIC;
           D : in STD_LOGIC;
           buff_state : out UNSIGNED(7 downto 0);
           Q : out STD_LOGIC);
end bi_buff;

architecture bi_buf_arch of bi_buff is
    signal buff: UNSIGNED(7 downto 0) := "00000000";
    
begin
    process(clk)
    begin
         if clk'EVENT and clk='1' then
         
            if drctn = '1' then
                Q <= buff(0); 
                buff <= shift_right(UNSIGNED(buff),1);
                buff(7) <= D;  
            else
                Q <= buff(7);
                buff <= shift_left(UNSIGNED(buff),1);
                buff(0) <= D;         
            end if;
            
            buff_state <= buff;    
         
         end if;
    end process;
end bi_buf_arch;
