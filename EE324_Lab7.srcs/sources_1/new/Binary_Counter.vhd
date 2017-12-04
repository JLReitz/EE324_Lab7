----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 02:45:27 PM
-- Design Name: 
-- Module Name: Binary_Counter - Behavioral
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

entity Binary_Counter is
    Port ( 
           En : in STD_LOGIC;
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           Cnt : out STD_LOGIC_VECTOR (15 downto 0)
          );
end Binary_Counter;

architecture Behavioral of Binary_Counter is

signal counter : UNSIGNED (15 downto 0) := x"0000";

begin

process (clk, rst)
begin

    if (rst = '1') then counter <= x"0000";
    else
        if (En = '1') then counter <= counter + 1;
        end if;
    end if;
    
    Cnt <= STD_LOGIC_VECTOR(counter);

end process;

end Behavioral;
