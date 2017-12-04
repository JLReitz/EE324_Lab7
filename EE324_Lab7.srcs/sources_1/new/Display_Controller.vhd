----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2017 04:18:07 PM
-- Design Name: 
-- Module Name: Display_Controller - Behavioral
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

entity Display_Controller is
    Port ( 
           I : in STD_LOGIC_VECTOR (15 downto 0);
           Clk : in STD_LOGIC;
           Rst : in STD_LOGIC;
           Seg : out STD_LOGIC_VECTOR (6 downto 0);
           An : out STD_LOGIC_VECTOR (3 downto 0)
          );
end Display_Controller;

architecture Behavioral of Display_Controller is

signal Sel: STD_LOGIC_VECTOR (1 downto 0) := "00";
signal Segment_Wire, D0, D1, D2, D3: STD_LOGIC_VECTOR (3 downto 0);

component BCD 
port(
I: in STD_LOGIC_VECTOR (15 downto 0);
Thou: out STD_LOGIC_VECTOR (3 downto 0);
Hund: out STD_LOGIC_VECTOR (3 downto 0);
Tens: out STD_LOGIC_VECTOR (3 downto 0);
Ones: out STD_LOGIC_VECTOR (3 downto 0)
); end component;

component Mux_4 
port(
I0 : in STD_LOGIC_VECTOR (3 downto 0);
I1 : in STD_LOGIC_VECTOR (3 downto 0);
I2 : in STD_LOGIC_VECTOR (3 downto 0);
I3 : in STD_LOGIC_VECTOR (3 downto 0);
Sel : in STD_LOGIC_VECTOR (1 downto 0);
Y : out STD_LOGIC_VECTOR (3 downto 0)
); end component;

component Bin2Seg 
port(
I : in STD_LOGIC_VECTOR (3 downto 0);
Seg : out STD_LOGIC_VECTOR (6 downto 0)
); end component;

component Decoder 
port(
Sel : in STD_LOGIC_VECTOR (1 downto 0);
An : out STD_LOGIC_VECTOR (3 downto 0)
); end component;

component Select_Controller
port(
Clk : in STD_LOGIC;
Rst : in STD_LOGIC;
Sel : out STD_LOGIC_VECTOR (1 downto 0)
); end component;

begin

    u1: BCD port map(   I => I,
                        Thou => D0,
                        Hund => D1, 
                        Tens => D2,
                        Ones => D3
                     );
    u2: Mux_4 port map( I0 => D0,
                        I1 => D1,
                        I2 => D2,
                        I3 => D3,
                        Sel => Sel,
                        Y => Segment_Wire
                       );
    u3: Bin2Seg port map(   I => Segment_Wire,
                            Seg => Seg
                         );
    u4: Decoder port map(   Sel => Sel,
                            An => An
                         );
    u5: Select_Controller port map( Clk => Clk,
                                    Rst => Rst,
                                    Sel => Sel
                                   );
                        

end Behavioral;
