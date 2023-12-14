library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.numeric_std.all;

entity vending_machine is
	port(
		nRST : in std_logic;  --negative reset
		clk : in std_logic;
		C : in std_logic; --from coin sensor: becomes 1 when a coin is detected.
		V_input : in std_logic_vector(6 downto 0); --received coin's value in cents from coin sensor.
		--S0 : in std_logic_vector(7 downto 0); --price of choice 1, defined by vending machin owner.
		--S1 : in std_logic_vector(7 downto 0); --price of choice 2, defined by vending machin owner.
		--S2 : in std_logic_vector(7 downto 0); --price of choice 3, defined by vending machin owner.
		--S3 : in std_logic_vector(7 downto 0); --price of choice 4, defined by vending machin owner.
		--S4 : in std_logic_vector(7 downto 0); --price of choice 5, defined by vending machin owner.
		choice : in std_logic_vector(2 downto 0); --choice product
		P : out std_logic_vector(8 downto 0); --Acumulated coin display
		E : out std_logic_vector(8 downto 0); --return change
		D : out std_logic_vector(2 downto 0); --food dispensation
		cancel_purchase : in std_logic;  -- New input signal for canceling the purchase
		display1 : out std_logic_vector(6 downto 0); -- exit of the de1
		display2 : out std_logic_vector(6 downto 0);
		display3 : out std_logic_vector(6 downto 0);
		display4 : out std_logic_vector(6 downto 0);
		ESTQ : out std_logic_vector(8 downto 0) --aviso de falta de estoque [!]
		);
end vending_machine;

architecture rtl of vending_machine is
  constant S0 : std_logic_vector(8 downto 0) := "011111010"; -- Preço da escolha 1 11111010 200 001100100
  constant S1 : std_logic_vector(8 downto 0) := "010010110"; -- Preço da escolha 2 10010110 150
  constant S2 : std_logic_vector(8 downto 0) := "001001011"; -- Exemplo para a escolha 3
  constant S3 : std_logic_vector(8 downto 0) := "101011110"; -- Exemplo para a escolha 4
  constant S4 : std_logic_vector(8 downto 0) := "011001000"; -- Exemplo para a escolha 5
  
component hex_controller is
	port (
		CLOCK 		: in std_logic; -- clock in
		RESET_N		: in std_logic; -- reset async
		
		I_VALUE 		: in integer range 0 to 9999; -- value to print
		
		HEX0 : out std_logic_vector(6 downto 0); -- exit of the de1
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0);
		HEX3 : out std_logic_vector(6 downto 0)
	);
end component;

component accumulator8 is
	port(
		clk: in std_logic;
		nRST_acc: in std_logic;
		C : in std_logic;	--becomes 1 when a coin is detected.
		data_in : in std_logic_vector(8 downto 0);
		data_out : out std_logic_vector(8 downto 0)
		);
end component;

component adder8 is
	port(
			a : in std_logic_vector(8 downto 0);
			b : in std_logic_vector(8 downto 0);
			c_in: in std_logic;
			s: out std_logic_vector(8 downto 0);
			c_out: out std_logic
		);
end component;

component subtractor8 is
	port(
		a : in std_logic_vector(8 downto 0);
		b : in std_logic_vector(8 downto 0);
		result : out std_logic_vector(8 downto 0)
		);
end component;

component comparator8 is
	port(
		a : in std_logic_vector(8 downto 0);
		b : in std_logic_vector(8 downto 0);
		g_out : out std_logic;
		e_out : out std_logic;
		l_out : out std_logic);
end component;

component mux21 is
	port(
		A : in std_logic_vector(8 downto 0);
		B : in std_logic_vector(8 downto 0);
		C : in std_logic_vector(8 downto 0);
		D : in std_logic_vector(8 downto 0);
		E : in std_logic_vector(8 downto 0);
		s : in std_logic_vector(2 downto 0);
		output : out std_logic_vector(8 downto 0)
		);
end component;

type FSMTYPE is (INIT_STATE, Coin_Reception, salgado_dispensation);

