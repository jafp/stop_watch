LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_decoder IS
END tb_decoder;
 
ARCHITECTURE behavior OF tb_decoder IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder
    PORT(
         BCD : IN  std_logic_vector(3 downto 0);
         SEVENSEG : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal BCD : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal SEVENSEG : std_logic_vector(6 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
          BCD => BCD,
          SEVENSEG => SEVENSEG
        );

   -- Stimulus process
   stim_proc: process
   begin		
 
		BCD <= "0000";
		wait for 1 ns;
		assert ( SEVENSEG = "1111110" );
 
		BCD <= "0001";
		wait for 1 ns;
		assert ( SEVENSEG = "0110000" );
		
		BCD <= "0010";
		wait for 1 ns;
		assert ( SEVENSEG = "1101101" );
		
		BCD <= "0011";
		wait for 1 ns;
		assert ( SEVENSEG = "1111001" );
		
		BCD <= "0100";
		wait for 1 ns;
		assert ( SEVENSEG = "0110011" );
		
		BCD <= "0101";
		wait for 1 ns;
		assert ( SEVENSEG = "1011011" );
		
		BCD <= "0110";
		wait for 1 ns;
		assert ( SEVENSEG = "1011111" );
		
		BCD <= "0111";
		wait for 1 ns;
		assert ( SEVENSEG = "1110010" );
		
		BCD <= "1000";
		wait for 1 ns;
		assert ( SEVENSEG = "1111111" );
		
		BCD <= "1001";
		wait for 1 ns;
		assert ( SEVENSEG = "1110011" );
		
      wait;
   end process;

END;
