library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity subtractor8 is
	port(
		a : in std_logic_vector(8 downto 0); -- Operando 1
		b : in std_logic_vector(8 downto 0); -- Operando 2
		result : out std_logic_vector(8 downto 0) -- Resultado final
	);
end subtractor8;

architecture structural of subtractor8 is
component adder8 is -- Somador de 8 bits
	port(
		a 		: in std_logic_vector(8 downto 0); -- Operando 1
		b 		: in std_logic_vector(8 downto 0); -- Operando 2
		c_in	: in std_logic; -- Bit pra moeda de entrada
		s		: out std_logic_vector(8 downto 0); -- Soma total
		c_out	: out std_logic -- Bit pra moeda de saida
	);
end component;

signal c_in 	: std_logic; -- Sinal para entrada de moeda
signal c_out 	: std_logic; -- Sinal para saida de moeda
signal not_b 	: std_logic_vector(8 downto 0); -- Operando 2 negado

begin
	not_b <= (not b); -- Atribuicao do operando 2 negado
	c_in <= '1'; -- Sinal de entrada de moeda
	
	subtractor : adder8 port map (a, not_b, c_in, result, c_out); -- Adicao dos valores
end structural;