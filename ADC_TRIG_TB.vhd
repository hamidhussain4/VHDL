------------------------------------------------------------
-- Company:			KU Leuven
-- Engineer:		
--
-- Project Name:	
-- Design Name:		
--
-- Create Date:		16/03/2018
-- Module Name:		ADC_TRIG_TB - Testbench
-- Revision:		
-- Description:		
--
-- Target Devices:	
--
-- Comments: 		
--
-- Notes: 
-- 		This testbench has been automatically generated using types STD_LOGIC and
-- 		STD_LOGIC_VECTOR for the ports of the unit under test.  Xilinx recommends
-- 		that these types always be used for the top-level I/O of a design in order
-- 		to guarantee that the testbench will bind correctly to the post-implementation 
-- 		simulation model.
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity ADC_TRIG_TB is
end ADC_TRIG_TB;

architecture behavior of ADC_TRIG_TB is

	-- Component declaration for the Unit Under Test (UUT)
	component ADC_TRIG
		port (	
				CLK : in STD_LOGIC;
				T_HIGH : in STD_LOGIC_VECTOR(31 downto 0);
				T_LOW : in STD_LOGIC_VECTOR(31 downto 0);
				ADC_TRIGS : out STD_LOGIC
			);
    end component;
    

	--Inputs
	signal CLK : STD_LOGIC := '0';
	signal T_HIGH : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
	signal T_LOW : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');

	--Outputs
	signal ADC_TRIGS : STD_LOGIC;

	-- Clock period definition
	constant CLK_PERIOD : time := 10 ns;
 
begin
 
	-- Instantiate the Unit Under Test (UUT)
	uut : ADC_TRIG
	port map (
				CLK => CLK,
				T_HIGH => T_HIGH,
				T_LOW => T_LOW,
				ADC_TRIGS => ADC_TRIGS
			);

	-- Clock process definitions
	CLK_process : process
	begin
		CLK <= '0';
		wait for CLK_PERIOD/2;
		CLK <= '1';
		wait for CLK_PERIOD/2;
	end process;
 

	-- Stimulus process
	stim_process: process
	begin		
		-- Activate reset here
		
		-- Define all inputs here
		
		wait for CLK_PERIOD*10;
		-- Release reset here
		
		-- Insert stimulus here
		
		wait;
	end process;

end;
