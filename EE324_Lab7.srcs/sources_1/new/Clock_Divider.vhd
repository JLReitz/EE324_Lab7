----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 03:57:15 PM
-- Design Name: 
-- Module Name: Clock_Divider - Behavioral
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

entity Clock_Divider is
    Port ( 
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Clk_Div : out STD_LOGIC
          );
end Clock_Divider;

architecture Behavioral of Clock_Divider is

signal clk_div_state: STD_LOGIC;
signal counter: integer range 0 to 1000000 := 0;

begin

process (Clk, Rst)
begin
    
    if(rst = '1') then counter <= 0;
    else
        if (counter = 49000) then counter <= 0;
        else counter <= counter + 1;
        end if;
    end if;
    
end process;

process (Clk, Rst)
begin

    if(rst = '1') then clk_div_state <= '0';
    else
        if (counter = 49000) then clk_div_state <= not clk_div_state;
        else clk_div_state <= clk_div_state;
        end if;
    end if;
    
    Clk_Div <= clk_div_state;

end process;

end Behavioral;
