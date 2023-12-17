library verilog;
use verilog.vl_types.all;
entity vending_machine is
    port(
        nRST            : in     vl_logic;
        clk             : in     vl_logic;
        C               : in     vl_logic;
        V_input         : in     vl_logic_vector(2 downto 0);
        choice          : in     vl_logic_vector(2 downto 0);
        cancel_purchase : in     vl_logic;
        dispense_signal : in     vl_logic;
        coin_confirm_signal: in     vl_logic;
        hexDisplay_choice: out    vl_logic_vector(6 downto 0);
        hexDisplay_centena: out    vl_logic_vector(6 downto 0);
        hexDisplay_dezena: out    vl_logic_vector(6 downto 0);
        hexDisplay_unidade: out    vl_logic_vector(6 downto 0);
        P               : out    vl_logic_vector(8 downto 0);
        E               : out    vl_logic_vector(8 downto 0);
        D1              : out    vl_logic_vector(2 downto 0);
        D2              : out    vl_logic_vector(2 downto 0);
        D3              : out    vl_logic_vector(2 downto 0);
        D4              : out    vl_logic_vector(2 downto 0);
        D5              : out    vl_logic_vector(2 downto 0);
        ESTQ1           : out    vl_logic_vector(8 downto 0);
        ESTQ2           : out    vl_logic_vector(8 downto 0);
        ESTQ3           : out    vl_logic_vector(8 downto 0);
        ESTQ4           : out    vl_logic_vector(8 downto 0);
        ESTQ5           : out    vl_logic_vector(8 downto 0)
    );
end vending_machine;
