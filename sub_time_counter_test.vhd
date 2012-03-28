--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:27:50 03/26/2012
-- Design Name:   
-- Module Name:   C:/Users/johannes/supacounter/countertest.vhd
-- Project Name:  time_counter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: counter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY sub_time_counter_test IS
END sub_time_counter_test;
 
ARCHITECTURE Behavioral OF sub_time_counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sub_time_counter
    PORT(
         EN : IN  std_logic;
         CLK : IN  std_logic;
         RESET : IN  std_logic;
         BIT_PATTERN : IN  std_logic_vector(3 downto 0);
         OUTPUT : OUT  std_logic_vector(0 to 3);
         EN_OUT : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal EN : std_logic := '0';
   signal CLK : std_logic := '0';
   signal RESET : std_logic := '0';
   signal BIT_PATTERN : std_logic_vector(3 downto 0) := (others => '0');
	
	--Outputs
   signal OUTPUT : std_logic_vector(0 to 3);
   signal EN_OUT : std_logic;
	
	--Test signals
	signal endTest: std_logic:='0';

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sub_time_counter PORT MAP (
          EN => EN,
          CLK => CLK,
          RESET => RESET,
          BIT_PATTERN => BIT_PATTERN,
          OUTPUT => OUTPUT,
          EN_OUT => EN_OUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
	while endTest ='0' loop
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
		end loop;
		wait;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin	
	--	test 
	--	tester enable high ved optælling til 9 selvreset og optælling til enable er low. derefter resettes; 
		EN<='1';
		RESET<='0';
		BIT_PATTERN<="1001";
		wait for CLK_period*10;
		EN <= '0';
		wait for CLK_period;
		RESET <= '1';
		wait for CLK_period;

		
	--	samme test prøves derefter igen, denne gang med optælling maks på 5, 
		EN<='1';
		RESET<='0';
		BIT_PATTERN<="0101";
		wait for CLK_period*6;
		EN <= '0';
		wait for CLK_period;
		RESET <= '1';
		wait for CLK_period;

		endTest<='1';

      wait;
   end process;

END;
