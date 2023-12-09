library verilog;
use verilog.vl_types.all;
entity vending_machine is
    port(
        nRST            : in     vl_logic;
        clk             : in     vl_logic;
        C               : in     vl_logic;
        V               : in     vl_logic_vector(8 downto 0);
        choice          : in     vl_logic_vector(2 downto 0);
        P               : out    vl_logic_vector(8 downto 0);
        E               : out    vl_logic_vector(8 downto 0);
        D               : out    vl_logic_vector(2 downto 0);
        ESTQ            : out    vl_logic_vector(8 downto 0)
    );
end vending_machine;
