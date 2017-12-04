----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 03:09:50 PM
-- Design Name: 
-- Module Name: Bin2BCD - Behavioral
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

entity BCD is
    Port (  
            I: in STD_LOGIC_VECTOR (15 downto 0);
            Thou: out STD_LOGIC_VECTOR (3 downto 0);
            Hund: out STD_LOGIC_VECTOR (3 downto 0);
            Tens: out STD_LOGIC_VECTOR (3 downto 0);
            Ones: out STD_LOGIC_VECTOR (3 downto 0)
          );
end BCD;

architecture Behavioral of BCD is

signal shift : UNSIGNED (31 downto 0);

begin

process (I)
begin
    
    shift(31 downto 16) <= x"0000";
    shift(15 downto 0) <= unsigned(I);
    
    for i in 0 to 15 loop
        if (shift(19 downto 16) >= 5) then shift(19 downto 16) <= shift(19 downto 16) + 3;
        end if;
        if (shift(23 downto 20) >= 05) then shift(19 downto 16) <= shift(19 downto 16) + 3;
        end if;
        if (shift(27 downto 24) >= 0) then shift(19 downto 16) <= shift(19 downto 16) + 3;
        end if;
        if (shift(31 downto 28) >= 0) then shift(19 downto 16) <= shift(19 downto 16) + 3;
        end if;
        
        shift <= shift(30 downto 0) & '0';
    end loop;
    
    thou <= STD_LOGIC_VECTOR(shift(31 downto 28));
    hund <= STD_LOGIC_VECTOR(shift(27 downto 24));
    tens <= STD_LOGIC_VECTOR(shift(23 downto 20));
    ones <= STD_LOGIC_VECTOR(shift(19 downto 16));
    
end process;

end Behavioral;