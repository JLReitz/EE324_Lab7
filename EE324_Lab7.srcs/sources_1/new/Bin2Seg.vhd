----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 03:36:13 PM
-- Design Name: 
-- Module Name: Bin2Seg - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bin2Seg is
    Port ( 
            I : in STD_LOGIC_VECTOR (3 downto 0);
            Seg : out STD_LOGIC_VECTOR (6 downto 0)
          );
end Bin2Seg;

architecture Behavioral of Bin2Seg is

begin

process (I)
begin

    case I is
        when x"0" => Seg <= "1000000";
        when x"1" => Seg <= "1111001";
        when x"2" => Seg <= "0100100";
        when x"3" => Seg <= "0110000";
        when x"4" => Seg <= "0011001";
        when x"5" => Seg <= "0010010";
        when x"6" => Seg <= "0000010";
        when x"7" => Seg <= "1111000";
        when x"8" => Seg <= "0000000";
        when x"9" => Seg <= "0010000";
        when others => Seg <= "0000000";
    end case;

end process;

end Behavioral;
