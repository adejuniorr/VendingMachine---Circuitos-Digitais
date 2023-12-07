library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sum_sub is -- entidade com o mesmo nome do projeto!
	port
	(
		A: in integer range -65535 to 65535;-- operando A
		B: in integer range -65535 to 65535;-- operando B
		c: in std_logic;-- controle
		s: out integer range -65535 to 65535-- saida
	);
end sum_sub;

architecture bhv of sum_sub is -- a arquiterura remete a descricao do circuito em si
begin
	process(c,A,B)-- processo para realizar execucao sequencial									
	begin
		if (c = '0') then -- soma para c = 0
			s <= A + B;
		elsif (c = '1') then -- subtracao para c = 1
			s <= A - B;
		end if;
	end process;
end bhv;