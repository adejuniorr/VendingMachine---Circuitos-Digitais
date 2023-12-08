library ieee;
use ieee.std_logic_1164.all;

entity fvending_machine is
	port(
		auto_clk		: in std_logic; -- clock automatico
		man_clk		: in std_logic; -- clock manual
		sel_man		: in std_logic; -- seleciona clock manual ou automatico
		coin25		: in std_logic; -- R$ 0,25
		coint50		: in std_logic; -- R$ 0,50
		coin01		: in std_logic; -- R$ 1,00
		reset			: in std_logic; -- botao de reset (desistir da compra)
		buy			: in std_logic; -- botao de compra
		price			: in std_logic_vector(5 downto 0); -- preco do produto
		food_out		: out std_logic; -- led para salgado liberado
		not_en_mon	: out std_logic; -- alarme de dinheiro insuficiente
		not_stock	: out std_logic; -- alarme para estoque vazio
		
		seven_segment : out std_logic_vector(7 downto 0); -- Catodos para os segmentos (???)
		digit_select  : out std_logic_vector(3 downto 0); -- Anodos apra os segmentos (???)
		tx				  : out std_logic -- ???
	);
end fvending_machine;

architecture bhv of fvending_machine is
	signal clk					: std_logic; -- ???
	signal sync_coin25     	: std_logic; -- Sync R$ 0,25 apos entrada
	signal sync_coin50     	: std_logic; -- Sync R$ 0,50 apos entrada
	signal sync_coin01		: std_logic; -- Sync R$ 1,00 apos entrada
	signal sync_buy       	: std_logic; -- Sync botao de compra
	signal sync_reset     	: std_logic; -- Sync botao de reset
	signal sync_price 		: std_logic_vector(5 downto 0); -- Sync preco
	signal sum            	: std_logic_vector(6 downto 0); -- Sync soma de moedas
	
	signal food_out_var, not_en_mon_var : std_logic; -- ???
	signal new_value 			: std_logic; -- indica quando um novo valor foi inserido (comprando um salgado ou adicionando uma moeda)
	
-----------------------------------------------------------
-- COMPONENTES
-----------------------------------------------------------
	----------------------------
	-- 
	-- Gerenciador de clock
	----------------------------
	component clock_manager
	port(
		auto_clk   	:  in  std_logic;
		man_clk  		:  in  std_logic;
		sel_man  		:  in  std_logic;
		clk     		 	:  out std_logic
		);
	end component;
	
	
	---------------------------------
	--
	-- Sincronizador de input
	-- Sincroniza os clocks
	-- Evita metaestabilidade (???)
	---------------------------------
	component sync_input
	port (
		clk				: in std_logic;
		coin25_in		: in std_logic;
		coint50_in		: in std_logic;
		coin01_in		: in std_logic;
		reset_in			: in std_logic;
		buy_in			: in std_logic;
		price_in			: in std_logic_vector(5 downto 0);
		
		coin25			: out std_logic;
		coint50			: out std_logic;
		coin01			: out std_logic;
		reset				: out std_logic;
		buy				: out std_logic;
		price				: out std_logic_vector(5 downto 0)
		
	);
	end component;
	
	----------------
	--
	-- CPU
	----------------
	component vm_cpu
	port(
		clk 			: in std_logic;
		
		coin25		: in std_logic;
		coint50		: in std_logic;
		coin01		: in std_logic;
		reset 		: in std_logic;
		buy 			: in std_logic;
		price 		: in std_logic_vector(5 downto 0);
		
		sum 			: out std_logic_vector(6 downto 0);
		food_out 	: out std_logic;
		not_en_mon	: out std_logic;
		new_value 	: out std_logic
	);
	end component;
	
	-----------
	--
	-- Display
	-----------
	component vm_display_manager
	port(
		auto_clk		: in std_logic;
		clk 			: in std_logic;
		reset			: in std_logic;
		price			: in std_logic_vector(5 downto 0);
		coin_sum		: in std_logic_vector(6 downto 0);
		buy			: in std_logic;
		food_out		: in std_logic;
		not_en_mon	: in std_logic;
		tx				: out std_logic;
		seven_segment : out std_logic_vector(7 downto 0);
		digit_select  : out std_logic_vector(3 downto 0);
		new_value	: in std_logic
		
	);
	end component;
-----------------------------------------------------------
-- FIM DOS COMPONENTES
-----------------------------------------------------------
begin
	-- Instancia do gerenciador de clock
	Inst_clock_manager : clock_manager port map (
		auto_clk => auto_clk,
		man_clk => man_clk,
		sel_man => sel_man,
		clk => clk
	);
	
	-- Instancia do Sincronizador de Input
	Inst_sync_input: sync_input port map(
		clk => clk,
		reset_in => reset,
		coin25_in => coin25,
		coint50_in => coint50,
		coin01_in => coin01,
		buy_in => buy,
		price_in => price,
		reset => sync_reset,
		coin25 => sync_coin25,
		coint50 => sync_coin50,
		coin01 => sync_coin01,
		buy => sync_buy,
		price => sync_price
	);
	
	-- Instancia da CPU
	Inst_vm_cpu: vm_cpu port map(
		clk => clk,
		reset => sync_reset,
		coin25 => sync_coin25,
		coint50 => sync_coin50,
		coin01 => sync_coin01,
		buy => sync_buy,
		price => sync_price,
		sum => sum,
		food_out => food_out_var,
		not_en_mon => not_en_mon_var,
		new_value => new_value
	);
	
	-- Instancia do Display
	Inst_vm_display_manager: vm_display_manager port map(
		auto_clk => auto_clk,
		clk => clk,
		reset => sync_reset,
		price => sync_price,
		buy => sync_buy,
		seven_segment => seven_segment,
		digit_select => digit_select,
		coin_sum => sum,
		food_out => food_out_var,
		not_en_mon => not_en_mon_var,
		new_value => new_value,
		tx => tx
	);
	
	not_en_mon <= not_en_mon_var;
	food_out <= food_out_var;
end bhv;