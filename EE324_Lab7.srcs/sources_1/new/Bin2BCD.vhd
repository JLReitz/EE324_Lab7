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
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;

entity bin2bcd is
    port ( 
        I:      in   std_logic_vector (15 downto 0);
        Ones:       out  std_logic_vector (3 downto 0);
        Tens:       out  std_logic_vector (3 downto 0);
        Hund:   out  std_logic_vector (3 downto 0);
        Thou:  out  std_logic_vector (3 downto 0)
    );
end entity;

architecture fum of bin2bcd is
    alias Hex_Display_Data: std_logic_vector (15 downto 0) is I;
    alias rpm_1:    std_logic_vector (3 downto 0) is Ones;
    alias rpm_10:   std_logic_vector (3 downto 0) is Tens;
    alias rpm_100:  std_logic_vector (3 downto 0) is Hund;
    alias rpm_1000: std_logic_vector (3 downto 0) is Thou;
begin
    process (Hex_Display_Data)
        type fourbits is array (3 downto 0) of std_logic_vector(3 downto 0);
        -- variable i : integer := 0;  -- NOT USED
        -- variable bcd : std_logic_vector(15 downto 0) := (others => '0');
        variable bcd:   std_logic_vector (15 downto 0);
        -- variable bint : std_logic_vector(15 downto 0) := Hex_Display_Data;
        variable bint:  std_logic_vector (13 downto 0); -- SEE process body
    begin
        bcd := (others => '0');      -- ADDED for EVERY CONVERSION
        bint := Hex_Display_Data (13 downto 0); -- ADDED for EVERY CONVERSION

        for i in 0 to 13 loop
            bcd(15 downto 1) := bcd(14 downto 0);
            bcd(0) := bint(13);
            bint(13 downto 1) := bint(12 downto 0);
            bint(0) := '0';

            if i < 13 and bcd(3 downto 0) > "0100" then
                bcd(3 downto 0) := 
                    std_logic_vector (unsigned(bcd(3 downto 0)) + 3);
            end if;
            if i < 13 and bcd(7 downto 4) > "0100" then
                bcd(7 downto 4) := 
                    std_logic_vector(unsigned(bcd(7 downto 4)) + 3);
            end if;
            if i < 13 and bcd(11 downto 8) > "0100" then
                bcd(11 downto 8) := 
                    std_logic_vector(unsigned(bcd(11 downto 8)) + 3);
            end if;
            if i < 13 and bcd(15 downto 12) > "0100" then
                bcd(11 downto 8) := 
                    std_logic_vector(unsigned(bcd(15 downto 12)) + 3);
            end if;
        end loop;

        (rpm_1000, rpm_100, rpm_10, rpm_1)  <= 
                  fourbits'( bcd (15 downto 12), bcd (11 downto 8), 
                               bcd ( 7 downto  4), bcd ( 3 downto 0) );
    end process ;
end architecture;