----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2020 23:16:20
-- Design Name: 
-- Module Name: N_clock_div_tb - N_clock_div_tb
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

entity N_clock_div_tb is
--  Port ( );
end N_clock_div_tb;

architecture N_clock_div_tb of N_clock_div_tb is
    component N_clock_div
    Port( clk: in STD_LOGIC;
          init : in STD_LOGIC;
          dclk : out STD_LOGIC_VECTOR(0 to 8)
    );
    end component;
    
    -- for port mapping
    signal clk : STD_LOGIC;
    signal init : STD_LOGIC;
    signal dclk : STD_LOGIC_VECTOR(0 to 8);
        
    -- for clocking
    constant clock_period: time := 10 ns;
    signal stop_clock: boolean;

begin

    uut : N_clock_div port map(
       clk => clk,
       init => init,
       dclk => dclk 
        );

stimulus : process
  begin
    init <= '1';
    wait for clock_period;
    init <= '0';
    wait;
  end process;
    
clocking: process
  begin
    while not stop_clock loop
        clk <= '0','1' after clock_period/2;
        wait for clock_period;
    end loop;
  wait;
  end process;
  
end N_clock_div_tb;
