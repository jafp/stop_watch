library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity line_decoder is
    Port ( SEL : in  STD_LOGIC_VECTOR(2 downto 0);
           STROBE_OUT : out  STD_LOGIC_VECTOR(5 downto 0));
end line_decoder;

architecture Behavioral of line_decoder is
begin

	STROBE_OUT <= "111110" when SEL = "000" else
						"111101" when SEL = "001" else
						"111011" when SEL = "010" else
						"110111" when SEL = "011" else
						"101111" when SEL = "100" else
						"011111";	

end Behavioral;

