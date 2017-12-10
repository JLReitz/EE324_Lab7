----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 04:32:43 PM
-- Design Name: 
-- Module Name: Select_Controller - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Select_Controller is
    Port ( 
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Sel : out STD_LOGIC_VECTOR (1 downto 0)
          );
end Select_Controller;

architecture Behavioral of Select_Controller is

signal counter: UNSIGNED (1 downto 0) := "00";

begin

process(Clk, Rst)
begin

    if (Rst = '1') then counter <= "00";
    elsif (rising_edge(Clk)) then counter <= counter + 1;
    end if;
    
    Sel <= STD_LOGIC_VECTOR(counter);

end process;

end Behavioral;
