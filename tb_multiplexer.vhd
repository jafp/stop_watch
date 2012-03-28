LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_multiplexer IS
END tb_multiplexer;
 
ARCHITECTURE behavior OF tb_multiplexer IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multiplexer
    PORT(
         SEL : IN  std_logic_vector(2 downto 0);
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         C : IN  std_logic_vector(3 downto 0);
         D : IN  std_logic_vector(3 downto 0);
         E : IN  std_logic_vector(3 downto 0);
         F : IN  std_logic_vector(3 downto 0);
         OUTPUT : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SEL : std_logic_vector(2 downto 0) := (others => '0');
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal C : std_logic_vector(3 downto 0) := (others => '0');
   signal D : std_logic_vector(3 downto 0) := (others => '0');
   signal E : std_logic_vector(3 downto 0) := (others => '0');
   signal F : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal OUTPUT : std_logic_vector(3 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multiplexer PORT MAP (
          SEL => SEL,
          A => A,
          B => B,
          C => C,
          D => D,
          E => E,
          F => F,
          OUTPUT => OUTPUT
        );

   -- Stimulus process
   stim_proc: process
   begin		

		A <= "0001";
		B <= "0010";
		C <= "0011";
		D <= "0100";
		E <= "0101";
		F <= "0110";
		
		SEL <= "000";
		wait for 1 ns;
		assert ( OUTPUT = A );
		
		SEL <= "001";
		wait for 1 ns;
		assert ( OUTPUT = B );
		
		SEL <= "010";
		wait for 1 ns;
		assert ( OUTPUT = C );
		
		SEL <= "011";
		wait for 1 ns;
		assert ( OUTPUT = D );
		
		SEL <= "100";
		wait for 1 ns;
		assert ( OUTPUT = E );
		
		SEL <= "101";
		wait for 1 ns;
		assert ( OUTPUT = F );
		
      wait;
   end process;

END;
