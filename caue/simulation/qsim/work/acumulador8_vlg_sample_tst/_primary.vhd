library verilog;
use verilog.vl_types.all;
entity acumulador8_vlg_sample_tst is
    port(
        C               : in     vl_logic;
        clock           : in     vl_logic;
        dados_entrada   : in     vl_logic_vector(7 downto 0);
        reset_acumulador: in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end acumulador8_vlg_sample_tst;
