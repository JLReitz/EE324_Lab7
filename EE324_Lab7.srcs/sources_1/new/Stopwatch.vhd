----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 05:59:09 PM
-- Design Name: 
-- Module Name: Stopwatch - Behavioral
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

entity Stopwatch is
    Port ( 
           BTNs : in STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Seg : out STD_LOGIC_VECTOR (6 downto 0);
           An : out STD_LOGIC_VECTOR (3 downto 0)
          );
end Stopwatch;

architecture Behavioral of Stopwatch is

signal En, Clk_Div_w: STD_Logic;
signal Cnt: STD_Logic_Vector (15 downto 0);

component Stopwatch_Statemachine
port (
BTNs : in STD_LOGIC_VECTOR (2 downto 0);
Clk : in STD_LOGIC;
Rst : in STD_LOGIC;
En : out STD_LOGIC
); end component;

component Binary_Counter
port(
En : in STD_LOGIC;
Clk : in STD_LOGIC;
Rst : in STD_LOGIC;
Cnt : out STD_LOGIC_VECTOR (15 downto 0)
); end component;

component Display_Controller
port(
I : in STD_LOGIC_VECTOR (15 downto 0);
Clk : in STD_LOGIC;
Rst : in STD_LOGIC;
Seg : out STD_LOGIC_VECTOR (6 downto 0);
An : out STD_LOGIC_VECTOR (3 downto 0)
); end component;

component Clock_Divider
port(
Clk : in STD_LOGIC;
Rst : in STD_LOGIC;
Clk_Div : out STD_LOGIC
); end component;

begin

    statemachine: Stopwatch_Statemachine port map(  BTNs => BTNs,
                                                    Clk => Clk_Div_w,
                                                    Rst => Rst,
                                                    En => En
                                                  );
    counter: Binary_Counter port map(   En => En,
                                        Clk => Clk_Div_w,
                                        Rst => Rst,
                                        Cnt => Cnt
                                     );
    disp_control: Display_Controller port map(  I => Cnt,
                                                Clk => Clk_Div_w,
                                                Rst => Rst,
                                                Seg => Seg,
                                                An => An
                                              );
    clock_div: Clock_Divider port map(  Clk => Clk,
                                        Rst => Rst,
                                        Clk_Div => Clk_Div_w
                                      );

end Behavioral;
