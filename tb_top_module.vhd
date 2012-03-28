LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_top_module IS
END tb_top_module;
 
ARCHITECTURE behavior OF tb_top_module IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_module
    PORT(
         CLK : IN  std_logic;
         ENABLE : IN  std_logic;
         RESET : IN  std_logic;
         DISPLAY_DATA : OUT  std_logic_vector(6 downto 0);
         DISPLAY_STROBE : OUT  std_logic_vector(5 downto 0);
         DISPLAY_DOT : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal ENABLE : std_logic := '0';
   signal RESET : std_logic := '0';

 	--Outputs
   signal DISPLAY_DATA : std_logic_vector(6 downto 0);
   signal DISPLAY_STROBE : std_logic_vector(5 downto 0);
   signal DISPLAY_DOT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_module PORT MAP (
          CLK => CLK,
          ENABLE => ENABLE,
          RESET => RESET,
          DISPLAY_DATA => DISPLAY_DATA,
          DISPLAY_STROBE => DISPLAY_STROBE,
          DISPLAY_DOT => DISPLAY_DOT
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

		ENABLE <= '0';
		RESET <= '1';
      wait for 100 ns;
		
		RESET <= '0';
		wait for 10 ns;
		
		ENABLE <= '1';

      wait;
   end process;

END;
