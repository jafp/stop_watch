LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_display IS
END tb_display;
 
ARCHITECTURE behavior OF tb_display IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display
    PORT(
         CLK : IN  std_logic;
         DISPLAY_STROBE : OUT  std_logic_vector(5 downto 0);
         DISPLAY_DATA : OUT  std_logic_vector(6 downto 0);
			DISPLAY_DOT : OUT std_logic;
         SEG_HUNDREDTHS : INout  std_logic_vector(3 downto 0);
         SEG_TENS : INout  std_logic_vector(3 downto 0);
         SEG_SEC_ONES : INout  std_logic_vector(3 downto 0);
         SEG_SEC_TENS : INout  std_logic_vector(3 downto 0);
         SEG_MIN_ONES : INout  std_logic_vector(3 downto 0);
         SEG_MIN_TENS : INout  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal SEG_HUNDREDTHS : std_logic_vector(3 downto 0) := (others => '0');
   signal SEG_TENS : std_logic_vector(3 downto 0) := (others => '0');
   signal SEG_SEC_ONES : std_logic_vector(3 downto 0) := (others => '0');
   signal SEG_SEC_TENS : std_logic_vector(3 downto 0) := (others => '0');
   signal SEG_MIN_ONES : std_logic_vector(3 downto 0) := (others => '0');
   signal SEG_MIN_TENS : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal DISPLAY_STROBE : std_logic_vector(5 downto 0);
   signal DISPLAY_DATA : std_logic_vector(6 downto 0);
	signal DISPLAY_DOT : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display PORT MAP (
          CLK => CLK,
          DISPLAY_STROBE => DISPLAY_STROBE,
          DISPLAY_DATA => DISPLAY_DATA,
			 DISPLAY_DOT => DISPLAY_DOT,
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
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		-- Test data
		SEG_HUNDREDTHS <= "0110";	-- 6
		SEG_TENS <= "0101"; 			-- 5
		SEG_SEC_ONES <= "0100";		-- 4
		SEG_SEC_TENS <= "0011";		-- 3
		SEG_MIN_ONES <= "0010";		-- 2
		SEG_MIN_TENS <= "0001";		-- 1
		
		-- Vent for at sikre at udgangene er stabile
		wait for 1 ns;
		
		-- Test visning af hundreddele (6)
		assert ( DISPLAY_STROBE = "111110" );
		assert ( DISPLAY_DATA = "1011111" );
		assert ( DISPLAY_DOT = '0' );
		
		wait for CLK_period;
		
		-- Test visning tiendedele (5)
		assert ( DISPLAY_STROBE = "111101" );
		assert ( DISPLAY_DATA = "1011011" );
		assert ( DISPLAY_DOT = '0' );
		
		wait for CLK_period;
		
		-- Test visning af enere af sekunder
		assert ( DISPLAY_STROBE = "111011" );
		assert ( DISPLAY_DATA = "0110011" );
		assert ( DISPLAY_DOT = '1' );
		
		wait for CLK_period;
		
		-- Test visning af tiere af sekunder
		assert ( DISPLAY_STROBE = "110111" );
		assert ( DISPLAY_DATA = "1111001" );
		assert ( DISPLAY_DOT = '0' );
		
		wait for CLK_period;
		
		-- Test visning af enere af minutter
		assert ( DISPLAY_STROBE = "101111" );
		assert ( DISPLAY_DATA = "1101101" );
		assert ( DISPLAY_DOT = '1' );
		
				
		wait for CLK_period;
		
		-- Test visning af tiere af minutter
		assert ( DISPLAY_STROBE = "011111" );
		assert ( DISPLAY_DATA = "0110000" );
		assert ( DISPLAY_DOT = '0' );				
		
      wait;
   end process;

END;
