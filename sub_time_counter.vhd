library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity sub_time_counter is
   port( EN: in std_logic;
         CLK: in std_logic;
         RESET: in std_logic;
			BIT_PATTERN : in std_logic_vector(3 downto 0);
			
         OUTPUT: out std_logic_vector(0 to 3);
			EN_OUT : out std_logic
			);
end sub_time_counter;
 
architecture Behavioral of sub_time_counter is
   signal temp: std_logic_vector(0 to 3) := "0000";
begin   
process(CLK,RESET)

   begin
      if RESET='1' then
         temp <= "0000";
      elsif rising_edge(CLK)then
         if EN='1' then
            if temp=BIT_PATTERN then
               temp<="0000";
            else
               temp <= temp + 1;
            end if;
         end if;
      end if;
   end process;
	EN_OUT <= '1' when temp=BIT_PATTERN and EN = '1' else '0';
   OUTPUT <= temp;
	
end Behavioral;

