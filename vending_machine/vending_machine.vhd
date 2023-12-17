-- AUTO CLOCK --
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vending_machine is
	port(
		nRST 					: in std_logic; -- Reset (para nova compra)
		clk 					: in std_logic; -- Clock padrao 
		C 						: in std_logic; -- Sensor de moedas ('1' para quando uma moeda eh inserida)
		V_input 				: in std_logic_vector(2 downto 0); -- Entra de valores de moeda
		choice 				: in std_logic_vector(2 downto 0); -- Escolha do salgado
		cancel_purchase 	: in std_logic;  -- Opcao de cancelamento de compra
		
		dispense_signal: in std_logic; --Entrada para confirmar o salgado escolhido
		coin_confirm_signal: in std_logic; --Entrada para confirmar uma moeda adicionada
		
		hexDisplay_choice: out std_logic_vector(6 downto 0);          --Saida para o Display Opcao Salgado
		hexDisplay_centena: out std_logic_vector(6 downto 0); --Saida para o Display Dinheiro Centena
		hexDisplay_dezena: out std_logic_vector(6 downto 0);  --Saida para o Display Dinehrio Dezena
		hexDisplay_unidade: out std_logic_vector(6 downto 0); --Saida para o Display Dinheiro Unidade
		
		P 			: out std_logic_vector(8 downto 0); -- Acumulador de moedas
		E 			: out std_logic_vector(8 downto 0); -- Troco/Retorno de moedas
		D1 			: out std_logic_vector(2 downto 0) := "000"; -- Sinal para salgado liberado
		D2 			: out std_logic_vector(2 downto 0) := "000"; -- Sinal para salgado liberado
		D3 			: out std_logic_vector(2 downto 0) := "000"; -- Sinal para salgado liberado
		D4 			: out std_logic_vector(2 downto 0) := "000"; -- Sinal para salgado liberado
		D5 			: out std_logic_vector(2 downto 0) := "000"; -- Sinal para salgado liberado
		ESTQ1 		: out std_logic_vector(8 downto 0) := "000000000"; -- Aviso de quantidade em estoque
		ESTQ2 		: out std_logic_vector(8 downto 0) := "000000000"; -- Aviso de quantidade em estoque
		ESTQ3 		: out std_logic_vector(8 downto 0) := "000000000"; -- Aviso de quantidade em estoque
		ESTQ4		: out std_logic_vector(8 downto 0) := "000000000"; -- Aviso de quantidade em estoque
		ESTQ5 		: out std_logic_vector(8 downto 0) := "000000000" -- Aviso de quantidade em estoque
	);
end vending_machine;

