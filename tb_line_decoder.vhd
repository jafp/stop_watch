LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_line_decoder IS
END tb_line_decoder;
 
ARCHITECTURE behavior OF tb_line_decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT line_decoder
    PORT(
         SEL : IN  std_logic_vector(2 downto 0);
         STROBE_OUT : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SEL : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal STROBE_OUT : std_logic_vector(5 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: line_decoder PORT MAP (
          SEL => SEL,
          STROBE_OUT => STROBE_OUT
        );

   -- Stimulus process
   stim_proc: process
   begin		
	
		SEL <= "000";
		wait for 1 ns;
		assert ( STROBE_OUT = "111110" );
		
		SEL <= "001";
		wait for 1 ns;
		assert ( STROBE_OUT = "111101" );
		
		SEL <= "010";
		wait for 1 ns;
		assert ( STROBE_OUT = "111011" );
		
		SEL <= "011";
		wait for 1 ns;
		assert ( STROBE_OUT = "110111" );
		
		SEL <= "100";
		wait for 1 ns;
		assert ( STROBE_OUT = "101111" );
		
		SEL <= "101";
		wait for 1 ns;
		assert ( STROBE_OUT = "011111" );

      wait;
   end process;

END;
