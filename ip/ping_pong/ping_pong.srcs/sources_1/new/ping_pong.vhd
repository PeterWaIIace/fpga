----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.01.2020 01:10:17
-- Design Name: 
-- Module Name: ping_pong - game
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

entity ping_pong is
    Port ( clk : in STD_LOGIC;
           button1 : in STD_LOGIC;
           button2 : in STD_LOGIC;
           display : out UNSIGNED(7 downto 0));
end ping_pong;

architecture game of ping_pong is
    component bi_buff
       Port ( clk : in STD_LOGIC;
           drctn : in STD_LOGIC;
           D : in STD_LOGIC;
           buff_state : out UNSIGNED(7 downto 0);
           Q : out STD_LOGIC);
    end component; 
    
    -- for port map
    signal buff_clk : STD_LOGIC;
    signal D : STD_LOGIC;
    signal drctn : STD_LOGIC;
    signal LED : UNSIGNED(7 downto 0);
    signal Q : STD_LOGIC; 
    
    -- for state machine 
    signal state : STD_LOGIC_VECTOR(3 downto 0);
    
begin
uut: bi_buff port map(clk => buff_clk,
                drctn => drctn,
                D => D,
                Q => Q,
                buff_state => LED);
                
    process(clk)
    begin
        if clk'EVENT and clk='1' then
            if state="0000" then 
            -- start new game
                D <= '1';
                buff_clk <= clk;
                state <= "0001";
            elsif state ="0001" then
            -- game is on 
                if button1='1' and LED="00000001" then
                    drctn <= '1';
                    buff_clk <= clk;
                elsif button1='1' and LED="00000001" then
                    drctn <= '0';
                    buff_clk <= clk;
                end if;
            end if;
        end if;
    end process;
end game;
