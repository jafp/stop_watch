LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_counter IS
END tb_counter;
 
ARCHITECTURE behavior OF tb_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         CLK : IN  std_logic;
         Q : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal Q : std_logic_vector(2 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          CLK => CLK,
          Q => Q
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
		wait for CLK_period * 6;
		assert ( Q = "000" );
		
		wait for CLK_period;
		assert ( Q = "001" );
		
		wait for CLK_period;
		assert ( Q = "010" );
		
		wait for CLK_period;
		assert ( Q = "011" );
		
		wait for CLK_period;
		assert ( Q = "100" );
		
		wait for CLK_period;
		assert ( Q = "101" );
		
      wait;
   end process;

END;
