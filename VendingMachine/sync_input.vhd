library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sync_input is
	port(
	clk 			: in std_logic;
	coin25_in 	: in std_logic;
	coin50_in 	: in std_logic;
	coin01_in 	: in std_logic;
	reset_in 	: in std_logic;
	buy_in 		: in std_logic;
	price_in 	: in std_logic_vector(5 downto 0);
	
	coin25 		: out std_logic;
	coin50 		: out std_logic;
	coin01 		: out std_logic;
	reset 		: out std_logic;
	buy 			: out std_logic;
	price 		: out std_logic_vector(5 downto 0));
end sync_input;

architecture bhv of sync_input is
begin
	process(clk)
	begin
		if rising_edge(clk) then
			reset <= reset_in;
			coin25 <= coin25_in;
			coin50 <= coin50_in;
			coin01 <= coin01_in;
			buy <= buy_in;
			price <= price_in;
		end if;
	end process;
end bhv;