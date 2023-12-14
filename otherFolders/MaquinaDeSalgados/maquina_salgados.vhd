library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity maquina_salgados is
	port(
		clock : in std_logic;
		
		-- salgados
		BFG	: in std_logic; -- Batata Frita Grande (250)
		BFM	: in std_logic; -- Batata Frita Media (150)
		BFP	: in std_logic; -- Batata Frita Pequena (075)
		TG		: in std_logic; -- Tortilha Grande (350)
		TP		: in std_logic; -- Tortilha Pequena (200)
		
		-- moedas e botoes
	-- coin25  : in integer range -65535 to 65535; -- moeda de 025
	-- coin50  : in integer range -65535 to 65535; -- moeda de 050
	-- coin100 : in integer range -65535 to 65535; -- moeda de 100
		coin 			: in integer range -65535 to 65535;
		cancel_btn 	: in std_logic; -- botao cancelar
		buy_btn		: in std_logic; -- botao comprar
	-- price			: in integer range -65535 to 65535; -- (?)
		
		-- saidas
		money_alert	: out std_logic; -- alarme para dinheiro insuficiente
		stock_alert	: out std_logic; -- alarme para falta de estoque
		free_coins	: out std_logic; -- led para liberar todas as moedas
		salgado_out : out std_logic; -- led para salgado liberado
		troco			: out std_logic; -- led para troco liberado
		segments		: out std_logic_vector(6 downto 0) -- segmento para o display
		
	);
end maquina_salgados;

architecture bhv of maquina_salgados is
	 -- signal ... ;
	
	component coin_display
	port(
		clk	: in std_logic;
		reset	: in std_logic;
		coin_val	: in integer range -65535 to 65535;
		segments	: out std_logic_vector(6 downto 0)
	);
	end component;
	
	--component unidade_salgado
	--port(
		-- ...
	--);
	--end component
	
begin
	Inst_coin_display: coin_display port map(
		clk => clock,
		reset => cancel_btn,
		coin_val => coin,
		segments => segments
	);
	
	--Inst_unidade_salgado: unidade_salgado port map(
		-- ...
	--);
end bhv;