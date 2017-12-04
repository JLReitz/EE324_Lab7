----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/01/2017 08:00:11 PM
-- Design Name: 
-- Module Name: Statemachine - Behavioral
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


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Stopwatch_Statemachine is
    Port ( 
           BTNs : in STD_LOGIC_VECTOR (2 downto 0);
           clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           En : out STD_LOGIC);
end Stopwatch_Statemachine;

architecture Behavioral of Stopwatch_Statemachine is

signal CURRENT_STATE, NEXT_STATE: std_logic_vector (1 downto 0);

begin

process(clk, rst)
begin

    if (rst = '1') then NEXT_STATE <= "00";
    else
        case CURRENT_STATE is
            when "00" =>
                case BTNs is
                    when "000" => NEXT_STATE <= "00";
                    when "100" => NEXT_STATE <= "01";
                    when "010" => NEXT_STATE <= "10";
                    when others => NEXT_STATE <= "00";
                end case;
            when "01" =>
                case BTNs is
                    when "000" => NEXT_STATE <= "01";
                    when "001" => NEXT_STATE <= "00";
                    when others => NEXT_STATE <= "01";
                end case;
            when "10" => NEXT_STATE <= "11";
            when "11" =>
                case BTNs is
                    when "010" => NEXT_STATE <= "11";
                    when others => NEXT_STATE <= "00";
                end case;
        end case;
    end if;
    
    CURRENT_STATE <= NEXT_STATE;
    
end process;

process(clk, rst)
begin

    if (rst = '1') then EN <= '0';
    else
        case CURRENT_STATE is
            when "01" | "10" => En <= '1';
            when others =>      En <= '0';
        end case;
    end if;
            
end process;

end Behavioral;
