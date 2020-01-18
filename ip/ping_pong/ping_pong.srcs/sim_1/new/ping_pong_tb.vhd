----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.01.2020 01:46:02
-- Design Name: 
-- Module Name: ping_pong_tb - Behavioral
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

entity ping_pong_tb is
--  Port ( );
end ping_pong_tb;

architecture Behavioral of ping_pong_tb is
    component ping_pong
    Port( clk : in STD_LOGIC;
           button1 : in STD_LOGIC;
           button2 : in STD_LOGIC;
           display : out UNSIGNED(7 downto 0);
           output_state : out STD_LOGIC_VECTOR(3 downto 0);
           Dout : out STD_LOGIC);
    end component;
    -- for port mapping
    signal clk : STD_LOGIC; 
    signal button1 : STD_LOGIC;
    signal button2 : STD_LOGIC;
    signal display : UNSIGNED(7 downto 0);
    signal output_state : STD_LOGIC_VECTOR(3 downto 0);
    signal Dout : STD_LOGIC;
    
    -- clocking 
    constant clock_period : time := 10ns;
    signal stop_clock : boolean;
    
begin

uut : ping_pong port map(
    clk => clk,
    button1 => button1,
    button2 => button2,
    display => display,
    output_state => output_state,
    Dout => Dout);
    
stimulus : process
    begin
       wait;
    end process;
 
clocking : process
    begin
        while not stop_clock loop
            clk <= '0', '1' after clock_period/2;
            wait for clock_period; 
        end loop;
        wait;
    end process; 

end Behavioral;
