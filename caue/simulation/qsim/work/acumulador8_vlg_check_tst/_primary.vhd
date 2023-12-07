library verilog;
use verilog.vl_types.all;
entity acumulador8_vlg_check_tst is
    port(
        dados_saida     : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end acumulador8_vlg_check_tst;
