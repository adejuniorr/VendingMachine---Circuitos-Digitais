library verilog;
use verilog.vl_types.all;
entity vending_machine_vlg_check_tst is
    port(
        D               : in     vl_logic_vector(2 downto 0);
        display_dinheiro_centena: in     vl_logic_vector(6 downto 0);
        display_dinheiro_dezena: in     vl_logic_vector(6 downto 0);
        display_dinheiro_unidade: in     vl_logic_vector(6 downto 0);
        display_salgado : in     vl_logic_vector(6 downto 0);
        E               : in     vl_logic_vector(8 downto 0);
        ESTQ            : in     vl_logic_vector(8 downto 0);
        P               : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end vending_machine_vlg_check_tst;
