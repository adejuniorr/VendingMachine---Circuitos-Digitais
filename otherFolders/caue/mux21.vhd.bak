-- Engineer: Mohammad Niknam
-- Project Name: vending_machine_processor
-- Module Name:  mux21
library ieee;
USE ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity mux21 is
	port(
		A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		C : in std_logic_vector(7 downto 0);
		D : in std_logic_vector(7 downto 0);
		E : in std_logic_vector(7 downto 0);
		s : in std_logic_vector(2 downto 0);
		output : out std_logic_vector(7 downto 0)
		);
end mux21;

architecture model of mux21 is 
begin
	output <= A when (s = "001") else
				 B when (s = "010") else
				 C when (s = "011") else
				 D when (s = "100") else
				 E when (s = "101");
end model;