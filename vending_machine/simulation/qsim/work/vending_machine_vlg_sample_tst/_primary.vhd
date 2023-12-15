library verilog;
use verilog.vl_types.all;
entity vending_machine_vlg_sample_tst is
    port(
        C               : in     vl_logic;
        cancel_purchase : in     vl_logic;
        choice          : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        confirmar_moeda : in     vl_logic;
        confirmar_salgado: in     vl_logic;
        nRST            : in     vl_logic;
        V_input         : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end vending_machine_vlg_sample_tst;
