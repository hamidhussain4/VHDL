----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.03.2018 16:31:36
-- Design Name: 
-- Module Name: PWM_GENERATOR - Behavioral
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

entity PWM_GENERATOR is
    Port ( PRESC : in STD_LOGIC_VECTOR (31 downto 0);       -- max waarde van de counter
           PWM_VAL : in STD_LOGIC_VECTOR (31 downto 0);     -- waarde van de counter waar pwm signaal togglet, <= -> hoog, > -> laag
           PWM_SIG : out STD_LOGIC;                         -- uitgestuurd pwm signaal
           CLK : in STD_LOGIC;                              -- AXI klok 100MHz
           COUNT : out STD_LOGIC_VECTOR (31 downto 0));                             
end PWM_GENERATOR;

architecture Behavioral of PWM_GENERATOR is

signal dummy : std_logic_vector(3 downto 0);
signal pwm_val_int : integer range 0 to (2**31)-1 := 0;
signal pwm_presc : integer range 0 to (2**31)-1 := 0;

begin

pwm_val_int <= to_integer(unsigned(PWM_VAL));
pwm_presc <= to_integer(unsigned(PRESC));

process(CLK)
    
    variable count_v: integer range 0 to (2**31)-1 := 0;
    
    begin
        if(CLK'event and CLK ='1') then
             
             count_v := count_v + 1;
             
             if (count_v >= pwm_presc) then
                count_v := 0;
             end if;
             
             if (count_v <= pwm_val_int) then
                 PWM_SIG <= '1';
              else
                 PWM_SIG <= '0';
              end if;
              
        end if;
        
        COUNT <= std_logic_vector( to_unsigned( count_v , 32));
        
    end process;

end Behavioral;
