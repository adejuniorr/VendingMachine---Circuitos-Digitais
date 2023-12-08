library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_manager is
	port(
		auto_clk		: in std_logic;
		man_clk		: in std_logic;
		sel_man		: in std_logic;
		clk			: out std_logic
	);
end clock_manager;

architecture bhv of clock_manager is
signal count_present, count_next		: unsigned(15 downto 0):=(others => '0');
attribute clock_signal			: string;
attribute clock_signal of clk : signal is "yes";

begin
	count_next <= count_present + 1;
	
	process(sel_man, man_clk, count_present)
	begin
		if sel_man = '1' then
			clk <= man_clk;
		else
			clk <= count_present(15);
		end if;
	end process;
	
	process(man_clk, count_present)
	begin
		if rising_edge(man_clk) then
			count_present <= count_next;
		end if;
	end process;
end bhv;