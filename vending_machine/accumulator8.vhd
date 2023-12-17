library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.numeric_std.all;

entity accumulator8 is
	port(		
		clk		: in std_logic; -- Clock de entrada
		nRST_acc	: in std_logic; -- Reset
		C 			: in std_logic; -- Sensor de moeda
		data_in 	: in std_logic_vector(8 downto 0); -- Valor de entrada
		data_out : out std_logic_vector(8 downto 0); -- Valor de saida
		conf: in std_logic;           --Entrada para confirmar compra e calculo do valor total
		cancel 	: in std_logic
		);
end accumulator8;

architecture rtl of accumulator8 is
	component adder8 is -- Somador de 8 bits
	port(
		a 		: in std_logic_vector(8 downto 0); -- Operando a
		b 		: in std_logic_vector(8 downto 0); -- Operando b
		c_in	: in std_logic; -- Moeda de entrada
		s		: out std_logic_vector(8 downto 0); -- Soma total
		c_out	: out std_logic -- Moeda de saida
	);
	end component;

signal temp1 	: std_logic_vector(8 downto 0); -- Operando 2
signal temp2 	: std_logic_vector(8 downto 0); -- Soma total
signal c_in 	: std_logic; -- Bit pra moeda de entrada
signal c_out 	: std_logic; -- Bit pra moeda de saida

begin
	c_in <= '0';
	
	adder : adder8 port map (data_in, temp2, c_in, temp1, c_out);
	-- Port map acima efetuado tendo data_in como Operando 1 do somador de 8 bits

	reg: process(clk)
    begin
        if (clk'event and clk = '1') then
            if nRST_acc = '0' or cancel = '1' then -- Reset (quando necessario)
                temp2 <= (others => '0');
            elsif (C = '1') then -- Verifica se uma moeda foi inserida
                if ((data_in = "000011001" or data_in = "000110010" or data_in = "001100100") and conf = '0') then
						if(cancel = '0') then
                    temp2 <= temp1; -- Acumulamos a soma apenas para moedas validas
						else 
						  temp2 <= "000000000";
						end if;
                end if;
            end if;
        end if;
    end process reg;


    data_out <= temp2; -- Saida do valor total acumulado

end rtl;