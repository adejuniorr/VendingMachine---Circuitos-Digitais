library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity coin_display is
	port(
		clk		: in std_logic;
		reset		: in std_logic;
		--bcd		: in std_logic_vector(3 downto 0); -- decimal em binario
		coin_val : in integer range -65535 to 65535;
		
		segments : out std_logic_vector(6 downto 0)
	);
end coin_display;

architecture bhv of coin_display is
begin -- architecture
	process(clk, reset)
	begin -- process
		if reset = '1' then
			segments <= (others => '0');
		elsif rising_edge(clk) then
			segments <= "0000000"; -- desliga todos os segmentos
			--case bcd is
				--when "0000" => segments <= "1111110"; -- display 0
				--when "0001" => segments <= "0110000"; -- display 1
				--when "0010" => segments <= "1101101"; -- display 2
				--when "0011" => segments <= "1110010"; -- display 3
				--when "0100" => segments <= "0111001"; -- display 4
				--when "0101" => segments <= "1011010"; -- display 5
				--when "0110" => segments <= "1111010"; -- display 6
				--when "0111" => segments <= "0110111"; -- display 7
				--when "1000" => segments <= "1111101"; -- display 8
				--when "1001" => segments <= "1100100"; -- display 9
				--when others => segments <= "1111111"; -- display erro
			--end case;
			case coin_val is
				when 0 => segments <= "1111110"; -- display 0
				when 1 => segments <= "0110000"; -- display 1
				when 2 => segments <= "1101101"; -- display 2
				when 3 => segments <= "1110010"; -- display 3
				when 4 => segments <= "0111001"; -- display 4
				when 5 => segments <= "1011010"; -- display 5
				when 6 => segments <= "1111010"; -- display 6
				when 7 => segments <= "0110111"; -- display 7
				when 8 => segments <= "1111101"; -- display 8
				when 9 => segments <= "1100100"; -- display 9
				when others => segments <= "1111111"; -- display erro
			end case;
		end if;
	end process;
	
	
end bhv;