library verilog;
use verilog.vl_types.all;
entity acumulador8 is
    port(
        clock           : in     vl_logic;
        reset_acumulador: in     vl_logic;
        C               : in     vl_logic;
        dados_entrada   : in     vl_logic_vector(7 downto 0);
        dados_saida     : out    vl_logic_vector(7 downto 0)
    );
end acumulador8;
