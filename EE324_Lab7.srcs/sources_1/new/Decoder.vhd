----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 03:53:24 PM
-- Design Name: 
-- Module Name: Decoder - Behavioral
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

entity Decoder is
    Port ( 
           Sel : in STD_LOGIC_VECTOR (1 downto 0);
           An : out STD_LOGIC_VECTOR (3 downto 0)
          );
end Decoder;

architecture Behavioral of Decoder is

begin

process (Sel)
begin
    
    case Sel is
        when "00" => An <= "0111";
        when "01" => An <= "1011";
        when "10" => An <= "1101";
        when "11" => An <= "1110";
        when others => An <= "1111";
    end case;
    
end process;

end Behavioral;
