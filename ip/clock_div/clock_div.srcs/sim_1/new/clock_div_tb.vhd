----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.01.2020 08:23:37
-- Design Name: 
-- Module Name: clock_div_tb - clock_division_tb
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_div_tb is
--  Port ( );
end clock_div_tb;

architecture clock_division_tb of clock_div_tb is
    component clock_div
    Port( clk: in STD_LOGIC;
          reset : in STD_LOGIC;
          dclk : out STD_LOGIC;
          clk_buff: out STD_LOGIC_VECTOR(7 downto 0)
    );
    end component;
    
    -- for port mapping
    signal clk : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal dclk : STD_LOGIC;
    signal clk_buff : STD_LOGIC_VECTOR(7 downto 0);
        
    -- for clocking
    constant clock_period: time := 10 ns;
    signal stop_clock: boolean; 
    
begin
uut : clock_div port map(
    clk=> clk,
    reset =>reset,
    dclk => dclk,
    clk_buff => clk_buff
    );

stimulus: process     
  begin
    reset<='1';
    wait for 10 ns;
    reset<='0';
    wait for 1000 ns;
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
end clock_division_tb;
