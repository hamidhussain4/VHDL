----------------------------------------------------------------------------------
-- Company: KU Leuven
-- Engineer: Dries Claes
-- 
-- Create Date: 03/16/2018 04:25:52 PM
-- Design Name: 
-- Module Name: ADC_TRIG - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADC_TRIG is
    Port ( T_LOW : in STD_LOGIC_VECTOR (31 downto 0);
           CLK: in STD_LOGIC;
           T_HIGH : in STD_LOGIC_VECTOR (31 downto 0);
           --COUNTR : out STD_LOGIC_VECTOR (31 downto 0);
           ADC_TRIGS : out STD_LOGIC);
end ADC_TRIG;

architecture Behavioral of ADC_TRIG is

begin
-- read the input and change to int in a clocked process
process(CLK)
--create the variables --32 BIT
variable count_low : integer range 0 to (2**31) -1 :=  0 ; 
variable count_high : integer range 0 to (2**31) -1 :=  0 ; 
variable count : integer range 0 to (2**31) -1 :=  0 ; 
begin
--rising edge of the clock 
if (CLK'event and CLK = '1') then
--convert register to integer
count_low:=to_integer(unsigned(T_LOW));
count_high:=to_integer(unsigned(T_HIGH));
--increment
count := count +1;
--if test to check reset
    if (count >(count_low+count_high)) then 
        count := 1;
    end if;
-- if test to check 1 or 0 output
    if(count >count_low) then 
        ADC_TRIGS<='1';
     else
        ADC_TRIGS<='0';
    end if;
-- comment out test signals from here 
-- assign counter value to the test
--COUNTR<= std_logic_vector( to_unsigned (count,32) );
end if;

end process;


end Behavioral;
