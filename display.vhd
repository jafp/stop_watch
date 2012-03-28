library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity display is
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
end display;

architecture Behavioral of display is
	
	component decoder is
    Port ( BCD : in  STD_LOGIC_VECTOR (3 downto 0);
           SEVENSEG: out  STD_LOGIC_VECTOR (6 downto 0));
	end component;

	component counter is
	 Port ( CLK : in  STD_LOGIC;
			  Q : out  STD_LOGIC_VECTOR (2 downto 0));
	end component;
	
	component line_decoder is
		 Port ( SEL : in  STD_LOGIC_VECTOR(2 downto 0);
				  STROBE_OUT : out  STD_LOGIC_VECTOR(5 downto 0));
	end component;
	
	component multiplexer is
    Port ( SEL : in  STD_LOGIC_VECTOR (2 downto 0);
           A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C : in  STD_LOGIC_VECTOR (3 downto 0);
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           E : in  STD_LOGIC_VECTOR (3 downto 0);
           F : in  STD_LOGIC_VECTOR (3 downto 0);
           OUTPUT : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;

	signal Cnt : std_logic_vector(2 downto 0);
	signal Output : std_Logic_vector(3 downto 0);
		
begin

	u1 : counter port map ( CLK, Cnt );
	u2 : decoder port map ( Output, DISPLAY_DATA );
	u3 : line_decoder port map ( Cnt, DISPLAY_STROBE );
	u4 : multiplexer port map ( Cnt, SEG_HUNDREDTHS, SEG_TENS, SEG_SEC_ONES, SEG_SEC_TENS, 
															SEG_MIN_ONES, SEG_MIN_TENS, Output );
				 
	-- Prikken skal kun vises ved hvert anden ciffer			
	DISPLAY_DOT <= '1' when Cnt = "010" or Cnt = "100" else
						'0';
	
end Behavioral;

