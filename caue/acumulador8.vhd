library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity acumulador8 is
    port(
        clock : in std_logic;
        reset_acumulador : in std_logic;
        C : in std_logic;    -- torna-se 1 quando uma moeda é detectada.
        dados_entrada : in std_logic_vector(7 downto 0);
        dados_saida : out std_logic_vector(7 downto 0)
    );
end acumulador8;

architecture rtl of acumulador8 is
    component somador8 IS
        port(
            a : in std_logic_vector(7 downto 0);
            b : in std_logic_vector(7 downto 0);
            c_in: in std_logic;
            s: out std_logic_vector(7 downto 0);
            c_out: out std_logic
        );
    end component;

    signal temp1 : std_logic_vector(7 downto 0);
    signal temp2 : std_logic_vector(7 downto 0);
    signal c_in : std_logic;
    signal c_out : std_logic;

begin
    c_in <= '0';
    
    somador : somador8 port map (dados_entrada, temp2, c_in, temp1, c_out);

    reg: process(clock)
    begin
        if (clock'event and clock = '1') then
            if reset_acumulador = '0' then
                temp2 <= (others => '0');
            elsif (C = '1') then
                temp2 <= temp1;
            end if;
        end if;
    end process reg;

    dados_saida <= temp2;
end rtl;
