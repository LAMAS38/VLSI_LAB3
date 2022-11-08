----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/03/2022 06:00:51 PM
-- Design Name: 
-- Module Name: RTL - Behavioral
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

entity RTL is
    Port ( p_DATA : in STD_LOGIC_VECTOR (23 downto 0);
           p_HSync : in STD_LOGIC;
           p_VSync : in STD_LOGIC;
           p_VDE : in STD_LOGIC;
           CLK_INT : in STD_LOGIC;
           OUT_CLK : out STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (2 downto 0);
           OUT_p_DATA : out STD_LOGIC_VECTOR (23 downto 0);
           OUT_p_HSync : out STD_LOGIC;
           OUT_p_VSync : out STD_LOGIC;
           OUT_p_VDE : out STD_LOGIC);
end RTL;

architecture Behavioral of RTL is

begin

--video signals
--OUT_p_DATA(23 downto 16) <= p_DATA(23 downto 16); --red channel
--OUT_p_DATA(15 downto 8) <= p_DATA(15 downto 8); --green channel
--OUT_p_DATA(7 downto 0) <= p_DATA(7 downto 0); --blue channel
--Synchronization signals simply overdrive
OUT_p_HSync <= p_HSync;
OUT_p_VSync <= p_VSync;
OUT_p_VDE <= p_VDE;

process(sw)
begin
    if (SW(0)='1') then
        OUT_p_DATA(23 downto 16) <= p_DATA(23 downto 16); --red channel
    elsif sw(1)='1' then
        OUT_p_DATA(15 downto 8) <= p_DATA(15 downto 8); --green channel
    elsif sw(2)='1' then 
        OUT_p_DATA(7 downto 0) <= p_DATA(7 downto 0); --blue channel
    end if;
end process;
end Behavioral;