architecture rtl of vending_machine is
	constant S0 : std_logic_vector(8 downto 0) := "011111010"; -- Preço da escolha 1 (250)
	constant S1 : std_logic_vector(8 downto 0) := "010010110"; -- Preço da escolha 2 (150)
	constant S2 : std_logic_vector(8 downto 0) := "001001011"; -- Preço da escolha 3 (75)
	constant S3 : std_logic_vector(8 downto 0) := "101011110"; -- Preço da escolha 4 (350)
	constant S4 : std_logic_vector(8 downto 0) := "011001000"; -- Preço da escolha 5 (200)

	component accumulator8 is -- Acumulador de 8 bits
	port(
		clk		: in std_logic; -- Clock de entrada
		nRST_acc	: in std_logic; -- Reset
		C 			: in std_logic; -- Sensor de moeda
		data_in 	: in std_logic_vector(8 downto 0); -- Valor de entrada
		data_out : out std_logic_vector(8 downto 0); -- Valor de saida
		conf: in std_logic; --Entrada para confirmar uma moeda adicionada
		cancel : in std_logic
	);
	end component;

	component adder8 is -- Somador de 8 bits
	port(
		a 		: in std_logic_vector(8 downto 0); -- Operando 1
		b 		: in std_logic_vector(8 downto 0); -- Operando 2
		c_in	: in std_logic; -- Bit pra moeda de entrada
		s		: out std_logic_vector(8 downto 0); -- Soma total
		c_out	: out std_logic -- Bit pra moeda de saida
	);
	end component;

	component subtractor8 is -- Subtrator de 8 bits
	port(
		a 		: in std_logic_vector(8 downto 0); -- Operando 1
		b 		: in std_logic_vector(8 downto 0); -- Operando 2
		result: out std_logic_vector(8 downto 0) -- Resultado final
	);
	end component;

	component comparator8 is -- Comparador de 8 bits
	port(
		a 		: in std_logic_vector(8 downto 0); -- 1o input
		b 		: in std_logic_vector(8 downto 0); -- 2o input
		g_out : out std_logic; -- Saida g
		e_out : out std_logic; -- Saida e
		l_out : out std_logic  -- Saida l
	);
	end component;

	component mux21 is -- Componente para escolha do salgado
	port(
		A 	: in std_logic_vector(8 downto 0); -- Escolha 01
		B 	: in std_logic_vector(8 downto 0); -- Escolha 02
		C 	: in std_logic_vector(8 downto 0); -- Escolha 03
		D 	: in std_logic_vector(8 downto 0); -- Escolha 04
		E 	: in std_logic_vector(8 downto 0); -- Escolha 05
		s 	: in std_logic_vector(2 downto 0); -- Numero da escolha
		output : out std_logic_vector(8 downto 0) -- Saida
	);
	end component;

	type FSMTYPE is (INIT_STATE, Coin_Reception, salgado_dispensation); -- Estados da Maquina

	signal CSTATE, NSTATE : FSMTYPE; -- Sinais para estado de moeda (CoinState) e proximo estado (NextState)

	signal balance, price, price_reg, coins_to_return : std_logic_vector(8 downto 0); -- Sinais para valores de preco, troco, retorno de moeda, etc.

	signal price_choice_reg_EN, balance_greater, balance_equal, balance_lower: std_logic; -- Bits de controle para valores

	signal nRST_acc : std_logic; -- Reset
	signal choice_reg : std_logic_vector(2 downto 0); -- Escolha do salgado
	signal unidade_reg : integer range 0 to 9999 := 0; -- Unidades de salgado
	signal stock_S0_reg, stock_S1_reg, stock_S2_reg, stock_S3_reg, stock_S4_reg, stock_S5_reg : integer := 1; -- Estoque total de cada salgado na maquina (definido pelo desenvolvedor)

	signal V : STD_LOGIC_VECTOR (8 downto 0); -- Entrada de valor de moeda
	signal c_out : std_logic; -- Bit de controle para saida de moeda
	signal c_in : std_logic; -- Bit de controle para entrada de moeda

	signal dispensation_EN : std_logic; -- Bit de controle para liberacao de salgado
	
	signal salgado_selecionado: integer range 1 to 6 := 1; --Salgado selecionado pelo cliente

	--Funcao para converter Numero Inteiro para Vetor de Saida do Display de 7 seg
	function intToSevenSeg (numero: integer) return std_logic_vector is --Funcao recebe um numero inteiro
		variable bin_output: std_logic_vector(6 downto 0); --Vetor de 7 bits para saida do Display
		
	begin --Inicio da Funcao
		case (numero) is
			when 0 => bin_output := "1000000"; --Saida recebe o numero 0 na Cod. do Display de 7 Seg
			when 1 => bin_output := "1111001"; --Saida recebe o numero 1 na Cod. do Display de 7 Seg
			when 2 => bin_output := "0100100"; --Saida recebe o numero 2 na Cod. do Display de 7 Seg
			when 3 => bin_output := "0110000"; --Saida recebe o numero 3 na Cod. do Display de 7 Seg
			when 4 => bin_output := "0011001"; --Saida recebe o numero 4 na Cod. do Display de 7 Seg
			when 5 => bin_output := "0010010"; --Saida recebe o numero 5 na Cod. do Display de 7 Seg
			when 6 => bin_output := "0000010"; --Saida recebe o numero 6 na Cod. do Display de 7 Seg
			when 7 => bin_output := "1111000"; --Saida recebe o numero 7 na Cod. do Display de 7 Seg
			when 8 => bin_output := "0000000"; --Saida recebe o numero 8 na Cod. do Display de 7 Seg		   
			when 9 => bin_output := "0010000"; --Saida recebe o numero 9 na Cod. do Display de 7 Seg       
			when others =>
		end case;
	return bin_output; --Retornando o vetor de Saida
	end intToSevenSeg; --Fim da funcao

