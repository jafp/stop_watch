LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY time_counter_test IS
END time_counter_test;
 
ARCHITECTURE behavior OF time_counter_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT time_counter
    PORT(
         ENABLE : IN  std_logic;
         RESET : IN  std_logic;
         CLK : IN  std_logic;
         SEG_HUNDREDTHS : OUT  std_logic_vector(3 downto 0);
         SEG_TENS : OUT  std_logic_vector(3 downto 0);
         SEG_SEC_ONES : OUT  std_logic_vector(3 downto 0);
         SEG_SEC_TENS : OUT  std_logic_vector(3 downto 0);
         SEG_MIN_ONES : OUT  std_logic_vector(3 downto 0);
         SEG_MIN_TENS : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    
   --Inputs
   signal ENABLE : std_logic := '0';
   signal RESET : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal SEG_HUNDREDTHS : std_logic_vector(3 downto 0);
   signal SEG_TENS : std_logic_vector(3 downto 0);
   signal SEG_SEC_ONES : std_logic_vector(3 downto 0);
   signal SEG_SEC_TENS : std_logic_vector(3 downto 0);
   signal SEG_MIN_ONES : std_logic_vector(3 downto 0);
   signal SEG_MIN_TENS : std_logic_vector(3 downto 0);
	
	--test signals
	signal endTest : std_logic := '0';
	
   -- Clock period definitions
   constant CLK_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: time_counter PORT MAP (
          ENABLE => ENABLE,
          RESET => RESET,
          CLK => CLK,
          SEG_HUNDREDTHS => SEG_HUNDREDTHS,
          SEG_TENS => SEG_TENS,
          SEG_SEC_ONES => SEG_SEC_ONES,
          SEG_SEC_TENS => SEG_SEC_TENS,
          SEG_MIN_ONES => SEG_MIN_ONES,
          SEG_MIN_TENS => SEG_MIN_TENS
        );

   -- Clock process definitions
   CLK_process :process
   begin
		while endTest = '0' loop
			CLK <= '0';
			wait for CLK_period/2;
			CLK <= '1';
			wait for CLK_period/2;
		end loop;
   end process;
 
   -- Stimulus process
   stim_proc: process
	begin
	
	--	test
	--	tæller op til 10 minutter, sætter enable low i 11 cycles svarende til at 
	--	hundrededelssekund burde have talt en op og resetter derefter
		ENABLE <= '1';
		RESET <= '0';
		wait for CLK_period*600001;
		ENABLE <= '0';
		wait for CLK_period*11;
		RESET <= '1';
		wait for CLK_period;
		endTest <= '1';

		wait;
   end process;
END;