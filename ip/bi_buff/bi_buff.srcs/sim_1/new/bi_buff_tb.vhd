----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.12.2019 21:45:17
-- Design Name: 
-- Module Name: bi_buff_tb - Behavioral
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
use IEEE.Numeric_Std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bi_buff_tb is
--  Port ( );
end bi_buff_tb;

architecture Behavioral of bi_buff_tb is
    component bi_buff
    Port ( clk : in STD_LOGIC;
           drctn : in STD_LOGIC;
           D : in STD_LOGIC;
           buff_state : out UNSIGNED(7 downto 0);
           Q : out STD_LOGIC);
    end component; 
    
    -- for port map
    signal clk : STD_LOGIC;
    signal D : STD_LOGIC;
    signal drctn : STD_LOGIC;
    signal LED : UNSIGNED(7 downto 0);
    signal Q : STD_LOGIC;
    
    -- for clocking
    constant clock_period: time := 10 ns;
    signal stop_clock: boolean; 
    

begin
    
uut: bi_buff port map(clk => clk,
                drctn => drctn,
                D => D,
                Q => Q,
                buff_state => LED);
stimulus: process     
    begin
        --start clock
        stop_clock<=False; 
        drctn <= '0';
        D <= '1';
        --wait 100ns
        wait for 10 ns;
        D <= '0';
        wait for 1000 ns;
        -- stop clock
        stop_clock <= True;
        wait;
    end process;
    
  -- clocking process
  clocking: process
  begin
    while not stop_clock loop
    clk <= '0','1' after clock_period/2;
    wait for clock_period;
    end loop;
  wait;
  end process;
end Behavioral;