begin

	price_registration : process( CLK ) -- Registro de Preco
	begin
		if (CLK'event and CLK = '1') then
			if (price_choice_reg_EN = '1') then
				price_reg <= price;
				choice_reg <= choice;
			end if ;
		end if ;
   end process;
	
	state_registration : process( CLK ) -- Registro de Estado
	begin
		if (CLK'event and CLK = '1') then
			if (nRST = '0') then
				CSTATE <= INIT_STATE;
			else
				CSTATE <= NSTATE;
			end if;
		end if;
   end process;

	salgado_dispensation_proc: process(CLK) -- Liberacao de salgado
	begin
		if (CLK'event and CLK = '1') then
			if (nRST = '0') then
			D1 <= (others => '0'); -- Sinal para saida de salgado (incialmente zerado)
			D2 <= (others => '0'); -- Sinal para saida de salgado (incialmente zerado)
			D3 <= (others => '0'); -- Sinal para saida de salgado (incialmente zerado)
			D4 <= (others => '0'); -- Sinal para saida de salgado (incialmente zerado)
			D5 <= (others => '0'); -- Sinal para saida de salgado (incialmente zerado)
			
			ESTQ1 <= (others => '0'); -- Sinal de estoque (inicialmente 0 - tem salgado pra vender)
			ESTQ2 <= (others => '0'); -- Sinal de estoque (inicialmente 0 - tem salgado pra vender)
			ESTQ3 <= (others => '0'); -- Sinal de estoque (inicialmente 0 - tem salgado pra vender)
			ESTQ4 <= (others => '0'); -- Sinal de estoque (inicialmente 0 - tem salgado pra vender)
			ESTQ5 <= (others => '0'); -- Sinal de estoque (inicialmente 0 - tem salgado pra vender)
			end if;
			if (cancel_purchase = '0') then
				case choice_reg is
					when "001" =>
						if stock_S0_reg <= 0  then
							 -- Sem estoque pro produto 1
							 -- Permanece no estado inicial
							 ESTQ1 <= "000000001";
						end if;
				  when "010" =>
						if stock_S1_reg <= 0  then
							 -- Sem estoque pro produto 2
							 -- Permanece no estado inicial
							 ESTQ2 <= "000000001";
						end if;
				  when "011" =>
						if stock_S2_reg <= 0  then
							 -- Sem estoque pro produto 3
							 -- Permanece no estado inicial
							 ESTQ3 <= "000000001";
						end if;
				  when "100" =>
						if stock_S3_reg <= 0  then
							 -- Sem estoque pro produto 4
							 -- Permanece no estado inicial
							 ESTQ4 <= "000000001";
						end if;
				  when "101" =>
						if stock_S4_reg <= 0  then
							 -- Sem estoque pro produto 5
							 -- Permanece no estado inicial
							 ESTQ5 <= "000000001";
						end if;
				  when others =>
						null;
				end case;
				
				if (dispensation_EN = '1') then
					if(choice_reg = "001") then -- Para o produto 1
						if stock_S0_reg > 0 then 
							salgado_selecionado <= 1;
							D1 <= "001";
							stock_S0_reg <= stock_S0_reg - 1;
                  end if; 
					elsif(choice_reg = "010") then -- Para o produto 2
						if stock_S1_reg > 0 then
							salgado_selecionado <= 2;
							D2 <= "001";
                     stock_S1_reg <= stock_S1_reg - 1;
						end if;
					elsif(choice_reg = "011") then -- Para o produto 3
						if stock_S2_reg > 0 then
							salgado_selecionado <= 3;
							D3 <= "001";
							stock_S2_reg <= stock_S2_reg - 1;
						end if;
					elsif(choice_reg = "100") then -- Para o produto 4
						if stock_S3_reg > 0 then    
							salgado_selecionado <= 4;
							D4 <= "001";
							stock_S3_reg <= stock_S3_reg - 1;
						  end if;
					elsif(choice_reg = "101") then -- Para o produto 5
						if stock_S4_reg > 0 then    
							salgado_selecionado <= 5;
							D5 <= "001";
							stock_S4_reg <= stock_S4_reg - 1;
						end if;
					end if;
				end if;
			end if;
		end if;
	end process; --salgado_dispensation_Proc;
	
	hex_display_updt : process(clk)
	variable hundred, ten, unit : integer range 0 to 999; -- Variaveis de calculo para valor no display
	begin
		if (clk'event and clk = '1') then			
			case (CSTATE) is
				when INIT_STATE =>					
					case choice is
						when "001" =>
							hexDisplay_choice		<= intToSevenSeg(1);
							hexDisplay_centena 	<= intToSevenSeg(2); --Display que mostra a Centena
							hexDisplay_dezena  	<= intToSevenSeg(5);  --Display que mostra a Dezena
							hexDisplay_unidade 	<= intToSevenSeg(0); --Display que mostra a Unidade

					  when "010" =>
							hexDisplay_choice		<= intToSevenSeg(2);
							hexDisplay_centena 	<= intToSevenSeg(1); --Display que mostra a Centena
							hexDisplay_dezena  	<= intToSevenSeg(5);  --Display que mostra a Dezena
							hexDisplay_unidade 	<= intToSevenSeg(0); --Display que mostra a Unidade
							
					  when "011" =>
							hexDisplay_choice		<= intToSevenSeg(3);
							hexDisplay_centena 	<= intToSevenSeg(0); --Display que mostra a Centena
							hexDisplay_dezena  	<= intToSevenSeg(7);  --Display que mostra a Dezena
							hexDisplay_unidade 	<= intToSevenSeg(5); --Display que mostra a Unidade
							
					  when "100" =>
							hexDisplay_choice		<= intToSevenSeg(4);
							hexDisplay_centena 	<= intToSevenSeg(3); --Display que mostra a Centena
							hexDisplay_dezena  	<= intToSevenSeg(5);  --Display que mostra a Dezena
							hexDisplay_unidade 	<= intToSevenSeg(0); --Display que mostra a Unidade
							
					  when "101" =>
							hexDisplay_choice		<= intToSevenSeg(5);
							hexDisplay_centena 	<= intToSevenSeg(2); --Display que mostra a Centena
							hexDisplay_dezena  	<= intToSevenSeg(0);  --Display que mostra a Dezena
							hexDisplay_unidade 	<= intToSevenSeg(0); --Display que mostra a Unidade
							
					  when others =>
							hexDisplay_choice   <= "1111111"; --Desligando Display
							hexDisplay_centena <= "1111111"; --Desligando Display
							hexDisplay_dezena  <= "1111111"; --Desligando Display
							hexDisplay_unidade <= "1111111"; --Desligando Display
					end case;
					
				when Coin_Reception =>
					hexDisplay_choice		<= intToSevenSeg(0);
						
					-- Obtendo a Centena
					hexDisplay_centena  <= intToSevenSeg(to_integer(unsigned(balance)) / 100);
					-- Obtendo a Dezena
					hexDisplay_dezena   <= intToSevenSeg((to_integer(unsigned(balance)) / 10) mod 10);
					-- Obtendo a Unidade
					hexDisplay_unidade  <= intToSevenSeg(to_integer(unsigned(balance)) mod 10);
				when others =>
			end case;
		end if;
	end process;

	next_state : process( CSTATE, balance, C, balance_equal, balance_greater, coins_to_return)
   begin
		if (nRST = '0') then
			P <= (others => '0');
			E <= (others => '0');
		end if;
		
		NSTATE 		<= CSTATE;	-- Configura a alteracao do NSTATE (NextSTATE) para o estado atual CSTATE (CurrentSTATE)
		nRST_acc 	<= '1'; 		-- Reset em 1 (off)
      price_choice_reg_EN 	<= '0'; -- Bit de controle de preco
		dispensation_EN 		<= '0'; -- Bit de controle para salgado liberado ou nao
		
		if (dispense_signal = '0') then
			P <= (others => '0'); -- Acumulo de moedas
		end if;
		
		case to_integer(unsigned(V_input)) is -- Valores-teste de entrada de V
			 when 1 =>
				  V <= "000000101";
			 when 2 =>
				  V <= "000001010";
			 when 3 =>
				  V <= "000011001";
			 when 4 =>
				  V <= "000110010";
			 when 5 =>
				  V <= "001100100";
			 when others =>
				  V <= "000000000";
		end case;


		case( CSTATE ) is
			when INIT_STATE => -- Quando no estado inicial
				if cancel_purchase = '1' then -- Cancela a compra e reseta valores
					E <= balance;
					P <= (others => '0');
				
					if V /= "000011001" and V /= "000110010" and V /= "001100100" and C = '1' then
						E <= V; -- Retorna qualquer moeda invalida que fora inserida
					end if;
				
					NSTATE <= INIT_STATE; -- Retorna para o estado inicial
				else -- Caso a compra siga adiante
							  
					nRST_acc <= '0';
					price_choice_reg_EN <= '1';
					
				case choice_reg is
					when "001" =>
						if stock_S0_reg <= 0  then
							 -- Sem estoque pro produto 1
							 -- Permanece no estado inicial
							 NSTATE <= INIT_STATE;
						else
							nRST_acc <= '1';
							price_choice_reg_EN <= '1';
							E <= balance;
							NSTATE <= Coin_Reception;
						end if;
				  when "010" =>
						if stock_S1_reg <= 0  then
							 -- Sem estoque pro produto 2
							 -- Permanece no estado inicial
							 NSTATE <= INIT_STATE;
						else
							nRST_acc <= '1';
							price_choice_reg_EN <= '1';
							E <= balance;
							NSTATE <= Coin_Reception;
						end if;
				  when "011" =>
						if stock_S2_reg <= 0  then
							 -- Sem estoque pro produto 3
							 -- Permanece no estado inicial
							 NSTATE <= INIT_STATE;
						else
							nRST_acc <= '1';
							price_choice_reg_EN <= '1';
							E <= balance;
							NSTATE <= Coin_Reception;
						end if;
				  when "100" =>
						if stock_S3_reg <= 0  then
							 -- Sem estoque pro produto 4
							 -- Permanece no estado inicial
							 NSTATE <= INIT_STATE;
						else
							nRST_acc <= '1';
							price_choice_reg_EN <= '1';
							E <= balance;
							NSTATE <= Coin_Reception;
						end if;
				  when "101" =>
						if stock_S4_reg <= 0  then
							 -- Sem estoque pro produto 5
							 -- Permanece no estado inicial
							 NSTATE <= INIT_STATE;
						else
							nRST_acc <= '1';
							price_choice_reg_EN <= '1';
							E <= balance;
							NSTATE <= Coin_Reception;
						end if;
				  when others =>
						null;
				end case;
				
				if C = '1' and (choice = "001" and stock_S0_reg > 0) then
					nRST_acc <= '1';
					NSTATE <= Coin_Reception;
				
				elsif C = '1' and (choice = "010" and stock_S1_reg > 0) then
					nRST_acc <= '1';
					NSTATE <= Coin_Reception;
					
				elsif C = '1' and (choice = "011" and stock_S2_reg > 0) then
					nRST_acc <= '1';
					NSTATE <= Coin_Reception;
					
				elsif C = '1' and (choice = "100" and stock_S3_reg > 0) then
					nRST_acc <= '1';
					NSTATE <= Coin_Reception;
					
				elsif C = '1' and (choice = "101" and stock_S4_reg > 0) then
					nRST_acc <= '1';
					NSTATE <= Coin_Reception;
					
				end if; 

			end if; -- Fim do else (if cancel_purchase = '0')
				
 
			when Coin_Reception => -- Quando no estado de recepcao de moedas
				if cancel_purchase = '1' then -- Caso o cliente cancele
					-- Cancela a compra, reseta os valores e retorna ao estado inicial
					E <= balance;
					P <= (others => '0');
					NSTATE <= INIT_STATE;
				else -- Caso a compra siga adiante
					P <= balance; -- Acumulamos os valores de moeda em P
				
					if V /= "000011001" and V /= "000110010" and V /= "001100100" then
					-- Retornamos ao usuario qualquer moeda invalida
						E <= V;
					end if;
			
					if ((balance_equal = '1' or balance_greater = '1') and dispense_signal = '0') then
					-- Se o acumulo de moedas for igual ou maior que o preco do salgado e houver o sinal para liberacao:
						if cancel_purchase = '0' then
							dispensation_EN <= '1';
						end if;
						NSTATE <= salgado_dispensation;
				end if;
			end if;
			
			when salgado_dispensation => -- Quando no estado de liberacao do salgado
				if cancel_purchase = '1' then-- Caso o cliente cancele
				-- Cancela a compra, limpa o acumulado em P e retorna ao estado inicial
					E <= balance;
					P <= (others => '0');
					NSTATE <= INIT_STATE;
				elsif (dispense_signal = '0') then -- Caso a compra siga adiante
					E <= coins_to_return; -- Troco
					
					nRST_acc <= '0'; -- Reset da compra
					NSTATE <= INIT_STATE; -- Volta ao estado inicial
				end if;
			when others => -- Qualquer outro estado nao estara configurado para a maquina
		end case ;
	end process ; -- Fim do processo NSTATE (NextState)
	
	
	-- Instancias para constroladores de display e manipulacao de valoes inseridos (acumulo, soma, subtracao, etc.)
	mux : mux21 port map(S0, S1, s2, s3, s4, choice, price);
	
	accumulator : accumulator8 port map (clk, nRST_acc, C, V, balance, coin_confirm_signal, cancel_purchase);
	
	comparator : comparator8 port map (balance, price_reg, balance_greater, balance_equal, balance_lower);
	
	subtractor : subtractor8 port map (balance, price_reg, coins_to_return);
end rtl; -- Fim da Arquitetura da Maquina de Salgados