signal CSTATE, NSTATE : FSMTYPE;
signal balance, price, price_reg, coins_to_return : std_logic_vector(8 downto 0);
signal price_choice_reg_EN, balance_greater, balance_equal, balance_lower: std_logic;
signal dispensation_EN : std_logic;
signal choice_reg : std_logic_vector(2 downto 0);
signal nRST_acc : std_logic;
signal valid_coin : std_logic;
signal c_out : std_logic;
signal c_in : std_logic;
signal E_temp : std_logic_vector(8 downto 0);
signal stock_S0_reg, stock_S1_reg, stock_S2_reg, stock_S3_reg, stock_S4_reg, stock_S5_reg : integer := 1;
signal valor_display : integer range 0 to 9999 := 0;  -- Accumulated coin value as integer
signal temp_D : std_logic_vector(2 downto 0); -- Assuming D is std_logic_vector(2 downto 0)
signal temp_D2 : std_logic_vector(2 downto 0); -- Assuming D is std_logic_vector(2 downto 0)
signal V : STD_LOGIC_VECTOR (8 downto 0);
signal unidade_reg : integer range 0 to 9999 := 0;  

  
  


begin
	V <= "00" & V_input;
	price_registration : process( CLK )
    begin
        if (CLK'event and CLK = '1') then
            if (price_choice_reg_EN = '1') then
                price_reg <= price;
				choice_reg <= choice;
            end if ;
        end if ;
    end process ; -- price_registration

	state_registration : process( CLK )
    begin
        if (CLK'event and CLK = '1') then
            if (nRST = '0') then
                CSTATE <= INIT_STATE;
            else
                CSTATE <= NSTATE;
            end if ;
        end if ;
    end process ; -- state_registration

salgado_dispensation_proc: process(CLK)
    --variable temp_D : std_logic_vector(2 downto 0); -- Assuming D is std_logic_vector(2 downto 0)
begin
    if (CLK'event and CLK = '1') then
        if (cancel_purchase = '0') then
            if (dispensation_EN = '1') then
                if(choice_reg = "001") then
                    if stock_S0_reg > 0 then 
								D <= "001";
                        temp_D <= "001";   --S0
                        stock_S0_reg <= stock_S0_reg - 1;
                    else 
                        temp_D <= "000"; -- sem estoque
                    end if; 
                elsif(choice_reg = "010") then 
                    if stock_S1_reg > 0 then
                        temp_D <= "010";   --S1
								D <= "010";
                        stock_S1_reg <= stock_S1_reg - 1;
                    else 
                        temp_D <= "000"; -- sem estoque
                    end if;
                elsif(choice_reg = "011") then 
                    if stock_S2_reg > 0 then
                        temp_D <= "011";   --S2
								D <= "011";
                        stock_S2_reg <= stock_S2_reg - 1;
                    else 
                        temp_D <= "000"; -- sem estoque
                    end if;
                elsif(choice_reg = "100") then 
                    if stock_S3_reg > 0 then    
                        temp_D <= "100";   --S3
								D <= "100";
                        stock_S3_reg <= stock_S3_reg - 1;
                    else 
                        temp_D <= "000"; -- sem estoque
                    end if;
                elsif(choice_reg = "101") then 
                    if stock_S4_reg > 0 then    
                        temp_D <= "101";   --S4
								D <= "101";
                        stock_S4_reg <= stock_S4_reg - 1;
                    else 
                        temp_D <= "000"; -- sem estoque
                    end if;
                end if;

                --D <= temp_D; -- Assign the value to D outside of the if-elsif statements

            else
                D <= "000";
            end if;
        --else
            --D <= "111"; desistiu
            --NSTATE <= INIT_STATE;
        end if;
    end if;
end process; --salgado_dispensation_Proc;

	next_state : process( CSTATE, balance, C, balance_equal, balance_greater, coins_to_return)
    begin
      NSTATE <= CSTATE;
		nRST_acc <= '1';
      price_choice_reg_EN <= '0';
		dispensation_EN <= '0';
		p <= (others => '0');
		E <= (others => '0');
		ESTQ <= (others => '0');
		--valor_display <= to_integer(unsigned(balance));
		--valor_display <= to_integer(unsigned(balance));


        case( CSTATE ) is
			when INIT_STATE =>
			if cancel_purchase = '1' then
                    -- Cancel the purchase and return all coins
                          --E <= balance;
                          P <= (others => '0');
								  					if V /= "000011001" and V /= "000110010" and V /= "001100100" and C = '1' then
						E <= V;
					end if;
                    NSTATE <= INIT_STATE;
				else

                          
				nRST_acc <= '0';
				price_choice_reg_EN <= '1';
				E <= balance;
                -- Check product stock before allowing coin insertion

                case choice_reg is
                    when "001" =>
                        if stock_S0_reg <= 0  then
                            -- Out of stock for S0, stay in INIT_STATE
                            ESTQ <= "000000001";
                            NSTATE <= INIT_STATE;
								else
									nRST_acc <= '1';
									price_choice_reg_EN <= '1';
									E <= balance;
									NSTATE <= Coin_Reception;
								end if;
                    when "010" =>
                        if stock_S1_reg <= 0  then
                            -- Out of stock for S1, stay in INIT_STATE
                            ESTQ <= "000000010";
                            NSTATE <= INIT_STATE;
								else
									nRST_acc <= '1';
									price_choice_reg_EN <= '1';
									E <= balance;
									NSTATE <= Coin_Reception;
                        end if;
                    when "011" =>
                        if stock_S2_reg <= 0  then
                            -- Out of stock for S2, stay in INIT_STATE
                            ESTQ <= "000000011";
                            NSTATE <= INIT_STATE;
								else
									nRST_acc <= '1';
									price_choice_reg_EN <= '1';
									E <= balance;
									NSTATE <= Coin_Reception;
                        end if;
                    when "100" =>
                        if stock_S3_reg <= 0  then
                            -- Out of stock for S3, stay in INIT_STATE
                            ESTQ <= "000000100";
                            NSTATE <= INIT_STATE;
								else
									nRST_acc <= '1';
									price_choice_reg_EN <= '1';
									E <= balance;
									NSTATE <= Coin_Reception;
                        end if;
                    when "101" =>
                        if stock_S4_reg <= 0  then
                            -- Out of stock for S1, stay in INIT_STATE
                            ESTQ <= "000000101";
                            NSTATE <= INIT_STATE;
								else
									nRST_acc <= '1';
									price_choice_reg_EN <= '1';
									E <= balance;
									NSTATE <= Coin_Reception;
                        end if;
                    -- Repeat for other choices
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
					end if;
    
            when Coin_Reception =>
							if cancel_purchase = '1' then
                    -- Cancel the purchase and return all coins
                          --E <= balance;
                          --P <= (others => '0');
                    NSTATE <= INIT_STATE;
				else
					P <= balance;
					if V /= "000011001" and V /= "000110010" and V /= "001100100" then
						E <= V;
					end if;
				
               if (balance_equal = '1' or balance_greater = '1') then
                  NSTATE <= salgado_dispensation;
               end if ;
				end if;
            
            when salgado_dispensation =>
											if cancel_purchase = '1' then
                    -- Cancel the purchase and return all coins
                          --E <= balance;
                          P <= (others => '0');
                    NSTATE <= INIT_STATE;
				else
					dispensation_EN <= '1';
					E <= coins_to_return;
					nRST_acc <= '0';
                NSTATE <= INIT_STATE;
					end if;
					 
            when others =>
        end case ;
    end process ; -- next_state

	 display : hex_controller port map(clk, nRST_acc, to_integer(unsigned(balance)), display4, display3, display2, display1);
	--display_unidade : hex_controller port map(clk, nRST_acc, to_integer(unsigned(temp_D)), display1, open, open, open);
	mux : mux21 port map(S0, S1, s2, s3, s4, choice, price);
	accumulator : accumulator8 port map (clk, nRST_acc, C, V, balance);
	comparator : comparator8 port map (balance, price_reg, balance_greater, balance_equal, balance_lower);
	subtractor : subtractor8 port map (balance, price_reg, coins_to_return);

end rtl;

