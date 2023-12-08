library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vm_display_manager is
	port (
		auto_clk : in std_logic; -- 50MHz clock
		clk : in std_logic;
		reset : in std_logic;
		tx : out std_logic;
		price : in std_logic_vector(5 downto 0);
		coin_sum: in std_logic_vector(6 downto 0);
		seven_segment : out std_logic_vector (7 downto 0);
		digit_select : out std_logic_vector(3 downto 0);
		buy : in std_logic;
		food_out : in std_logic;
		not_en_mon : in std_logic;
		new_value : in std_logic
	);
end vm_display_manager;

architecture bhv of vm_display_manager is
	signal seven_segment_temp, seven_segment_text, seven_segment_10base : std_logic_vector (7 downto 0);
	signal digit_select_temp, digit_select_text, digit_select_10base : std_logic_vector(3 downto 0);

-----------------------------------------------------------------------------
-- Display na base 10
-- Apresenta o preco e a soma de moedas na forma decimal
-----------------------------------------------------------------------------

	COMPONENT display_10base
	PORT(
		auto_clk : IN std_logic;
		clk : IN std_logic;  
		reset : IN std_logic;
		seven_segment : OUT std_logic_vector(7 downto 0);
		digit_select : OUT std_logic_vector(3 downto 0);
		price : IN std_logic_vector(5 downto 0);
		coin_sum : IN std_logic_vector(6 downto 0);
		new_value : IN std_logic;
		tx : OUT std_logic
		);
	END COMPONENT;
	
-----------------------------------------------------------------------------
-- Display text
-- Used to scroll COLA or PEPSI when a can is bought
-- A cola or pepsi is decided by the flavor bit
-- Will show Err when alarm is high
-----------------------------------------------------------------------------
	
	COMPONENT display_text
	PORT(
		clk : IN std_logic;
		seven_segment : OUT std_logic_vector(7 downto 0);
		digit_select : OUT std_logic_vector(3 downto 0);
		reset : IN std_logic;
		food_out : IN std_logic;
		not_en_mon : IN std_logic;
		food : IN std_logic
		);
	END COMPONENT;
	
-----------------------------------------------------------------------------

begin
	seven_segment <= seven_segment_temp;
	digit_select <= digit_select_temp;

	-- The buy button selects which instance that should be controlling the seven segment display
	process(buy,seven_segment_text,digit_select_text,seven_segment_10base,digit_select_10base)
	begin
		if buy = '1' then
			seven_segment_temp <= seven_segment_text;
			digit_select_temp <= digit_select_text;
		else
			seven_segment_temp <= seven_segment_10base;
			digit_select_temp <= digit_select_10base;
		end if;
	end process;

	-- Display text instance
	Inst_display_text: display_text PORT MAP(
		clk => clk,
		reset => reset,
		seven_segment => seven_segment_text,
		digit_select => digit_select_text,
		food_out => food_out,
		not_en_mon => not_en_mon,
		food => price(0) -- Determine flavor based on if it's an equal or unequal number
	);
	
	-- Display 10 base instance
	Inst_display_10base: display_10base PORT MAP(
		auto_clk => auto_clk,
		clk => clk,
		reset => reset,		
		seven_segment => seven_segment_10base,
		digit_select => digit_select_10base,		
		price => price,
		coin_sum => coin_sum,
		new_value => new_value,
		tx => tx
	);
end bhv;