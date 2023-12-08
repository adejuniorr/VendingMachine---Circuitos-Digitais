library verilog;
use verilog.vl_types.all;
entity vending_machine_vlg_sample_tst is
    port(
        C               : in     vl_logic;
        choice          : in     vl_logic_vector(2 downto 0);
        clk             : in     vl_logic;
        nRST            : in     vl_logic;
        S0              : in     vl_logic_vector(7 downto 0);
        S1              : in     vl_logic_vector(7 downto 0);
        S2              : in     vl_logic_vector(7 downto 0);
        S3              : in     vl_logic_vector(7 downto 0);
        S4              : in     vl_logic_vector(7 downto 0);
        V               : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end vending_machine_vlg_sample_tst;
