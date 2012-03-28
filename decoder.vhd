library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           SEVENSEG: out  STD_LOGIC_VECTOR (6 downto 0));
end decoder;

architecture Behavioral of decoder is
begin

	SEVENSEG <= "1111110" when BCD = "0000" else		-- 0
						"0110000" when BCD = "0001" else -- 1
						"1101101" when BCD = "0010" else
						"1111001" when BCD = "0011" else
						"0110011" when BCD = "0100" else
						"1011011" when BCD = "0101" else
						"1011111" when BCD = "0110" else
						"1110010" when BCD = "0111" else
						"1111111" when BCD = "1000" else
						"1110011";

end Behavioral;

