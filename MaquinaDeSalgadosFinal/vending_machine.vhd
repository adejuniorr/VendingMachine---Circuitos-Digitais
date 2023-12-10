library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;
use ieee.numeric_std.all;

entity vending_machine is
	port(
		nRST : in std_logic;  --negative reset
		clk : in std_logic;
		C : in std_logic; --from coin sensor: becomes 1 when a coin is detected.
		V : in std_logic_vector(8 downto 0); --received coin's value in cents from coin sensor.
		--S0 : in std_logic_vector(7 downto 0); --price of choice 1, defined by vending machin owner.
		--S1 : in std_logic_vector(7 downto 0); --price of choice 2, defined by vending machin owner.
		--S2 : in std_logic_vector(7 downto 0); --price of choice 3, defined by vending machin owner.
		--S3 : in std_logic_vector(7 downto 0); --price of choice 4, defined by vending machin owner.
		--S4 : in std_logic_vector(7 downto 0); --price of choice 5, defined by vending machin owner.
		choice : in std_logic_vector(2 downto 0); --choice product
		P : out std_logic_vector(8 downto 0); --Acumulated coin display
		E : out std_logic_vector(8 downto 0); --return change
		D : out std_logic_vector(2 downto 0); --food dispensation
		ESTQ : out std_logic_vector(8 downto 0) --aviso de falta de estoque [!]
		);
end vending_machine;

architecture rtl of vending_machine is
  constant S0 : std_logic_vector(8 downto 0) := "010010110"; -- Preço da escolha 1 11111010
  constant S1 : std_logic_vector(8 downto 0) := "010010110"; -- Preço da escolha 2 10010110
  constant S2 : std_logic_vector(8 downto 0) := "000000000"; -- Exemplo para a escolha 3
  constant S3 : std_logic_vector(8 downto 0) := "000000000"; -- Exemplo para a escolha 4
  constant S4 : std_logic_vector(8 downto 0) := "000000000"; -- Exemplo para a escolha 5

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

type FSMTYPE is (INIT_STATE, Coin_Reception, soda_dispensation);

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

begin
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

	soda_dispensation_proc: process(clk)
	begin
		if (CLK'event and CLK = '1') then
			if (dispensation_EN = '1') then
				if(choice_reg = "001") then
					if stock_S0_reg > 0 then	
						D <= "001";	--S0
						stock_S0_reg <= stock_S0_reg - 1;
					else 
						--D <= "111"; -- sem estoque
					end if;	
				elsif(choice_reg = "010") then 
					D <= "010";	--S1
				elsif(choice_reg = "011") then 
					D <= "011";	--S2
				elsif(choice_reg = "100") then 
					D <= "100";	--S3
				elsif(choice_reg = "101") then 
					D <= "101";	--S4
				end if;
			else
				D <= "000";
			end if;
		end if;
	end process; --soda_dispensation_Proc;

	next_state : process( CSTATE, balance, C, balance_equal, balance_greater, coins_to_return)
    begin
        NSTATE <= CSTATE;
		nRST_acc <= '1';
        price_choice_reg_EN <= '0';
		dispensation_EN <= '0';
		p <= (others => '0');
		E <= (others => '0');
		ESTQ <= (others => '0');

        case( CSTATE ) is
            when INIT_STATE =>
				nRST_acc <= '0';
				price_choice_reg_EN <= '1';
				E <= balance;
				
                -- Check product stock before allowing coin insertion
                case choice_reg is
                    when "001" =>
                        if stock_S0_reg <= 0 then
                            -- Out of stock for S0, stay in INIT_STATE
                            ESTQ <= "000000111";
                            NSTATE <= INIT_STATE;
                        end if;
                    when "010" =>
                        if stock_S1_reg <= 0 then
                            -- Out of stock for S1, stay in INIT_STATE
                            ESTQ <= "00000111";
                            NSTATE <= INIT_STATE;
                        end if;
                    -- Repeat for other choices
                    when others =>
                        null;
                end case;

                if C = '1' and (stock_S0_reg > 0 or stock_S1_reg > 0) then
                    nRST_acc <= '1';
                    NSTATE <= Coin_Reception;
                end if;
					 
					 
					 
					 
      
    
            when Coin_Reception =>
				P <= balance;
				if V /= "000011001" and V /= "000110010" and V /= "001100100" then
					E <= V;
				end if;
			
				
                if (balance_equal = '1' or balance_greater = '1') then
                    NSTATE <= soda_dispensation ;
                end if ;
            
            when soda_dispensation =>
				dispensation_EN <= '1';
				E <= coins_to_return;
				nRST_acc <= '0';
                NSTATE <= INIT_STATE;
            when others =>
        end case ;
    end process ; -- next_state

	mux : mux21 port map(S0, S1, s2, s3, s4, choice, price);
	accumulator : accumulator8 port map (clk, nRST_acc, C, V, balance);
	comparator : comparator8 port map (balance, price_reg, balance_greater, balance_equal, balance_lower);
	subtractor : subtractor8 port map (balance, price_reg, coins_to_return);

end rtl;

