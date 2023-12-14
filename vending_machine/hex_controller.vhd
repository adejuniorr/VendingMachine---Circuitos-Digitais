library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;

library hex;
use hex.all;

entity hex_controller is 
	generic(
		CLEARED_HEX : std_logic_vector(6 downto 0) := "1111111" -- Display zerado
	);
	
	port (
		CLOCK 		: in std_logic; -- Clock de entrada
		RESET_N		: in std_logic; -- Reset
		I_VALUE 		: in integer range 0 to 9999; -- Valor de saida
		
		HEX0 : out std_logic_vector(6 downto 0); -- Saida 1
		HEX1 : out std_logic_vector(6 downto 0); -- Saida 2
		HEX2 : out std_logic_vector(6 downto 0); -- Saida 3
		HEX3 : out std_logic_vector(6 downto 0)  -- Saida 4
	);
end entity;


architecture behav of hex_controller is
	-- A funcao abaixo escreve um valor inteiro no display de sete segmentos
	function convert(I_INPUT : in integer range 0 to 9) -- Recebe o valor inteiro
		return std_logic_vector
	is
		variable RES : std_logic_vector(6 downto 0);
	begin
		 -- Nota de configuracao para cada display
		 -- Segmentos: abcdefg
		 -- Distribuicao abaixo
		 -- aaaa
		 -- f  b
		 -- f  b
		 -- gggg
		 -- e  c
		 -- e  c
		 -- dddd
		 
		case I_INPUT is -- Para cada possivel valor do input (inteiro)
		-- Valor      		  Segmentos
		--                  "gfedcba"
			when 0 => RES := "1000000";
			when 1 => RES := "1111001";
			when 2 => RES := "0100100";
			when 3 => RES := "0110000";
			when 4 => RES := "0011001";
			when 5 => RES := "0010010";
			when 6 => RES := "0000010";
			when 7 => RES := "1111000";
			when 8 => RES := "0000000";
			when 9 => RES := "0010000";
		end case;
		return RES;
	end function; -- Fim da funcao convert()

	begin -- Inicio da arquitetura
		
	LedController : process(CLOCK) -- Processo para controle de leds nos displays
	begin
		if RESET_N = '0' then -- Reseta cada segmento ("1111111")
			HEX0 <= CLEARED_HEX;
			HEX1 <= CLEARED_HEX;
			HEX2 <= CLEARED_HEX;
			HEX3 <= CLEARED_HEX;
		elsif(rising_edge(CLOCK)) then -- Chama a funcao convert() para os valores passados
			HEX0 <= (convert(I_VALUE rem 10));
			HEX1 <= (convert((I_VALUE / 10) rem 10));
			HEX2 <= (convert((I_VALUE / 100) rem 10));
			HEX3 <= (convert(I_VALUE / 1000));
		end if;
	end process;
end architecture;