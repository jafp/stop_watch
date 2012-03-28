library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity time_counter is
	port( ENABLE: in std_logic;
			RESET : in std_logic;
			CLK: in std_logic;
			
			SEG_HUNDREDTHS	: out std_logic_vector(3 downto 0);
			SEG_TENS			: out std_logic_vector(3 downto 0);
			SEG_SEC_ONES	: out std_logic_vector(3 downto 0);
			SEG_SEC_TENS	: out std_logic_vector(3 downto 0);
			SEG_MIN_ONES	: out std_logic_vector(3 downto 0);
			SEG_MIN_TENS 	: out std_logic_vector(3 downto 0)
			);
end time_counter;

architecture Structural of time_counter is
	component sub_time_counter is
		port( EN: in std_logic;
				CLK: in std_logic;
				RESET: in std_logic;
				BIT_PATTERN : in std_logic_vector(3 downto 0);

				OUTPUT: out std_logic_vector(0 to 3);
				EN_OUT : out std_logic
				);
	end component;
	signal EN : std_logic_vector(5 downto 0);
	signal dontcarevector : std_logic_vector(3 downto 0);
begin		

	counter1 : sub_time_counter port map(ENABLE, CLK, RESET, "1001", open, EN(0));
	counter2 : sub_time_counter port map(EN(0), CLK, RESET, "1001", SEG_HUNDREDTHS, EN(1));
	counter3 : sub_time_counter port map(EN(1), CLK, RESET, "1001", SEG_TENS, EN(2));
	counter4 : sub_time_counter port map(EN(2), CLK, RESET, "1001", SEG_SEC_ONES, EN(3));
	counter5 : sub_time_counter port map(EN(3), CLK, RESET, "0101", SEG_SEC_TENS, EN(4));
	counter6 : sub_time_counter port map(EN(4), CLK, RESET, "1001", SEG_MIN_ONES, EN(5));
	counter7 : sub_time_counter port map(EN(5), CLK, RESET, "1001", SEG_MIN_TENS, open);

end Structural;