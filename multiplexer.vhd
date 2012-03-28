library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer is
    Port ( SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           E : in  STD_LOGIC_VECTOR (3 downto 0);
           F : in  STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0));
end multiplexer;

architecture Behavioral of multiplexer is
begin
		
	OUTPUT <= A when SEL = "000" else
				 B when SEL = "001" else
				 C when SEL = "010" else
				 D when SEL = "011" else
				 E when SEL = "100" else
				 F;

end Behavioral;

