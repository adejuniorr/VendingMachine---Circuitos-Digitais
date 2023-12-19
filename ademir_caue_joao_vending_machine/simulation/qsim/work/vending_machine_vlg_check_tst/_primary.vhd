library verilog;
use verilog.vl_types.all;
entity vending_machine_vlg_check_tst is
    port(
        D1              : in     vl_logic_vector(2 downto 0);
        D2              : in     vl_logic_vector(2 downto 0);
        D3              : in     vl_logic_vector(2 downto 0);
        D4              : in     vl_logic_vector(2 downto 0);
        D5              : in     vl_logic_vector(2 downto 0);
        E               : in     vl_logic_vector(8 downto 0);
        ESTQ1           : in     vl_logic_vector(8 downto 0);
        ESTQ2           : in     vl_logic_vector(8 downto 0);
        ESTQ3           : in     vl_logic_vector(8 downto 0);
        ESTQ4           : in     vl_logic_vector(8 downto 0);
        ESTQ5           : in     vl_logic_vector(8 downto 0);
        hexDisplay_centena: in     vl_logic_vector(6 downto 0);
        hexDisplay_choice: in     vl_logic_vector(6 downto 0);
        hexDisplay_dezena: in     vl_logic_vector(6 downto 0);
        hexDisplay_unidade: in     vl_logic_vector(6 downto 0);
        P               : in     vl_logic_vector(8 downto 0);
        sampler_rx      : in     vl_logic
    );
end vending_machine_vlg_check_tst;
