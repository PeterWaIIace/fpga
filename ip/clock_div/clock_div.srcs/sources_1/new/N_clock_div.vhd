----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.01.2020 01:55:49
-- Design Name: 
-- Module Name: N_clock_div - N_clock_div
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

entity N_clock_div is
    Port ( clk : in STD_LOGIC;
           init : in STD_LOGIC;
           dclk : out STD_LOGIC_VECTOR (8 downto 0));
end N_clock_div;

architecture N_clock_div of N_clock_div is
    component clock_div
    Port( clk: in STD_LOGIC;
          init : in STD_LOGIC;
          dclk : out STD_LOGIC
    );
    end component;
    -- port mapping 
    signal D : STD_LOGIC_VECTOR(0 to 8);
    signal Q : STD_LOGIC_VECTOR(0 to 8);
    
begin
    gen_clock_div: 
    for I in 0 to 8 generate
        bank_clock_div : clock_div port map(
        D(I),init,Q(I));
    end generate;
    
    process(clk)
    begin
        if clk'EVENT then
            D(0) <= clk;
            for I in 0 to 7 loop
                dclk(I)<=Q(I);
                D(I+1)<=Q(I);
            end loop;
            dclk(8)<=Q(8);
        end if;
    end process;
end N_clock_div;
