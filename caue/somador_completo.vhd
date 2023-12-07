LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

ENTITY somador_completo IS
  PORT(
    a : IN STD_LOGIC;
    b : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    soma : OUT STD_LOGIC;
    c_out : OUT STD_LOGIC);
END somador_completo;

ARCHITECTURE model of somador_completo IS
BEGIN
 soma <= a XOR b XOR c_in;
 c_out <= (a AND b) OR (c_in AND (a XOR b));
END model;
