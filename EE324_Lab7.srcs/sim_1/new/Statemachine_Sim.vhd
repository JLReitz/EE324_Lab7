----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/07/2017 03:12:32 PM
-- Design Name: 
-- Module Name: Statemachine_Sim - Behavioral
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

entity Statemachine_Sim is
--  Port ( );
end Statemachine_Sim;

architecture Behavioral of Statemachine_Sim is

signal Clk: STD_LOGIC := '1';
signal Rst: STD_LOGIC := '1';
signal En: STD_LOGIC;
signal BTNs: STD_LOGIC_VECTOR (2 downto 0) := "000";
signal Cnt: STD_LOGIC_VECTOR (15 downto 0);
signal Thou: STD_LOGIC_VECTOR (3 downto 0);
signal Hund: STD_LOGIC_VECTOR (3 downto 0);
signal Tens: STD_LOGIC_VECTOR (3 downto 0);
signal Ones: STD_LOGIC_VECTOR (3 downto 0);

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

component bin2bcd 
port(
I: in STD_LOGIC_VECTOR (15 downto 0);
Thou: out STD_LOGIC_VECTOR (3 downto 0);
Hund: out STD_LOGIC_VECTOR (3 downto 0);
Tens: out STD_LOGIC_VECTOR (3 downto 0);
Ones: out STD_LOGIC_VECTOR (3 downto 0)
); end component;

begin

Clk <= not Clk after 5 ns;
Rst <= '0' after 10 ns;

BTNs <= "100" after 50 ns,
        "001" after 100 ns,
        "010" after 200 ns,
        "000" after 210 ns;
        
UUT: Stopwatch_Statemachine port map(   BTNs => BTNs,
                                        Clk => Clk,
                                        Rst => Rst,
                                        En => En
                                     );
counter: Binary_Counter port map(    En => En,
                                     Clk => Clk,
                                     Rst => Rst,
                                     Cnt => Cnt
                                  );
u1: bin2bcd port map(     I => Cnt,
                      Thou => Thou,
                      Hund => Hund, 
                      Tens => Tens,
                      Ones => Ones
                   );

end Behavioral;
