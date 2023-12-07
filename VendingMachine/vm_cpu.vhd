library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vm_cpu is
	port(
		clk			: in std_logic;
		coin25		: in std_logic;
		coin50		: in std_logic;
		coin01		: in std_logic;
		reset			: in std_logic;
		buy			: in std_logic;
		price			: in std_logic_vector(5 downto 0);
		sum			: out std_logic_vector(6 downto 0);
		food_out		: out std_logic;
		not_en_mon	: out std_logic;
		new_value	: out std_logic
	);
end vm_cpu;

architecture bhv of vm_cpu is
	-- ??? ----------------------------------------------------------------------
	type state_type is (default_state, coin25_state, coin50_state, coin01_state, wait_coin_state, food_out_state, calc_state, buy_state, not_en_mon_state);
	-- ??? ----------------------------------------------------------------------
	signal current_state, next_state	: state_type;
	
	signal add_mux											: std_logic_vector(2 downto 0);
	signal sum_enable, output_enable, negative	: std_logic;
	signal price_val										: unsigned(5 downto 0);
	signal sum_val, add_val 							: unsigned(6 downto 0);
	signal sum_val_temp, sum_val_new 				: signed(7 downto 0);

begin
	price_val <= unsigned(price);
	sum <= std_logic_vector(sum_val);
	
	process(current_state,coin25,coin50,coin01,buy,sum_val_new)
	begin
		next_state <= current_state;
		
		case current_state is
			when default_state =>
				if coin25 = '1' then
					next_state <= coin25_state;
				elsif coin50 = '1' then
					next_state <= coin50_state;
				elsif coin01 = '1' then
					next_state <= coin01_state;
				elsif buy = '1' then
					next_state <= buy_state;
				end if;
			when coin25_state => next_state <= wait_coin_state;
			when coin50_state => next_state <= wait_coin_state;
			when coin01_state => next_state <= wait_coin_state;
			when buy_state => next_state <= calc_state;
			when calc_state =>
				if sum_val_new < 0 then -- para valor negativo:
					next_state <= not_en_mon_state; -- significa que nao ha dinheiro suficiente
				else
					next_state <= food_out_state;
				end if;
			when wait_coin_state =>
				if coin25 = '0' and coin50 = '0' and coin01 = '0' then
					next_state <= default_state;
				end if;
			when not_en_mon_state =>
				if buy = '0' then
					next_state <= default_state;
				end if;
			when food_out_state =>
				if buy = '0' then
					next_state <= default_state;
				end if;
			when others => next_state <= default_state;
		end case;
	end process;
	
	process(current_state,sum_val,price_val)
	begin
		add_mux <= "000";
		not_en_mon <= '0';
		food_out <= '0';
		output_enable <= '0';
		sum_enable <= '0';
		negative <= '0';
		
		case current_state is
			when coin25_state =>
				add_mux <= "001";--???
				output_enable <= '1';
			when coin50_state =>
				add_mux <= "010";--???
				output_enable <= '1';
			when coin01_state =>
				add_mux <= "011";--???
				output_enable <= '1';
			when wait_coin_state => sum_enable <= '1';
			
			when buy_state =>
				add_mux <= "101";--???
				output_enable <= '1';
				negative <= '1';
			when not_en_mon_state => not_en_mon <= '1';
			when food_out_state =>
				sum_enable <= '1';
				food_out <= '1';
			when others =>
		end case;
	end process;
	
	process(add_mux,price_val)
	begin
		if add_mux = "001" then --R$ 0.25
			add_val <= "0011001"; -- 25
			
		elsif add_mux = "010" then --R$ 0.50
			add_val <= "0110010"; -- 50
			
		elsif add_mux = "011" then -- R$ 1.00
			add_val <="1100100"; -- 100
			
		elsif add_mux = "101" then -- buy_state
			add_val <= '0' & price_val; --???
		else
			add_val <= "0000000";
		end if;
	end process;
	
	
	--
	--
	-- Somador/Subtrator 
	--------------------
	process(add_val,sum_val,negative)
	begin
		if negative = '1' then
			sum_val_temp <= signed('0' & sum_val) - signed('0' & add_val);
		else
			if sum_val + add_val > 99 then
				sum_val_temp <= "01100011"; --99
			else
				sum_val_temp <= signed('0' & sum_val) + signed('0' & add_val);
			end if;
		end if;
	end process;
	
	process(clk, reset)
	begin
		if reset = '1' then
			current_state <= default_state;
			sum_val <= (others=>'0');
		elsif rising_edge(clk) then
			current_state <= next_state;
			if output_enable = '1' then
				sum_val_new <= sum_val_temp;
			end if;
			
			-- If this is high we will update the coin sum after we have made sure it is valid
			if sum_enable = '1' then
				sum_val <= unsigned(sum_val_new(6 downto 0));
				new_value <= '1'; -- Bit for the serial interface - used to indicate that a new value has been set
			else
				new_value <= '0';
			end if;
		end if;
	end process;
end bhv;