library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    Port ( CLK : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
end counter;

architecture Behavioral of counter is
	signal Temp : std_logic_vector(2 downto 0) := "000";
begin

	process (CLK) is
	begin
		if rising_edge(CLK) then
			if (Temp = "101") then
				Temp <= "000";
			else
				Temp <= Temp + 1;
			end if;
		end if;
	end process;

	Q <= Temp;
	
end Behavioral;

