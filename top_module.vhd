library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( CLK 				: in  STD_LOGIC;
           ENABLE 			: in  STD_LOGIC;
           RESET 				: in  STD_LOGIC;
           DISPLAY_DATA 	: out  STD_LOGIC_VECTOR (6 downto 0);
           DISPLAY_STROBE 	: out  STD_LOGIC_VECTOR (5 downto 0);
           DISPLAY_DOT 		: out  STD_LOGIC);
end top_module;

architecture Behavioral of top_module is

	 component time_counter is
		Port( ENABLE: in std_logic;
				RESET : in std_logic;
				CLK: in std_logic;
				  
				SEG_HUNDREDTHS  : out std_logic_vector(3 downto 0);
				SEG_TENS                        : out std_logic_vector(3 downto 0);
				SEG_SEC_ONES    : out std_logic_vector(3 downto 0);
				SEG_SEC_TENS    : out std_logic_vector(3 downto 0);
				SEG_MIN_ONES    : out std_logic_vector(3 downto 0);
				SEG_MIN_TENS    : out std_logic_vector(3 downto 0)
			);
    end component;
	 
	 component display is
		 Port ( CLK : in  STD_LOGIC;
				  
				  DISPLAY_STROBE : out  STD_LOGIC_VECTOR (5 downto 0);
				  DISPLAY_DATA : out  STD_LOGIC_VECTOR (6 downto 0);
				  DISPLAY_DOT : out STD_LOGIC;
				  
				  SEG_HUNDREDTHS : in  STD_LOGIC_VECTOR (3 downto 0);
				  SEG_TENS : in  STD_LOGIC_VECTOR (3 downto 0);
				  SEG_SEC_ONES : in  STD_LOGIC_VECTOR (3 downto 0);
				  SEG_SEC_TENS : in  STD_LOGIC_VECTOR (3 downto 0);
				  SEG_MIN_ONES : in  STD_LOGIC_VECTOR (3 downto 0);
				  SEG_MIN_TENS : in  STD_LOGIC_VECTOR (3 downto 0));
	end component;
       
    signal HUNDREDTS, TENS, SEC_ONES, SEC_TENS, MIN_ONES, MIN_TENS : std_logic_vector(3 downto 0);
	 
begin

	u1: time_counter port map (ENABLE, RESET, CLK, HUNDREDTS, TENS, SEC_ONES, SEC_TENS, MIN_ONES, MIN_TENS);
	u2: display port map (CLK, DISPLAY_STROBE, DISPLAY_DATA, DISPLAY_DOT, HUNDREDTS, TENS, SEC_ONES, SEC_TENS, MIN_ONES, MIN_TENS);

end Behavioral;

