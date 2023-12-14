-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "12/08/2023 11:41:55"

-- 
-- Device: Altera EP4CGX22CF19C6 Package FBGA324
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	vending_machine IS
    PORT (
	nRST : IN std_logic;
	clk : IN std_logic;
	C : IN std_logic;
	V : IN std_logic_vector(7 DOWNTO 0);
	S0 : IN std_logic_vector(7 DOWNTO 0);
	S1 : IN std_logic_vector(7 DOWNTO 0);
	S2 : IN std_logic_vector(7 DOWNTO 0);
	S3 : IN std_logic_vector(7 DOWNTO 0);
	S4 : IN std_logic_vector(7 DOWNTO 0);
	choice : IN std_logic_vector(2 DOWNTO 0);
	P : OUT std_logic_vector(7 DOWNTO 0);
	E : OUT std_logic_vector(7 DOWNTO 0);
	D : OUT std_logic_vector(2 DOWNTO 0);
	ESTQ : OUT std_logic_vector(7 DOWNTO 0)
	);
END vending_machine;

-- Design Ports Information
-- P[0]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P[1]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P[2]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P[3]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P[4]	=>  Location: PIN_U16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P[5]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P[6]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- P[7]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[0]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[1]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[2]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[3]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[4]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[5]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[6]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[7]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[0]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[1]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- D[2]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[0]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[1]	=>  Location: PIN_U18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[2]	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[3]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[4]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[5]	=>  Location: PIN_V5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[6]	=>  Location: PIN_U9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ESTQ[7]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[0]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[7]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[4]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[6]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[2]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[3]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[5]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- V[1]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- nRST	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- choice[0]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- choice[1]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- choice[2]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[0]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[0]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[0]	=>  Location: PIN_P18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[0]	=>  Location: PIN_R18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[0]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[1]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[1]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[1]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[1]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[1]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[2]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[2]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[2]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[2]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[2]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[3]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[3]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[3]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[3]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[3]	=>  Location: PIN_T16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[4]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[4]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[4]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[4]	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[4]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[5]	=>  Location: PIN_T18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[5]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[5]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[5]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[5]	=>  Location: PIN_K18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[6]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[6]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[6]	=>  Location: PIN_H18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[6]	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[6]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S4[7]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1[7]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S3[7]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0[7]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S2[7]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF vending_machine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_nRST : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_C : std_logic;
SIGNAL ww_V : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_S0 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_S1 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_S2 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_S3 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_S4 : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_choice : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_P : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_E : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_D : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ESTQ : std_logic_vector(7 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \mux|output[7]~13clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \stock_S0_reg[3]~38_combout\ : std_logic;
SIGNAL \stock_S0_reg[15]~62_combout\ : std_logic;
SIGNAL \stock_S0_reg[19]~70_combout\ : std_logic;
SIGNAL \stock_S0_reg[21]~74_combout\ : std_logic;
SIGNAL \stock_S0_reg[22]~76_combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit4|sum~0_combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit4|c_out~1_combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit5|c_out~combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~6_combout\ : std_logic;
SIGNAL \accumulator|temp2[2]~3_combout\ : std_logic;
SIGNAL \accumulator|adder|bit1|sum~0_combout\ : std_logic;
SIGNAL \accumulator|adder|bit3|c_out~1_combout\ : std_logic;
SIGNAL \accumulator|adder|bit4|sum~0_combout\ : std_logic;
SIGNAL \stock_S0_reg[0]~97_combout\ : std_logic;
SIGNAL \mux|output[2]~17_combout\ : std_logic;
SIGNAL \mux|output[2]~18_combout\ : std_logic;
SIGNAL \mux|output[4]~22_combout\ : std_logic;
SIGNAL \mux|output[4]~23_combout\ : std_logic;
SIGNAL \mux|output[5]~25_combout\ : std_logic;
SIGNAL \mux|output[5]~26_combout\ : std_logic;
SIGNAL \mux|output[5]~27_combout\ : std_logic;
SIGNAL \mux|output[2]~36_combout\ : std_logic;
SIGNAL \mux|output[2]~37_combout\ : std_logic;
SIGNAL \nRST~input_o\ : std_logic;
SIGNAL \S1[0]~input_o\ : std_logic;
SIGNAL \S2[0]~input_o\ : std_logic;
SIGNAL \S4[2]~input_o\ : std_logic;
SIGNAL \S3[2]~input_o\ : std_logic;
SIGNAL \S1[2]~input_o\ : std_logic;
SIGNAL \S0[2]~input_o\ : std_logic;
SIGNAL \S2[2]~input_o\ : std_logic;
SIGNAL \S0[3]~input_o\ : std_logic;
SIGNAL \S2[3]~input_o\ : std_logic;
SIGNAL \S3[4]~input_o\ : std_logic;
SIGNAL \S1[4]~input_o\ : std_logic;
SIGNAL \S0[4]~input_o\ : std_logic;
SIGNAL \S2[4]~input_o\ : std_logic;
SIGNAL \S4[5]~input_o\ : std_logic;
SIGNAL \S1[5]~input_o\ : std_logic;
SIGNAL \S3[5]~input_o\ : std_logic;
SIGNAL \S0[5]~input_o\ : std_logic;
SIGNAL \S2[5]~input_o\ : std_logic;
SIGNAL \S1[7]~input_o\ : std_logic;
SIGNAL \S3[7]~input_o\ : std_logic;
SIGNAL \P[0]~output_o\ : std_logic;
SIGNAL \P[1]~output_o\ : std_logic;
SIGNAL \P[2]~output_o\ : std_logic;
SIGNAL \P[3]~output_o\ : std_logic;
SIGNAL \P[4]~output_o\ : std_logic;
SIGNAL \P[5]~output_o\ : std_logic;
SIGNAL \P[6]~output_o\ : std_logic;
SIGNAL \P[7]~output_o\ : std_logic;
SIGNAL \E[0]~output_o\ : std_logic;
SIGNAL \E[1]~output_o\ : std_logic;
SIGNAL \E[2]~output_o\ : std_logic;
SIGNAL \E[3]~output_o\ : std_logic;
SIGNAL \E[4]~output_o\ : std_logic;
SIGNAL \E[5]~output_o\ : std_logic;
SIGNAL \E[6]~output_o\ : std_logic;
SIGNAL \E[7]~output_o\ : std_logic;
SIGNAL \D[0]~output_o\ : std_logic;
SIGNAL \D[1]~output_o\ : std_logic;
SIGNAL \D[2]~output_o\ : std_logic;
SIGNAL \ESTQ[0]~output_o\ : std_logic;
SIGNAL \ESTQ[1]~output_o\ : std_logic;
SIGNAL \ESTQ[2]~output_o\ : std_logic;
SIGNAL \ESTQ[3]~output_o\ : std_logic;
SIGNAL \ESTQ[4]~output_o\ : std_logic;
SIGNAL \ESTQ[5]~output_o\ : std_logic;
SIGNAL \ESTQ[6]~output_o\ : std_logic;
SIGNAL \ESTQ[7]~output_o\ : std_logic;
SIGNAL \V[0]~input_o\ : std_logic;
SIGNAL \C~input_o\ : std_logic;
SIGNAL \choice[1]~input_o\ : std_logic;
SIGNAL \choice[2]~input_o\ : std_logic;
SIGNAL \choice[0]~input_o\ : std_logic;
SIGNAL \mux|output[7]~13_combout\ : std_logic;
SIGNAL \mux|output[7]~13clkctrl_outclk\ : std_logic;
SIGNAL \S4[7]~input_o\ : std_logic;
SIGNAL \mux|output[0]~11_combout\ : std_logic;
SIGNAL \mux|output[0]~9_combout\ : std_logic;
SIGNAL \S2[7]~input_o\ : std_logic;
SIGNAL \S0[7]~input_o\ : std_logic;
SIGNAL \mux|output[0]~8_combout\ : std_logic;
SIGNAL \mux|output[7]~31_combout\ : std_logic;
SIGNAL \mux|output[7]~32_combout\ : std_logic;
SIGNAL \mux|output[7]~33_combout\ : std_logic;
SIGNAL \V[6]~input_o\ : std_logic;
SIGNAL \V[5]~input_o\ : std_logic;
SIGNAL \V[3]~input_o\ : std_logic;
SIGNAL \V[1]~input_o\ : std_logic;
SIGNAL \accumulator|temp2~13_combout\ : std_logic;
SIGNAL \V[4]~input_o\ : std_logic;
SIGNAL \accumulator|temp2[2]~4_combout\ : std_logic;
SIGNAL \accumulator|temp2[2]~5_combout\ : std_logic;
SIGNAL \V[7]~input_o\ : std_logic;
SIGNAL \accumulator|temp2[2]~6_combout\ : std_logic;
SIGNAL \accumulator|adder|bit1|c_out~0_combout\ : std_logic;
SIGNAL \V[2]~input_o\ : std_logic;
SIGNAL \accumulator|temp2~7_combout\ : std_logic;
SIGNAL \accumulator|adder|bit2|c_out~0_combout\ : std_logic;
SIGNAL \accumulator|temp2~8_combout\ : std_logic;
SIGNAL \accumulator|adder|bit3|c_out~0_combout\ : std_logic;
SIGNAL \accumulator|adder|bit3|c_out~2_combout\ : std_logic;
SIGNAL \accumulator|temp2~9_combout\ : std_logic;
SIGNAL \accumulator|adder|bit4|c_out~0_combout\ : std_logic;
SIGNAL \accumulator|temp2~10_combout\ : std_logic;
SIGNAL \accumulator|adder|bit5|c_out~0_combout\ : std_logic;
SIGNAL \accumulator|adder|bit6|c_out~0_combout\ : std_logic;
SIGNAL \accumulator|temp2~12_combout\ : std_logic;
SIGNAL \accumulator|temp2~11_combout\ : std_logic;
SIGNAL \S4[4]~input_o\ : std_logic;
SIGNAL \mux|output[4]~24_combout\ : std_logic;
SIGNAL \S1[3]~input_o\ : std_logic;
SIGNAL \S3[3]~input_o\ : std_logic;
SIGNAL \mux|output[3]~19_combout\ : std_logic;
SIGNAL \mux|output[3]~20_combout\ : std_logic;
SIGNAL \S4[3]~input_o\ : std_logic;
SIGNAL \mux|output[3]~21_combout\ : std_logic;
SIGNAL \S4[0]~input_o\ : std_logic;
SIGNAL \S3[0]~input_o\ : std_logic;
SIGNAL \S0[0]~input_o\ : std_logic;
SIGNAL \mux|output[0]~34_combout\ : std_logic;
SIGNAL \mux|output[0]~35_combout\ : std_logic;
SIGNAL \mux|output[0]~10_combout\ : std_logic;
SIGNAL \mux|output[0]~12_combout\ : std_logic;
SIGNAL \S4[1]~input_o\ : std_logic;
SIGNAL \S2[1]~input_o\ : std_logic;
SIGNAL \S0[1]~input_o\ : std_logic;
SIGNAL \S3[1]~input_o\ : std_logic;
SIGNAL \mux|output[1]~14_combout\ : std_logic;
SIGNAL \S1[1]~input_o\ : std_logic;
SIGNAL \mux|output[1]~15_combout\ : std_logic;
SIGNAL \mux|output[1]~16_combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit1|c_out~combout\ : std_logic;
SIGNAL \next_state~8_combout\ : std_logic;
SIGNAL \next_state~9_combout\ : std_logic;
SIGNAL \next_state~13_combout\ : std_logic;
SIGNAL \next_state~10_combout\ : std_logic;
SIGNAL \next_state~11_combout\ : std_logic;
SIGNAL \next_state~12_combout\ : std_logic;
SIGNAL \CSTATE~6_combout\ : std_logic;
SIGNAL \CSTATE.soda_dispensation~q\ : std_logic;
SIGNAL \CSTATE~7_combout\ : std_logic;
SIGNAL \CSTATE.INIT_STATE~q\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \CSTATE~5_combout\ : std_logic;
SIGNAL \CSTATE.Coin_Reception~q\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \accumulator|temp2~2_combout\ : std_logic;
SIGNAL \P~0_combout\ : std_logic;
SIGNAL \P~1_combout\ : std_logic;
SIGNAL \P~2_combout\ : std_logic;
SIGNAL \P~3_combout\ : std_logic;
SIGNAL \P~4_combout\ : std_logic;
SIGNAL \P~5_combout\ : std_logic;
SIGNAL \P~6_combout\ : std_logic;
SIGNAL \P~7_combout\ : std_logic;
SIGNAL \Selector8~0_combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit1|sum~combout\ : std_logic;
SIGNAL \Selector7~0_combout\ : std_logic;
SIGNAL \Selector6~0_combout\ : std_logic;
SIGNAL \Selector6~1_combout\ : std_logic;
SIGNAL \Selector5~0_combout\ : std_logic;
SIGNAL \Selector5~1_combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit2|c_out~combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit4|sum~combout\ : std_logic;
SIGNAL \Selector4~0_combout\ : std_logic;
SIGNAL \subtractor|subtractor|bit4|c_out~0_combout\ : std_logic;
SIGNAL \Selector3~3_combout\ : std_logic;
SIGNAL \Selector3~2_combout\ : std_logic;
SIGNAL \S1[6]~input_o\ : std_logic;
SIGNAL \S0[6]~input_o\ : std_logic;
SIGNAL \mux|output[6]~28_combout\ : std_logic;
SIGNAL \S3[6]~input_o\ : std_logic;
SIGNAL \S2[6]~input_o\ : std_logic;
SIGNAL \mux|output[6]~29_combout\ : std_logic;
SIGNAL \S4[6]~input_o\ : std_logic;
SIGNAL \mux|output[6]~30_combout\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \Selector1~0_combout\ : std_logic;
SIGNAL \Selector1~1_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \D~0_combout\ : std_logic;
SIGNAL \stock_S0_reg[1]~33_cout\ : std_logic;
SIGNAL \stock_S0_reg[1]~34_combout\ : std_logic;
SIGNAL \LessThan1~5_combout\ : std_logic;
SIGNAL \stock_S0_reg[29]~90_combout\ : std_logic;
SIGNAL \stock_S0_reg[27]~86_combout\ : std_logic;
SIGNAL \LessThan1~7_combout\ : std_logic;
SIGNAL \LessThan1~8_combout\ : std_logic;
SIGNAL \stock_S0_reg[13]~58_combout\ : std_logic;
SIGNAL \LessThan1~3_combout\ : std_logic;
SIGNAL \stock_S0_reg[11]~54_combout\ : std_logic;
SIGNAL \LessThan1~2_combout\ : std_logic;
SIGNAL \stock_S0_reg[5]~42_combout\ : std_logic;
SIGNAL \stock_S0_reg[6]~44_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \LessThan1~4_combout\ : std_logic;
SIGNAL \LessThan1~9_combout\ : std_logic;
SIGNAL \stock_S0_reg[31]~96_combout\ : std_logic;
SIGNAL \stock_S0_reg[1]~35\ : std_logic;
SIGNAL \stock_S0_reg[2]~36_combout\ : std_logic;
SIGNAL \stock_S0_reg[2]~37\ : std_logic;
SIGNAL \stock_S0_reg[3]~39\ : std_logic;
SIGNAL \stock_S0_reg[4]~40_combout\ : std_logic;
SIGNAL \stock_S0_reg[4]~41\ : std_logic;
SIGNAL \stock_S0_reg[5]~43\ : std_logic;
SIGNAL \stock_S0_reg[6]~45\ : std_logic;
SIGNAL \stock_S0_reg[7]~46_combout\ : std_logic;
SIGNAL \stock_S0_reg[7]~47\ : std_logic;
SIGNAL \stock_S0_reg[8]~48_combout\ : std_logic;
SIGNAL \stock_S0_reg[8]~49\ : std_logic;
SIGNAL \stock_S0_reg[9]~50_combout\ : std_logic;
SIGNAL \stock_S0_reg[9]~51\ : std_logic;
SIGNAL \stock_S0_reg[10]~52_combout\ : std_logic;
SIGNAL \stock_S0_reg[10]~53\ : std_logic;
SIGNAL \stock_S0_reg[11]~55\ : std_logic;
SIGNAL \stock_S0_reg[12]~56_combout\ : std_logic;
SIGNAL \stock_S0_reg[12]~57\ : std_logic;
SIGNAL \stock_S0_reg[13]~59\ : std_logic;
SIGNAL \stock_S0_reg[14]~60_combout\ : std_logic;
SIGNAL \stock_S0_reg[14]~61\ : std_logic;
SIGNAL \stock_S0_reg[15]~63\ : std_logic;
SIGNAL \stock_S0_reg[16]~64_combout\ : std_logic;
SIGNAL \stock_S0_reg[16]~65\ : std_logic;
SIGNAL \stock_S0_reg[17]~66_combout\ : std_logic;
SIGNAL \stock_S0_reg[17]~67\ : std_logic;
SIGNAL \stock_S0_reg[18]~68_combout\ : std_logic;
SIGNAL \stock_S0_reg[18]~69\ : std_logic;
SIGNAL \stock_S0_reg[19]~71\ : std_logic;
SIGNAL \stock_S0_reg[20]~72_combout\ : std_logic;
SIGNAL \stock_S0_reg[20]~73\ : std_logic;
SIGNAL \stock_S0_reg[21]~75\ : std_logic;
SIGNAL \stock_S0_reg[22]~77\ : std_logic;
SIGNAL \stock_S0_reg[23]~78_combout\ : std_logic;
SIGNAL \stock_S0_reg[23]~79\ : std_logic;
SIGNAL \stock_S0_reg[24]~80_combout\ : std_logic;
SIGNAL \stock_S0_reg[24]~81\ : std_logic;
SIGNAL \stock_S0_reg[25]~82_combout\ : std_logic;
SIGNAL \stock_S0_reg[25]~83\ : std_logic;
SIGNAL \stock_S0_reg[26]~84_combout\ : std_logic;
SIGNAL \stock_S0_reg[26]~85\ : std_logic;
SIGNAL \stock_S0_reg[27]~87\ : std_logic;
SIGNAL \stock_S0_reg[28]~88_combout\ : std_logic;
SIGNAL \stock_S0_reg[28]~89\ : std_logic;
SIGNAL \stock_S0_reg[29]~91\ : std_logic;
SIGNAL \stock_S0_reg[30]~92_combout\ : std_logic;
SIGNAL \stock_S0_reg[30]~93\ : std_logic;
SIGNAL \stock_S0_reg[31]~94_combout\ : std_logic;
SIGNAL \LessThan1~10_combout\ : std_logic;
SIGNAL \D[2]~1_combout\ : std_logic;
SIGNAL \D[2]~2_combout\ : std_logic;
SIGNAL \D[0]~reg0_q\ : std_logic;
SIGNAL \choice_reg[1]~feeder_combout\ : std_logic;
SIGNAL \D~3_combout\ : std_logic;
SIGNAL \D[1]~reg0_q\ : std_logic;
SIGNAL \D~4_combout\ : std_logic;
SIGNAL \D[2]~reg0_q\ : std_logic;
SIGNAL \stock_S0_reg[31]~31_combout\ : std_logic;
SIGNAL \ESTQ~0_combout\ : std_logic;
SIGNAL price_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL choice_reg : std_logic_vector(2 DOWNTO 0);
SIGNAL \mux|output\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \accumulator|temp2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL stock_S0_reg : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_CSTATE.INIT_STATE~q\ : std_logic;
SIGNAL \ALT_INV_CSTATE.soda_dispensation~q\ : std_logic;

BEGIN

ww_nRST <= nRST;
ww_clk <= clk;
ww_C <= C;
ww_V <= V;
ww_S0 <= S0;
ww_S1 <= S1;
ww_S2 <= S2;
ww_S3 <= S3;
ww_S4 <= S4;
ww_choice <= choice;
P <= ww_P;
E <= ww_E;
D <= ww_D;
ESTQ <= ww_ESTQ;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\mux|output[7]~13clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \mux|output[7]~13_combout\);
\ALT_INV_CSTATE.INIT_STATE~q\ <= NOT \CSTATE.INIT_STATE~q\;
\ALT_INV_CSTATE.soda_dispensation~q\ <= NOT \CSTATE.soda_dispensation~q\;

-- Location: FF_X49_Y23_N7
\stock_S0_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[3]~38_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(3));

-- Location: FF_X49_Y23_N31
\stock_S0_reg[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[15]~62_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(15));

-- Location: FF_X49_Y22_N7
\stock_S0_reg[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[19]~70_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(19));

-- Location: FF_X49_Y22_N11
\stock_S0_reg[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[21]~74_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(21));

-- Location: FF_X49_Y22_N13
\stock_S0_reg[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[22]~76_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(22));

-- Location: LCCOMB_X49_Y23_N6
\stock_S0_reg[3]~38\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[3]~38_combout\ = (stock_S0_reg(3) & (\stock_S0_reg[2]~37\ & VCC)) # (!stock_S0_reg(3) & (!\stock_S0_reg[2]~37\))
-- \stock_S0_reg[3]~39\ = CARRY((!stock_S0_reg(3) & !\stock_S0_reg[2]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(3),
	datad => VCC,
	cin => \stock_S0_reg[2]~37\,
	combout => \stock_S0_reg[3]~38_combout\,
	cout => \stock_S0_reg[3]~39\);

-- Location: LCCOMB_X49_Y23_N30
\stock_S0_reg[15]~62\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[15]~62_combout\ = (stock_S0_reg(15) & (\stock_S0_reg[14]~61\ & VCC)) # (!stock_S0_reg(15) & (!\stock_S0_reg[14]~61\))
-- \stock_S0_reg[15]~63\ = CARRY((!stock_S0_reg(15) & !\stock_S0_reg[14]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(15),
	datad => VCC,
	cin => \stock_S0_reg[14]~61\,
	combout => \stock_S0_reg[15]~62_combout\,
	cout => \stock_S0_reg[15]~63\);

-- Location: LCCOMB_X49_Y22_N6
\stock_S0_reg[19]~70\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[19]~70_combout\ = (stock_S0_reg(19) & (\stock_S0_reg[18]~69\ & VCC)) # (!stock_S0_reg(19) & (!\stock_S0_reg[18]~69\))
-- \stock_S0_reg[19]~71\ = CARRY((!stock_S0_reg(19) & !\stock_S0_reg[18]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(19),
	datad => VCC,
	cin => \stock_S0_reg[18]~69\,
	combout => \stock_S0_reg[19]~70_combout\,
	cout => \stock_S0_reg[19]~71\);

-- Location: LCCOMB_X49_Y22_N10
\stock_S0_reg[21]~74\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[21]~74_combout\ = (stock_S0_reg(21) & (\stock_S0_reg[20]~73\ & VCC)) # (!stock_S0_reg(21) & (!\stock_S0_reg[20]~73\))
-- \stock_S0_reg[21]~75\ = CARRY((!stock_S0_reg(21) & !\stock_S0_reg[20]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(21),
	datad => VCC,
	cin => \stock_S0_reg[20]~73\,
	combout => \stock_S0_reg[21]~74_combout\,
	cout => \stock_S0_reg[21]~75\);

-- Location: LCCOMB_X49_Y22_N12
\stock_S0_reg[22]~76\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[22]~76_combout\ = (stock_S0_reg(22) & ((GND) # (!\stock_S0_reg[21]~75\))) # (!stock_S0_reg(22) & (\stock_S0_reg[21]~75\ $ (GND)))
-- \stock_S0_reg[22]~77\ = CARRY((stock_S0_reg(22)) # (!\stock_S0_reg[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(22),
	datad => VCC,
	cin => \stock_S0_reg[21]~75\,
	combout => \stock_S0_reg[22]~76_combout\,
	cout => \stock_S0_reg[22]~77\);

-- Location: LCCOMB_X50_Y23_N24
\subtractor|subtractor|bit4|sum~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit4|sum~0_combout\ = \accumulator|temp2\(4) $ (price_reg(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \accumulator|temp2\(4),
	datad => price_reg(4),
	combout => \subtractor|subtractor|bit4|sum~0_combout\);

-- Location: LCCOMB_X50_Y23_N16
\subtractor|subtractor|bit4|c_out~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit4|c_out~1_combout\ = (\accumulator|temp2\(4) & !price_reg(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \accumulator|temp2\(4),
	datad => price_reg(4),
	combout => \subtractor|subtractor|bit4|c_out~1_combout\);

-- Location: LCCOMB_X50_Y23_N12
\subtractor|subtractor|bit5|c_out\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit5|c_out~combout\ = (price_reg(5) & (\accumulator|temp2\(5) & ((\subtractor|subtractor|bit4|c_out~0_combout\) # (\subtractor|subtractor|bit4|c_out~1_combout\)))) # (!price_reg(5) & ((\subtractor|subtractor|bit4|c_out~0_combout\) # 
-- ((\accumulator|temp2\(5)) # (\subtractor|subtractor|bit4|c_out~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => price_reg(5),
	datab => \subtractor|subtractor|bit4|c_out~0_combout\,
	datac => \accumulator|temp2\(5),
	datad => \subtractor|subtractor|bit4|c_out~1_combout\,
	combout => \subtractor|subtractor|bit5|c_out~combout\);

-- Location: FF_X48_Y23_N9
\stock_S0_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[0]~97_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(0));

-- Location: LCCOMB_X48_Y23_N22
\LessThan1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!stock_S0_reg(2) & (stock_S0_reg(0) & (!stock_S0_reg(1) & !stock_S0_reg(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(2),
	datab => stock_S0_reg(0),
	datac => stock_S0_reg(1),
	datad => stock_S0_reg(3),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X48_Y22_N2
\LessThan1~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~6_combout\ = (!stock_S0_reg(21) & (!stock_S0_reg(20) & (!stock_S0_reg(22) & !stock_S0_reg(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(21),
	datab => stock_S0_reg(20),
	datac => stock_S0_reg(22),
	datad => stock_S0_reg(23),
	combout => \LessThan1~6_combout\);

-- Location: LCCOMB_X44_Y23_N6
\accumulator|temp2[2]~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2[2]~3_combout\ = (\C~input_o\ & ((\V[2]~input_o\ & (\V[6]~input_o\ & !\V[4]~input_o\)) # (!\V[2]~input_o\ & (!\V[6]~input_o\ & \V[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[2]~input_o\,
	datab => \V[6]~input_o\,
	datac => \V[4]~input_o\,
	datad => \C~input_o\,
	combout => \accumulator|temp2[2]~3_combout\);

-- Location: LCCOMB_X43_Y23_N12
\accumulator|adder|bit1|sum~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit1|sum~0_combout\ = \accumulator|temp2\(1) $ (\V[1]~input_o\ $ (((\V[0]~input_o\ & \accumulator|temp2\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[0]~input_o\,
	datab => \accumulator|temp2\(0),
	datac => \accumulator|temp2\(1),
	datad => \V[1]~input_o\,
	combout => \accumulator|adder|bit1|sum~0_combout\);

-- Location: LCCOMB_X42_Y23_N22
\accumulator|adder|bit3|c_out~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit3|c_out~1_combout\ = (\V[3]~input_o\) # (\accumulator|temp2\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \V[3]~input_o\,
	datad => \accumulator|temp2\(3),
	combout => \accumulator|adder|bit3|c_out~1_combout\);

-- Location: LCCOMB_X42_Y23_N30
\accumulator|adder|bit4|sum~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit4|sum~0_combout\ = \V[4]~input_o\ $ (\accumulator|temp2\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \V[4]~input_o\,
	datad => \accumulator|temp2\(4),
	combout => \accumulator|adder|bit4|sum~0_combout\);

-- Location: LCCOMB_X48_Y23_N8
\stock_S0_reg[0]~97\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[0]~97_combout\ = stock_S0_reg(0) $ (((\stock_S0_reg[31]~31_combout\ & (\CSTATE.soda_dispensation~q\ & !\LessThan1~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stock_S0_reg[31]~31_combout\,
	datab => \CSTATE.soda_dispensation~q\,
	datac => stock_S0_reg(0),
	datad => \LessThan1~10_combout\,
	combout => \stock_S0_reg[0]~97_combout\);

-- Location: LCCOMB_X47_Y23_N12
\mux|output[2]~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[2]~17_combout\ = (\mux|output[2]~37_combout\ & (((\S2[2]~input_o\) # (!\mux|output[0]~8_combout\)))) # (!\mux|output[2]~37_combout\ & (\S3[2]~input_o\ & ((\mux|output[0]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S3[2]~input_o\,
	datab => \mux|output[2]~37_combout\,
	datac => \S2[2]~input_o\,
	datad => \mux|output[0]~8_combout\,
	combout => \mux|output[2]~17_combout\);

-- Location: LCCOMB_X47_Y23_N6
\mux|output[2]~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[2]~18_combout\ = (\mux|output[0]~11_combout\ & ((\S4[2]~input_o\))) # (!\mux|output[0]~11_combout\ & (\mux|output[2]~17_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[2]~17_combout\,
	datab => \S4[2]~input_o\,
	datac => \mux|output[0]~11_combout\,
	combout => \mux|output[2]~18_combout\);

-- Location: LCCOMB_X51_Y23_N0
\mux|output[4]~22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[4]~22_combout\ = (\mux|output[0]~8_combout\ & (\mux|output[0]~9_combout\)) # (!\mux|output[0]~8_combout\ & ((\mux|output[0]~9_combout\ & ((\S1[4]~input_o\))) # (!\mux|output[0]~9_combout\ & (\S0[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~8_combout\,
	datab => \mux|output[0]~9_combout\,
	datac => \S0[4]~input_o\,
	datad => \S1[4]~input_o\,
	combout => \mux|output[4]~22_combout\);

-- Location: LCCOMB_X51_Y23_N6
\mux|output[4]~23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[4]~23_combout\ = (\mux|output[0]~8_combout\ & ((\mux|output[4]~22_combout\ & (\S2[4]~input_o\)) # (!\mux|output[4]~22_combout\ & ((\S3[4]~input_o\))))) # (!\mux|output[0]~8_combout\ & (\mux|output[4]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~8_combout\,
	datab => \mux|output[4]~22_combout\,
	datac => \S2[4]~input_o\,
	datad => \S3[4]~input_o\,
	combout => \mux|output[4]~23_combout\);

-- Location: LCCOMB_X51_Y23_N12
\mux|output[5]~25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[5]~25_combout\ = (\mux|output[0]~8_combout\ & ((\mux|output[0]~9_combout\) # ((\S3[5]~input_o\)))) # (!\mux|output[0]~8_combout\ & (!\mux|output[0]~9_combout\ & (\S0[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~8_combout\,
	datab => \mux|output[0]~9_combout\,
	datac => \S0[5]~input_o\,
	datad => \S3[5]~input_o\,
	combout => \mux|output[5]~25_combout\);

-- Location: LCCOMB_X51_Y23_N28
\mux|output[5]~26\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[5]~26_combout\ = (\mux|output[5]~25_combout\ & (((\S2[5]~input_o\)) # (!\mux|output[0]~9_combout\))) # (!\mux|output[5]~25_combout\ & (\mux|output[0]~9_combout\ & (\S1[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[5]~25_combout\,
	datab => \mux|output[0]~9_combout\,
	datac => \S1[5]~input_o\,
	datad => \S2[5]~input_o\,
	combout => \mux|output[5]~26_combout\);

-- Location: LCCOMB_X51_Y23_N10
\mux|output[5]~27\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[5]~27_combout\ = (\mux|output[0]~11_combout\ & ((\S4[5]~input_o\))) # (!\mux|output[0]~11_combout\ & (\mux|output[5]~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mux|output[5]~26_combout\,
	datac => \S4[5]~input_o\,
	datad => \mux|output[0]~11_combout\,
	combout => \mux|output[5]~27_combout\);

-- Location: LCCOMB_X51_Y16_N12
\mux|output[2]~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[2]~36_combout\ = (!\choice[2]~input_o\ & ((\choice[1]~input_o\ & ((\S1[2]~input_o\))) # (!\choice[1]~input_o\ & (\S0[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \S0[2]~input_o\,
	datac => \choice[2]~input_o\,
	datad => \S1[2]~input_o\,
	combout => \mux|output[2]~36_combout\);

-- Location: LCCOMB_X47_Y23_N2
\mux|output[2]~37\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[2]~37_combout\ = (\choice[1]~input_o\ & ((\choice[0]~input_o\ & (!\choice[2]~input_o\)) # (!\choice[0]~input_o\ & ((\mux|output[2]~36_combout\))))) # (!\choice[1]~input_o\ & (((\mux|output[2]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \choice[2]~input_o\,
	datac => \mux|output[2]~36_combout\,
	datad => \choice[0]~input_o\,
	combout => \mux|output[2]~37_combout\);

-- Location: IOIBUF_X52_Y23_N8
\nRST~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_nRST,
	o => \nRST~input_o\);

-- Location: IOIBUF_X52_Y12_N8
\S1[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(0),
	o => \S1[0]~input_o\);

-- Location: IOIBUF_X46_Y41_N15
\S2[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(0),
	o => \S2[0]~input_o\);

-- Location: IOIBUF_X52_Y19_N1
\S4[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(2),
	o => \S4[2]~input_o\);

-- Location: IOIBUF_X52_Y31_N1
\S3[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(2),
	o => \S3[2]~input_o\);

-- Location: IOIBUF_X52_Y16_N8
\S1[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(2),
	o => \S1[2]~input_o\);

-- Location: IOIBUF_X52_Y15_N8
\S0[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(2),
	o => \S0[2]~input_o\);

-- Location: IOIBUF_X48_Y0_N8
\S2[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(2),
	o => \S2[2]~input_o\);

-- Location: IOIBUF_X52_Y31_N8
\S0[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(3),
	o => \S0[3]~input_o\);

-- Location: IOIBUF_X46_Y0_N8
\S2[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(3),
	o => \S2[3]~input_o\);

-- Location: IOIBUF_X52_Y32_N15
\S3[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(4),
	o => \S3[4]~input_o\);

-- Location: IOIBUF_X52_Y10_N1
\S1[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(4),
	o => \S1[4]~input_o\);

-- Location: IOIBUF_X52_Y11_N1
\S0[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(4),
	o => \S0[4]~input_o\);

-- Location: IOIBUF_X52_Y25_N8
\S2[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(4),
	o => \S2[4]~input_o\);

-- Location: IOIBUF_X52_Y11_N8
\S4[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(5),
	o => \S4[5]~input_o\);

-- Location: IOIBUF_X52_Y32_N8
\S1[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(5),
	o => \S1[5]~input_o\);

-- Location: IOIBUF_X52_Y10_N8
\S3[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(5),
	o => \S3[5]~input_o\);

-- Location: IOIBUF_X52_Y28_N8
\S0[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(5),
	o => \S0[5]~input_o\);

-- Location: IOIBUF_X52_Y21_N22
\S2[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(5),
	o => \S2[5]~input_o\);

-- Location: IOIBUF_X52_Y32_N22
\S1[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(7),
	o => \S1[7]~input_o\);

-- Location: IOIBUF_X52_Y18_N1
\S3[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(7),
	o => \S3[7]~input_o\);

-- Location: IOOBUF_X29_Y41_N9
\P[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~0_combout\,
	devoe => ww_devoe,
	o => \P[0]~output_o\);

-- Location: IOOBUF_X31_Y41_N9
\P[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~1_combout\,
	devoe => ww_devoe,
	o => \P[1]~output_o\);

-- Location: IOOBUF_X41_Y41_N9
\P[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~2_combout\,
	devoe => ww_devoe,
	o => \P[2]~output_o\);

-- Location: IOOBUF_X31_Y41_N23
\P[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~3_combout\,
	devoe => ww_devoe,
	o => \P[3]~output_o\);

-- Location: IOOBUF_X41_Y0_N2
\P[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~4_combout\,
	devoe => ww_devoe,
	o => \P[4]~output_o\);

-- Location: IOOBUF_X41_Y0_N16
\P[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~5_combout\,
	devoe => ww_devoe,
	o => \P[5]~output_o\);

-- Location: IOOBUF_X36_Y41_N9
\P[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~6_combout\,
	devoe => ww_devoe,
	o => \P[6]~output_o\);

-- Location: IOOBUF_X31_Y41_N2
\P[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \P~7_combout\,
	devoe => ww_devoe,
	o => \P[7]~output_o\);

-- Location: IOOBUF_X41_Y41_N2
\E[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector8~0_combout\,
	devoe => ww_devoe,
	o => \E[0]~output_o\);

-- Location: IOOBUF_X43_Y41_N2
\E[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector7~0_combout\,
	devoe => ww_devoe,
	o => \E[1]~output_o\);

-- Location: IOOBUF_X34_Y41_N9
\E[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector6~1_combout\,
	devoe => ww_devoe,
	o => \E[2]~output_o\);

-- Location: IOOBUF_X34_Y41_N2
\E[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector5~1_combout\,
	devoe => ww_devoe,
	o => \E[3]~output_o\);

-- Location: IOOBUF_X50_Y0_N9
\E[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector4~0_combout\,
	devoe => ww_devoe,
	o => \E[4]~output_o\);

-- Location: IOOBUF_X52_Y16_N2
\E[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector3~2_combout\,
	devoe => ww_devoe,
	o => \E[5]~output_o\);

-- Location: IOOBUF_X52_Y9_N2
\E[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector2~1_combout\,
	devoe => ww_devoe,
	o => \E[6]~output_o\);

-- Location: IOOBUF_X48_Y41_N9
\E[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Selector1~1_combout\,
	devoe => ww_devoe,
	o => \E[7]~output_o\);

-- Location: IOOBUF_X52_Y30_N2
\D[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \D[0]~reg0_q\,
	devoe => ww_devoe,
	o => \D[0]~output_o\);

-- Location: IOOBUF_X52_Y15_N2
\D[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \D[1]~reg0_q\,
	devoe => ww_devoe,
	o => \D[1]~output_o\);

-- Location: IOOBUF_X31_Y41_N16
\D[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \D[2]~reg0_q\,
	devoe => ww_devoe,
	o => \D[2]~output_o\);

-- Location: IOOBUF_X46_Y0_N16
\ESTQ[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ESTQ~0_combout\,
	devoe => ww_devoe,
	o => \ESTQ[0]~output_o\);

-- Location: IOOBUF_X46_Y0_N23
\ESTQ[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ESTQ~0_combout\,
	devoe => ww_devoe,
	o => \ESTQ[1]~output_o\);

-- Location: IOOBUF_X46_Y0_N2
\ESTQ[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ESTQ~0_combout\,
	devoe => ww_devoe,
	o => \ESTQ[2]~output_o\);

-- Location: IOOBUF_X7_Y41_N9
\ESTQ[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ESTQ[3]~output_o\);

-- Location: IOOBUF_X14_Y41_N2
\ESTQ[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ESTQ[4]~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\ESTQ[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ESTQ[5]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\ESTQ[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ESTQ[6]~output_o\);

-- Location: IOOBUF_X10_Y0_N2
\ESTQ[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \ESTQ[7]~output_o\);

-- Location: IOIBUF_X43_Y0_N1
\V[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(0),
	o => \V[0]~input_o\);

-- Location: IOIBUF_X43_Y41_N8
\C~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C,
	o => \C~input_o\);

-- Location: IOIBUF_X52_Y13_N8
\choice[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_choice(1),
	o => \choice[1]~input_o\);

-- Location: IOIBUF_X52_Y13_N1
\choice[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_choice(2),
	o => \choice[2]~input_o\);

-- Location: IOIBUF_X52_Y23_N1
\choice[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_choice(0),
	o => \choice[0]~input_o\);

-- Location: LCCOMB_X51_Y23_N26
\mux|output[7]~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[7]~13_combout\ = (\choice[1]~input_o\ & (!\choice[2]~input_o\)) # (!\choice[1]~input_o\ & ((\choice[2]~input_o\) # (\choice[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \choice[1]~input_o\,
	datac => \choice[2]~input_o\,
	datad => \choice[0]~input_o\,
	combout => \mux|output[7]~13_combout\);

-- Location: CLKCTRL_G8
\mux|output[7]~13clkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \mux|output[7]~13clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \mux|output[7]~13clkctrl_outclk\);

-- Location: IOIBUF_X50_Y41_N8
\S4[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(7),
	o => \S4[7]~input_o\);

-- Location: LCCOMB_X51_Y23_N18
\mux|output[0]~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[0]~11_combout\ = \choice[2]~input_o\ $ (((!\choice[1]~input_o\ & !\choice[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \choice[1]~input_o\,
	datac => \choice[2]~input_o\,
	datad => \choice[0]~input_o\,
	combout => \mux|output[0]~11_combout\);

-- Location: LCCOMB_X51_Y23_N24
\mux|output[0]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[0]~9_combout\ = (\choice[1]~input_o\ & !\choice[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \choice[1]~input_o\,
	datac => \choice[2]~input_o\,
	combout => \mux|output[0]~9_combout\);

-- Location: IOIBUF_X52_Y32_N1
\S2[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(7),
	o => \S2[7]~input_o\);

-- Location: IOIBUF_X50_Y41_N1
\S0[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(7),
	o => \S0[7]~input_o\);

-- Location: LCCOMB_X51_Y23_N30
\mux|output[0]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[0]~8_combout\ = (\choice[2]~input_o\) # ((\choice[1]~input_o\ & \choice[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \choice[1]~input_o\,
	datac => \choice[2]~input_o\,
	datad => \choice[0]~input_o\,
	combout => \mux|output[0]~8_combout\);

-- Location: LCCOMB_X50_Y23_N28
\mux|output[7]~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[7]~31_combout\ = (\mux|output[0]~9_combout\ & (((\mux|output[0]~8_combout\)))) # (!\mux|output[0]~9_combout\ & ((\mux|output[0]~8_combout\ & (\S3[7]~input_o\)) # (!\mux|output[0]~8_combout\ & ((\S0[7]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S3[7]~input_o\,
	datab => \mux|output[0]~9_combout\,
	datac => \S0[7]~input_o\,
	datad => \mux|output[0]~8_combout\,
	combout => \mux|output[7]~31_combout\);

-- Location: LCCOMB_X50_Y23_N22
\mux|output[7]~32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[7]~32_combout\ = (\mux|output[0]~9_combout\ & ((\mux|output[7]~31_combout\ & ((\S2[7]~input_o\))) # (!\mux|output[7]~31_combout\ & (\S1[7]~input_o\)))) # (!\mux|output[0]~9_combout\ & (((\mux|output[7]~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S1[7]~input_o\,
	datab => \mux|output[0]~9_combout\,
	datac => \S2[7]~input_o\,
	datad => \mux|output[7]~31_combout\,
	combout => \mux|output[7]~32_combout\);

-- Location: LCCOMB_X50_Y23_N8
\mux|output[7]~33\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[7]~33_combout\ = (\mux|output[0]~11_combout\ & (\S4[7]~input_o\)) # (!\mux|output[0]~11_combout\ & ((\mux|output[7]~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \S4[7]~input_o\,
	datac => \mux|output[0]~11_combout\,
	datad => \mux|output[7]~32_combout\,
	combout => \mux|output[7]~33_combout\);

-- Location: LCCOMB_X50_Y23_N14
\mux|output[7]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(7) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output[7]~33_combout\))) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mux|output\(7),
	datac => \mux|output[7]~13clkctrl_outclk\,
	datad => \mux|output[7]~33_combout\,
	combout => \mux|output\(7));

-- Location: FF_X50_Y23_N15
\price_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(7),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(7));

-- Location: IOIBUF_X41_Y41_N22
\V[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(6),
	o => \V[6]~input_o\);

-- Location: IOIBUF_X38_Y41_N1
\V[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(5),
	o => \V[5]~input_o\);

-- Location: IOIBUF_X41_Y0_N22
\V[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(3),
	o => \V[3]~input_o\);

-- Location: IOIBUF_X36_Y41_N1
\V[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(1),
	o => \V[1]~input_o\);

-- Location: LCCOMB_X44_Y23_N30
\accumulator|temp2~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~13_combout\ = (\accumulator|adder|bit1|sum~0_combout\ & ((\CSTATE.Coin_Reception~q\) # ((\C~input_o\ & !\CSTATE.INIT_STATE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|adder|bit1|sum~0_combout\,
	datab => \C~input_o\,
	datac => \CSTATE.Coin_Reception~q\,
	datad => \CSTATE.INIT_STATE~q\,
	combout => \accumulator|temp2~13_combout\);

-- Location: IOIBUF_X41_Y41_N15
\V[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(4),
	o => \V[4]~input_o\);

-- Location: LCCOMB_X42_Y23_N8
\accumulator|temp2[2]~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2[2]~4_combout\ = (\V[4]~input_o\ & (!\V[1]~input_o\)) # (!\V[4]~input_o\ & (\V[1]~input_o\ & !\V[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \V[4]~input_o\,
	datac => \V[1]~input_o\,
	datad => \V[0]~input_o\,
	combout => \accumulator|temp2[2]~4_combout\);

-- Location: LCCOMB_X42_Y23_N18
\accumulator|temp2[2]~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2[2]~5_combout\ = (\V[5]~input_o\ & (!\accumulator|temp2[2]~4_combout\ & (!\V[3]~input_o\ & !\V[0]~input_o\))) # (!\V[5]~input_o\ & (\accumulator|temp2[2]~4_combout\ & (\V[3]~input_o\ & \V[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[5]~input_o\,
	datab => \accumulator|temp2[2]~4_combout\,
	datac => \V[3]~input_o\,
	datad => \V[0]~input_o\,
	combout => \accumulator|temp2[2]~5_combout\);

-- Location: IOIBUF_X29_Y41_N1
\V[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(7),
	o => \V[7]~input_o\);

-- Location: LCCOMB_X44_Y23_N28
\accumulator|temp2[2]~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2[2]~6_combout\ = ((\accumulator|temp2[2]~3_combout\ & (\accumulator|temp2[2]~5_combout\ & !\V[7]~input_o\))) # (!\Selector0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2[2]~3_combout\,
	datab => \accumulator|temp2[2]~5_combout\,
	datac => \V[7]~input_o\,
	datad => \Selector0~0_combout\,
	combout => \accumulator|temp2[2]~6_combout\);

-- Location: FF_X43_Y23_N31
\accumulator|temp2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \accumulator|temp2~13_combout\,
	sload => VCC,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(1));

-- Location: LCCOMB_X43_Y23_N2
\accumulator|adder|bit1|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit1|c_out~0_combout\ = (\V[1]~input_o\ & ((\accumulator|temp2\(1)) # ((\V[0]~input_o\ & \accumulator|temp2\(0))))) # (!\V[1]~input_o\ & (\V[0]~input_o\ & (\accumulator|temp2\(1) & \accumulator|temp2\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[0]~input_o\,
	datab => \V[1]~input_o\,
	datac => \accumulator|temp2\(1),
	datad => \accumulator|temp2\(0),
	combout => \accumulator|adder|bit1|c_out~0_combout\);

-- Location: IOIBUF_X52_Y18_N8
\V[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_V(2),
	o => \V[2]~input_o\);

-- Location: LCCOMB_X43_Y23_N4
\accumulator|temp2~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~7_combout\ = (\Selector0~0_combout\ & (\accumulator|adder|bit1|c_out~0_combout\ $ (\accumulator|temp2\(2) $ (\V[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~0_combout\,
	datab => \accumulator|adder|bit1|c_out~0_combout\,
	datac => \accumulator|temp2\(2),
	datad => \V[2]~input_o\,
	combout => \accumulator|temp2~7_combout\);

-- Location: FF_X43_Y23_N5
\accumulator|temp2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \accumulator|temp2~7_combout\,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(2));

-- Location: LCCOMB_X43_Y23_N16
\accumulator|adder|bit2|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit2|c_out~0_combout\ = (\V[2]~input_o\ & ((\accumulator|temp2\(2)) # (\accumulator|adder|bit1|c_out~0_combout\))) # (!\V[2]~input_o\ & (\accumulator|temp2\(2) & \accumulator|adder|bit1|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[2]~input_o\,
	datac => \accumulator|temp2\(2),
	datad => \accumulator|adder|bit1|c_out~0_combout\,
	combout => \accumulator|adder|bit2|c_out~0_combout\);

-- Location: LCCOMB_X42_Y23_N24
\accumulator|temp2~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~8_combout\ = (\Selector0~0_combout\ & (\V[3]~input_o\ $ (\accumulator|temp2\(3) $ (\accumulator|adder|bit2|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[3]~input_o\,
	datab => \Selector0~0_combout\,
	datac => \accumulator|temp2\(3),
	datad => \accumulator|adder|bit2|c_out~0_combout\,
	combout => \accumulator|temp2~8_combout\);

-- Location: FF_X42_Y23_N25
\accumulator|temp2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \accumulator|temp2~8_combout\,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(3));

-- Location: LCCOMB_X42_Y23_N28
\accumulator|adder|bit3|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit3|c_out~0_combout\ = (\V[3]~input_o\ & \accumulator|temp2\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \V[3]~input_o\,
	datad => \accumulator|temp2\(3),
	combout => \accumulator|adder|bit3|c_out~0_combout\);

-- Location: LCCOMB_X42_Y23_N4
\accumulator|adder|bit3|c_out~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit3|c_out~2_combout\ = (\accumulator|adder|bit3|c_out~1_combout\ & ((\V[2]~input_o\ & ((\accumulator|temp2\(2)) # (\accumulator|adder|bit1|c_out~0_combout\))) # (!\V[2]~input_o\ & (\accumulator|temp2\(2) & 
-- \accumulator|adder|bit1|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|adder|bit3|c_out~1_combout\,
	datab => \V[2]~input_o\,
	datac => \accumulator|temp2\(2),
	datad => \accumulator|adder|bit1|c_out~0_combout\,
	combout => \accumulator|adder|bit3|c_out~2_combout\);

-- Location: LCCOMB_X42_Y23_N20
\accumulator|temp2~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~9_combout\ = (\Selector0~0_combout\ & (\accumulator|adder|bit4|sum~0_combout\ $ (((\accumulator|adder|bit3|c_out~2_combout\) # (\accumulator|adder|bit3|c_out~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|adder|bit4|sum~0_combout\,
	datab => \accumulator|adder|bit3|c_out~2_combout\,
	datac => \Selector0~0_combout\,
	datad => \accumulator|adder|bit3|c_out~0_combout\,
	combout => \accumulator|temp2~9_combout\);

-- Location: FF_X42_Y23_N21
\accumulator|temp2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \accumulator|temp2~9_combout\,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(4));

-- Location: LCCOMB_X42_Y23_N12
\accumulator|adder|bit4|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit4|c_out~0_combout\ = (\V[4]~input_o\ & ((\accumulator|adder|bit3|c_out~0_combout\) # ((\accumulator|adder|bit3|c_out~2_combout\) # (\accumulator|temp2\(4))))) # (!\V[4]~input_o\ & (\accumulator|temp2\(4) & 
-- ((\accumulator|adder|bit3|c_out~0_combout\) # (\accumulator|adder|bit3|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[4]~input_o\,
	datab => \accumulator|adder|bit3|c_out~0_combout\,
	datac => \accumulator|adder|bit3|c_out~2_combout\,
	datad => \accumulator|temp2\(4),
	combout => \accumulator|adder|bit4|c_out~0_combout\);

-- Location: LCCOMB_X42_Y23_N26
\accumulator|temp2~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~10_combout\ = (\Selector0~0_combout\ & (\V[5]~input_o\ $ (\accumulator|temp2\(5) $ (\accumulator|adder|bit4|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector0~0_combout\,
	datab => \V[5]~input_o\,
	datac => \accumulator|temp2\(5),
	datad => \accumulator|adder|bit4|c_out~0_combout\,
	combout => \accumulator|temp2~10_combout\);

-- Location: FF_X42_Y23_N27
\accumulator|temp2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \accumulator|temp2~10_combout\,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(5));

-- Location: LCCOMB_X42_Y23_N2
\accumulator|adder|bit5|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit5|c_out~0_combout\ = (\V[5]~input_o\ & ((\accumulator|temp2\(5)) # (\accumulator|adder|bit4|c_out~0_combout\))) # (!\V[5]~input_o\ & (\accumulator|temp2\(5) & \accumulator|adder|bit4|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[5]~input_o\,
	datac => \accumulator|temp2\(5),
	datad => \accumulator|adder|bit4|c_out~0_combout\,
	combout => \accumulator|adder|bit5|c_out~0_combout\);

-- Location: LCCOMB_X44_Y23_N12
\accumulator|adder|bit6|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|adder|bit6|c_out~0_combout\ = (\accumulator|temp2\(6) & ((\V[6]~input_o\) # (\accumulator|adder|bit5|c_out~0_combout\))) # (!\accumulator|temp2\(6) & (\V[6]~input_o\ & \accumulator|adder|bit5|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2\(6),
	datab => \V[6]~input_o\,
	datad => \accumulator|adder|bit5|c_out~0_combout\,
	combout => \accumulator|adder|bit6|c_out~0_combout\);

-- Location: LCCOMB_X44_Y23_N26
\accumulator|temp2~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~12_combout\ = (\Selector0~0_combout\ & (\V[7]~input_o\ $ (\accumulator|temp2\(7) $ (\accumulator|adder|bit6|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \V[7]~input_o\,
	datab => \Selector0~0_combout\,
	datac => \accumulator|temp2\(7),
	datad => \accumulator|adder|bit6|c_out~0_combout\,
	combout => \accumulator|temp2~12_combout\);

-- Location: FF_X44_Y23_N27
\accumulator|temp2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \accumulator|temp2~12_combout\,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(7));

-- Location: LCCOMB_X44_Y23_N22
\accumulator|temp2~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~11_combout\ = (\Selector0~0_combout\ & (\accumulator|adder|bit5|c_out~0_combout\ $ (\V[6]~input_o\ $ (\accumulator|temp2\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|adder|bit5|c_out~0_combout\,
	datab => \V[6]~input_o\,
	datac => \accumulator|temp2\(6),
	datad => \Selector0~0_combout\,
	combout => \accumulator|temp2~11_combout\);

-- Location: FF_X44_Y23_N23
\accumulator|temp2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \accumulator|temp2~11_combout\,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(6));

-- Location: LCCOMB_X51_Y23_N22
\mux|output[5]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(5) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output[5]~27_combout\)) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[5]~27_combout\,
	datac => \mux|output\(5),
	datad => \mux|output[7]~13clkctrl_outclk\,
	combout => \mux|output\(5));

-- Location: FF_X51_Y23_N23
\price_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(5),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(5));

-- Location: IOIBUF_X52_Y25_N1
\S4[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(4),
	o => \S4[4]~input_o\);

-- Location: LCCOMB_X51_Y23_N16
\mux|output[4]~24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[4]~24_combout\ = (\mux|output[0]~11_combout\ & ((\S4[4]~input_o\))) # (!\mux|output[0]~11_combout\ & (\mux|output[4]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[4]~23_combout\,
	datab => \S4[4]~input_o\,
	datad => \mux|output[0]~11_combout\,
	combout => \mux|output[4]~24_combout\);

-- Location: LCCOMB_X51_Y23_N4
\mux|output[4]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(4) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output[4]~24_combout\)) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mux|output[4]~24_combout\,
	datac => \mux|output\(4),
	datad => \mux|output[7]~13clkctrl_outclk\,
	combout => \mux|output\(4));

-- Location: FF_X51_Y23_N5
\price_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(4),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(4));

-- Location: IOIBUF_X38_Y41_N8
\S1[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(3),
	o => \S1[3]~input_o\);

-- Location: IOIBUF_X46_Y41_N8
\S3[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(3),
	o => \S3[3]~input_o\);

-- Location: LCCOMB_X46_Y23_N22
\mux|output[3]~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[3]~19_combout\ = (\mux|output[0]~9_combout\ & (((\mux|output[0]~8_combout\)))) # (!\mux|output[0]~9_combout\ & ((\mux|output[0]~8_combout\ & ((\S3[3]~input_o\))) # (!\mux|output[0]~8_combout\ & (\S0[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S0[3]~input_o\,
	datab => \mux|output[0]~9_combout\,
	datac => \S3[3]~input_o\,
	datad => \mux|output[0]~8_combout\,
	combout => \mux|output[3]~19_combout\);

-- Location: LCCOMB_X46_Y23_N8
\mux|output[3]~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[3]~20_combout\ = (\mux|output[3]~19_combout\ & ((\S2[3]~input_o\) # ((!\mux|output[0]~9_combout\)))) # (!\mux|output[3]~19_combout\ & (((\S1[3]~input_o\ & \mux|output[0]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S2[3]~input_o\,
	datab => \S1[3]~input_o\,
	datac => \mux|output[3]~19_combout\,
	datad => \mux|output[0]~9_combout\,
	combout => \mux|output[3]~20_combout\);

-- Location: IOIBUF_X52_Y30_N8
\S4[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(3),
	o => \S4[3]~input_o\);

-- Location: LCCOMB_X46_Y23_N30
\mux|output[3]~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[3]~21_combout\ = (\mux|output[0]~11_combout\ & ((\S4[3]~input_o\))) # (!\mux|output[0]~11_combout\ & (\mux|output[3]~20_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~11_combout\,
	datac => \mux|output[3]~20_combout\,
	datad => \S4[3]~input_o\,
	combout => \mux|output[3]~21_combout\);

-- Location: LCCOMB_X46_Y23_N2
\mux|output[3]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(3) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output[3]~21_combout\))) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mux|output\(3),
	datac => \mux|output[3]~21_combout\,
	datad => \mux|output[7]~13clkctrl_outclk\,
	combout => \mux|output\(3));

-- Location: FF_X46_Y23_N3
\price_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(3),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(3));

-- Location: LCCOMB_X47_Y23_N22
\mux|output[2]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(2) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output[2]~18_combout\)) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[2]~18_combout\,
	datac => \mux|output\(2),
	datad => \mux|output[7]~13clkctrl_outclk\,
	combout => \mux|output\(2));

-- Location: FF_X47_Y23_N23
\price_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(2),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(2));

-- Location: IOIBUF_X52_Y19_N8
\S4[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(0),
	o => \S4[0]~input_o\);

-- Location: IOIBUF_X46_Y41_N22
\S3[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(0),
	o => \S3[0]~input_o\);

-- Location: IOIBUF_X52_Y12_N1
\S0[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(0),
	o => \S0[0]~input_o\);

-- Location: LCCOMB_X51_Y12_N4
\mux|output[0]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[0]~34_combout\ = (!\choice[2]~input_o\ & ((\choice[1]~input_o\ & (\S1[0]~input_o\)) # (!\choice[1]~input_o\ & ((\S0[0]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S1[0]~input_o\,
	datab => \choice[2]~input_o\,
	datac => \S0[0]~input_o\,
	datad => \choice[1]~input_o\,
	combout => \mux|output[0]~34_combout\);

-- Location: LCCOMB_X47_Y23_N16
\mux|output[0]~35\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[0]~35_combout\ = (\choice[1]~input_o\ & ((\choice[0]~input_o\ & (!\choice[2]~input_o\)) # (!\choice[0]~input_o\ & ((\mux|output[0]~34_combout\))))) # (!\choice[1]~input_o\ & (((\mux|output[0]~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \choice[1]~input_o\,
	datab => \choice[2]~input_o\,
	datac => \mux|output[0]~34_combout\,
	datad => \choice[0]~input_o\,
	combout => \mux|output[0]~35_combout\);

-- Location: LCCOMB_X46_Y23_N14
\mux|output[0]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[0]~10_combout\ = (\mux|output[0]~8_combout\ & ((\mux|output[0]~35_combout\ & (\S2[0]~input_o\)) # (!\mux|output[0]~35_combout\ & ((\S3[0]~input_o\))))) # (!\mux|output[0]~8_combout\ & (((\mux|output[0]~35_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S2[0]~input_o\,
	datab => \mux|output[0]~8_combout\,
	datac => \S3[0]~input_o\,
	datad => \mux|output[0]~35_combout\,
	combout => \mux|output[0]~10_combout\);

-- Location: LCCOMB_X46_Y23_N28
\mux|output[0]~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[0]~12_combout\ = (\mux|output[0]~11_combout\ & (\S4[0]~input_o\)) # (!\mux|output[0]~11_combout\ & ((\mux|output[0]~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~11_combout\,
	datac => \S4[0]~input_o\,
	datad => \mux|output[0]~10_combout\,
	combout => \mux|output[0]~12_combout\);

-- Location: LCCOMB_X46_Y23_N26
\mux|output[0]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(0) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output[0]~12_combout\))) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output\(0),
	datac => \mux|output[7]~13clkctrl_outclk\,
	datad => \mux|output[0]~12_combout\,
	combout => \mux|output\(0));

-- Location: FF_X46_Y23_N27
\price_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(0),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(0));

-- Location: IOIBUF_X48_Y41_N1
\S4[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(1),
	o => \S4[1]~input_o\);

-- Location: IOIBUF_X46_Y41_N1
\S2[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(1),
	o => \S2[1]~input_o\);

-- Location: IOIBUF_X52_Y28_N1
\S0[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(1),
	o => \S0[1]~input_o\);

-- Location: IOIBUF_X48_Y0_N1
\S3[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(1),
	o => \S3[1]~input_o\);

-- Location: LCCOMB_X47_Y23_N30
\mux|output[1]~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[1]~14_combout\ = (\mux|output[0]~8_combout\ & (((\mux|output[0]~9_combout\) # (\S3[1]~input_o\)))) # (!\mux|output[0]~8_combout\ & (\S0[1]~input_o\ & (!\mux|output[0]~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~8_combout\,
	datab => \S0[1]~input_o\,
	datac => \mux|output[0]~9_combout\,
	datad => \S3[1]~input_o\,
	combout => \mux|output[1]~14_combout\);

-- Location: IOIBUF_X52_Y27_N1
\S1[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(1),
	o => \S1[1]~input_o\);

-- Location: LCCOMB_X47_Y23_N4
\mux|output[1]~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[1]~15_combout\ = (\mux|output[0]~9_combout\ & ((\mux|output[1]~14_combout\ & (\S2[1]~input_o\)) # (!\mux|output[1]~14_combout\ & ((\S1[1]~input_o\))))) # (!\mux|output[0]~9_combout\ & (((\mux|output[1]~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~9_combout\,
	datab => \S2[1]~input_o\,
	datac => \mux|output[1]~14_combout\,
	datad => \S1[1]~input_o\,
	combout => \mux|output[1]~15_combout\);

-- Location: LCCOMB_X47_Y23_N26
\mux|output[1]~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[1]~16_combout\ = (\mux|output[0]~11_combout\ & (\S4[1]~input_o\)) # (!\mux|output[0]~11_combout\ & ((\mux|output[1]~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~11_combout\,
	datab => \S4[1]~input_o\,
	datac => \mux|output[1]~15_combout\,
	combout => \mux|output[1]~16_combout\);

-- Location: LCCOMB_X47_Y23_N24
\mux|output[1]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(1) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output[1]~16_combout\))) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mux|output\(1),
	datac => \mux|output[7]~13clkctrl_outclk\,
	datad => \mux|output[1]~16_combout\,
	combout => \mux|output\(1));

-- Location: FF_X47_Y23_N25
\price_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(1),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(1));

-- Location: LCCOMB_X43_Y23_N24
\subtractor|subtractor|bit1|c_out\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit1|c_out~combout\ = (\accumulator|temp2\(1) & ((\accumulator|temp2\(0)) # ((!price_reg(1)) # (!price_reg(0))))) # (!\accumulator|temp2\(1) & (!price_reg(1) & ((\accumulator|temp2\(0)) # (!price_reg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2\(1),
	datab => \accumulator|temp2\(0),
	datac => price_reg(0),
	datad => price_reg(1),
	combout => \subtractor|subtractor|bit1|c_out~combout\);

-- Location: LCCOMB_X43_Y23_N18
\next_state~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_state~8_combout\ = (\accumulator|temp2\(2) & ((\subtractor|subtractor|bit1|c_out~combout\) # (!price_reg(2)))) # (!\accumulator|temp2\(2) & (!price_reg(2) & \subtractor|subtractor|bit1|c_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulator|temp2\(2),
	datac => price_reg(2),
	datad => \subtractor|subtractor|bit1|c_out~combout\,
	combout => \next_state~8_combout\);

-- Location: LCCOMB_X43_Y23_N0
\next_state~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_state~9_combout\ = (\accumulator|temp2\(3) & ((\next_state~8_combout\) # (!price_reg(3)))) # (!\accumulator|temp2\(3) & (!price_reg(3) & \next_state~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulator|temp2\(3),
	datac => price_reg(3),
	datad => \next_state~8_combout\,
	combout => \next_state~9_combout\);

-- Location: LCCOMB_X43_Y23_N6
\next_state~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_state~13_combout\ = (\accumulator|temp2\(4) & ((\next_state~9_combout\) # (!price_reg(4)))) # (!\accumulator|temp2\(4) & (!price_reg(4) & \next_state~9_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulator|temp2\(4),
	datac => price_reg(4),
	datad => \next_state~9_combout\,
	combout => \next_state~13_combout\);

-- Location: LCCOMB_X43_Y23_N14
\next_state~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_state~10_combout\ = (\accumulator|temp2\(5) & ((\next_state~13_combout\) # (!price_reg(5)))) # (!\accumulator|temp2\(5) & (!price_reg(5) & \next_state~13_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2\(5),
	datab => price_reg(5),
	datad => \next_state~13_combout\,
	combout => \next_state~10_combout\);

-- Location: LCCOMB_X44_Y23_N24
\next_state~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_state~11_combout\ = (price_reg(6) & (\accumulator|temp2\(6) & \next_state~10_combout\)) # (!price_reg(6) & ((\accumulator|temp2\(6)) # (\next_state~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => price_reg(6),
	datac => \accumulator|temp2\(6),
	datad => \next_state~10_combout\,
	combout => \next_state~11_combout\);

-- Location: LCCOMB_X44_Y23_N10
\next_state~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \next_state~12_combout\ = (price_reg(7) & (\accumulator|temp2\(7) & \next_state~11_combout\)) # (!price_reg(7) & ((\accumulator|temp2\(7)) # (\next_state~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => price_reg(7),
	datac => \accumulator|temp2\(7),
	datad => \next_state~11_combout\,
	combout => \next_state~12_combout\);

-- Location: LCCOMB_X44_Y23_N14
\CSTATE~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \CSTATE~6_combout\ = (\nRST~input_o\ & (\CSTATE.Coin_Reception~q\ & \next_state~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nRST~input_o\,
	datac => \CSTATE.Coin_Reception~q\,
	datad => \next_state~12_combout\,
	combout => \CSTATE~6_combout\);

-- Location: FF_X44_Y23_N15
\CSTATE.soda_dispensation\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \CSTATE~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CSTATE.soda_dispensation~q\);

-- Location: LCCOMB_X44_Y23_N16
\CSTATE~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \CSTATE~7_combout\ = (\nRST~input_o\ & (!\CSTATE.soda_dispensation~q\ & ((\CSTATE.INIT_STATE~q\) # (\C~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nRST~input_o\,
	datab => \CSTATE.soda_dispensation~q\,
	datac => \CSTATE.INIT_STATE~q\,
	datad => \C~input_o\,
	combout => \CSTATE~7_combout\);

-- Location: FF_X44_Y23_N17
\CSTATE.INIT_STATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \CSTATE~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CSTATE.INIT_STATE~q\);

-- Location: LCCOMB_X44_Y23_N2
\Selector0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\C~input_o\ & !\CSTATE.INIT_STATE~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C~input_o\,
	datad => \CSTATE.INIT_STATE~q\,
	combout => \Selector0~1_combout\);

-- Location: LCCOMB_X44_Y23_N4
\CSTATE~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \CSTATE~5_combout\ = (\nRST~input_o\ & ((\Selector0~1_combout\) # ((\CSTATE.Coin_Reception~q\ & !\next_state~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nRST~input_o\,
	datab => \Selector0~1_combout\,
	datac => \CSTATE.Coin_Reception~q\,
	datad => \next_state~12_combout\,
	combout => \CSTATE~5_combout\);

-- Location: FF_X44_Y23_N5
\CSTATE.Coin_Reception\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \CSTATE~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \CSTATE.Coin_Reception~q\);

-- Location: LCCOMB_X44_Y23_N20
\Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\CSTATE.Coin_Reception~q\) # ((\C~input_o\ & !\CSTATE.INIT_STATE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C~input_o\,
	datac => \CSTATE.Coin_Reception~q\,
	datad => \CSTATE.INIT_STATE~q\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X42_Y23_N6
\accumulator|temp2~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \accumulator|temp2~2_combout\ = (\Selector0~0_combout\ & (\V[0]~input_o\ $ (\accumulator|temp2\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \V[0]~input_o\,
	datac => \Selector0~0_combout\,
	datad => \accumulator|temp2\(0),
	combout => \accumulator|temp2~2_combout\);

-- Location: FF_X43_Y23_N29
\accumulator|temp2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \accumulator|temp2~2_combout\,
	sload => VCC,
	ena => \accumulator|temp2[2]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \accumulator|temp2\(0));

-- Location: LCCOMB_X42_Y23_N0
\P~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~0_combout\ = (\accumulator|temp2\(0) & \CSTATE.Coin_Reception~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulator|temp2\(0),
	datad => \CSTATE.Coin_Reception~q\,
	combout => \P~0_combout\);

-- Location: LCCOMB_X43_Y23_N28
\P~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~1_combout\ = (\accumulator|temp2\(1) & \CSTATE.Coin_Reception~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2\(1),
	datad => \CSTATE.Coin_Reception~q\,
	combout => \P~1_combout\);

-- Location: LCCOMB_X42_Y23_N10
\P~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~2_combout\ = (\accumulator|temp2\(2) & \CSTATE.Coin_Reception~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \accumulator|temp2\(2),
	datad => \CSTATE.Coin_Reception~q\,
	combout => \P~2_combout\);

-- Location: LCCOMB_X42_Y23_N14
\P~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~3_combout\ = (\accumulator|temp2\(3) & \CSTATE.Coin_Reception~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulator|temp2\(3),
	datad => \CSTATE.Coin_Reception~q\,
	combout => \P~3_combout\);

-- Location: LCCOMB_X43_Y23_N30
\P~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~4_combout\ = (\CSTATE.Coin_Reception~q\ & \accumulator|temp2\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CSTATE.Coin_Reception~q\,
	datad => \accumulator|temp2\(4),
	combout => \P~4_combout\);

-- Location: LCCOMB_X42_Y23_N16
\P~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~5_combout\ = (\accumulator|temp2\(5) & \CSTATE.Coin_Reception~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \accumulator|temp2\(5),
	datad => \CSTATE.Coin_Reception~q\,
	combout => \P~5_combout\);

-- Location: LCCOMB_X44_Y23_N0
\P~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~6_combout\ = (\CSTATE.Coin_Reception~q\ & \accumulator|temp2\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CSTATE.Coin_Reception~q\,
	datac => \accumulator|temp2\(6),
	combout => \P~6_combout\);

-- Location: LCCOMB_X44_Y23_N8
\P~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \P~7_combout\ = (\CSTATE.Coin_Reception~q\ & \accumulator|temp2\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CSTATE.Coin_Reception~q\,
	datac => \accumulator|temp2\(7),
	combout => \P~7_combout\);

-- Location: LCCOMB_X46_Y23_N20
\Selector8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector8~0_combout\ = (\accumulator|temp2\(0) & (((!price_reg(0) & \CSTATE.soda_dispensation~q\)) # (!\CSTATE.INIT_STATE~q\))) # (!\accumulator|temp2\(0) & (price_reg(0) & (\CSTATE.soda_dispensation~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2\(0),
	datab => price_reg(0),
	datac => \CSTATE.soda_dispensation~q\,
	datad => \CSTATE.INIT_STATE~q\,
	combout => \Selector8~0_combout\);

-- Location: LCCOMB_X43_Y23_N26
\subtractor|subtractor|bit1|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit1|sum~combout\ = \accumulator|temp2\(1) $ (price_reg(1) $ (((\accumulator|temp2\(0)) # (!price_reg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001000101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => price_reg(0),
	datab => \accumulator|temp2\(0),
	datac => \accumulator|temp2\(1),
	datad => price_reg(1),
	combout => \subtractor|subtractor|bit1|sum~combout\);

-- Location: LCCOMB_X44_Y23_N18
\Selector7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector7~0_combout\ = (\subtractor|subtractor|bit1|sum~combout\ & (\accumulator|temp2\(1) & ((!\CSTATE.INIT_STATE~q\)))) # (!\subtractor|subtractor|bit1|sum~combout\ & ((\CSTATE.soda_dispensation~q\) # ((\accumulator|temp2\(1) & 
-- !\CSTATE.INIT_STATE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \subtractor|subtractor|bit1|sum~combout\,
	datab => \accumulator|temp2\(1),
	datac => \CSTATE.soda_dispensation~q\,
	datad => \CSTATE.INIT_STATE~q\,
	combout => \Selector7~0_combout\);

-- Location: LCCOMB_X43_Y23_N22
\Selector6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector6~0_combout\ = (\CSTATE.soda_dispensation~q\ & (price_reg(2) $ (\subtractor|subtractor|bit1|c_out~combout\ $ (!\accumulator|temp2\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => price_reg(2),
	datab => \subtractor|subtractor|bit1|c_out~combout\,
	datac => \accumulator|temp2\(2),
	datad => \CSTATE.soda_dispensation~q\,
	combout => \Selector6~0_combout\);

-- Location: LCCOMB_X43_Y23_N8
\Selector6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector6~1_combout\ = (\Selector6~0_combout\) # ((\accumulator|temp2\(2) & !\CSTATE.INIT_STATE~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulator|temp2\(2),
	datac => \Selector6~0_combout\,
	datad => \CSTATE.INIT_STATE~q\,
	combout => \Selector6~1_combout\);

-- Location: LCCOMB_X46_Y23_N4
\Selector5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector5~0_combout\ = (\CSTATE.soda_dispensation~q\ & (\subtractor|subtractor|bit2|c_out~combout\ $ (price_reg(3) $ (!\accumulator|temp2\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \subtractor|subtractor|bit2|c_out~combout\,
	datab => price_reg(3),
	datac => \CSTATE.soda_dispensation~q\,
	datad => \accumulator|temp2\(3),
	combout => \Selector5~0_combout\);

-- Location: LCCOMB_X43_Y23_N20
\Selector5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector5~1_combout\ = (\Selector5~0_combout\) # ((!\CSTATE.INIT_STATE~q\ & \accumulator|temp2\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CSTATE.INIT_STATE~q\,
	datac => \Selector5~0_combout\,
	datad => \accumulator|temp2\(3),
	combout => \Selector5~1_combout\);

-- Location: LCCOMB_X43_Y23_N10
\subtractor|subtractor|bit2|c_out\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit2|c_out~combout\ = (\accumulator|temp2\(2) & ((\subtractor|subtractor|bit1|c_out~combout\) # (!price_reg(2)))) # (!\accumulator|temp2\(2) & (!price_reg(2) & \subtractor|subtractor|bit1|c_out~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \accumulator|temp2\(2),
	datac => price_reg(2),
	datad => \subtractor|subtractor|bit1|c_out~combout\,
	combout => \subtractor|subtractor|bit2|c_out~combout\);

-- Location: LCCOMB_X50_Y23_N30
\subtractor|subtractor|bit4|sum\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit4|sum~combout\ = \subtractor|subtractor|bit4|sum~0_combout\ $ (((price_reg(3) & (\subtractor|subtractor|bit2|c_out~combout\ & \accumulator|temp2\(3))) # (!price_reg(3) & ((\subtractor|subtractor|bit2|c_out~combout\) # 
-- (\accumulator|temp2\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100110011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \subtractor|subtractor|bit4|sum~0_combout\,
	datab => price_reg(3),
	datac => \subtractor|subtractor|bit2|c_out~combout\,
	datad => \accumulator|temp2\(3),
	combout => \subtractor|subtractor|bit4|sum~combout\);

-- Location: LCCOMB_X50_Y23_N20
\Selector4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector4~0_combout\ = (\subtractor|subtractor|bit4|sum~combout\ & (((\accumulator|temp2\(4) & !\CSTATE.INIT_STATE~q\)))) # (!\subtractor|subtractor|bit4|sum~combout\ & ((\CSTATE.soda_dispensation~q\) # ((\accumulator|temp2\(4) & 
-- !\CSTATE.INIT_STATE~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \subtractor|subtractor|bit4|sum~combout\,
	datab => \CSTATE.soda_dispensation~q\,
	datac => \accumulator|temp2\(4),
	datad => \CSTATE.INIT_STATE~q\,
	combout => \Selector4~0_combout\);

-- Location: LCCOMB_X50_Y23_N18
\subtractor|subtractor|bit4|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \subtractor|subtractor|bit4|c_out~0_combout\ = (!\subtractor|subtractor|bit4|sum~0_combout\ & ((price_reg(3) & (\subtractor|subtractor|bit2|c_out~combout\ & \accumulator|temp2\(3))) # (!price_reg(3) & ((\subtractor|subtractor|bit2|c_out~combout\) # 
-- (\accumulator|temp2\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \subtractor|subtractor|bit4|sum~0_combout\,
	datab => price_reg(3),
	datac => \subtractor|subtractor|bit2|c_out~combout\,
	datad => \accumulator|temp2\(3),
	combout => \subtractor|subtractor|bit4|c_out~0_combout\);

-- Location: LCCOMB_X50_Y23_N26
\Selector3~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector3~3_combout\ = price_reg(5) $ (((\subtractor|subtractor|bit4|c_out~0_combout\) # ((\accumulator|temp2\(4) & !price_reg(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2\(4),
	datab => \subtractor|subtractor|bit4|c_out~0_combout\,
	datac => price_reg(5),
	datad => price_reg(4),
	combout => \Selector3~3_combout\);

-- Location: LCCOMB_X50_Y23_N6
\Selector3~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector3~2_combout\ = (\accumulator|temp2\(5) & (((\Selector3~3_combout\ & \CSTATE.soda_dispensation~q\)) # (!\CSTATE.INIT_STATE~q\))) # (!\accumulator|temp2\(5) & (!\Selector3~3_combout\ & (\CSTATE.soda_dispensation~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector3~3_combout\,
	datab => \CSTATE.soda_dispensation~q\,
	datac => \accumulator|temp2\(5),
	datad => \CSTATE.INIT_STATE~q\,
	combout => \Selector3~2_combout\);

-- Location: IOIBUF_X52_Y21_N8
\S1[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S1(6),
	o => \S1[6]~input_o\);

-- Location: IOIBUF_X52_Y21_N1
\S0[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S0(6),
	o => \S0[6]~input_o\);

-- Location: LCCOMB_X51_Y23_N20
\mux|output[6]~28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[6]~28_combout\ = (\mux|output[0]~8_combout\ & (\mux|output[0]~9_combout\)) # (!\mux|output[0]~8_combout\ & ((\mux|output[0]~9_combout\ & (\S1[6]~input_o\)) # (!\mux|output[0]~9_combout\ & ((\S0[6]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~8_combout\,
	datab => \mux|output[0]~9_combout\,
	datac => \S1[6]~input_o\,
	datad => \S0[6]~input_o\,
	combout => \mux|output[6]~28_combout\);

-- Location: IOIBUF_X52_Y27_N8
\S3[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S3(6),
	o => \S3[6]~input_o\);

-- Location: IOIBUF_X52_Y9_N8
\S2[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S2(6),
	o => \S2[6]~input_o\);

-- Location: LCCOMB_X51_Y23_N2
\mux|output[6]~29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[6]~29_combout\ = (\mux|output[0]~8_combout\ & ((\mux|output[6]~28_combout\ & ((\S2[6]~input_o\))) # (!\mux|output[6]~28_combout\ & (\S3[6]~input_o\)))) # (!\mux|output[0]~8_combout\ & (\mux|output[6]~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mux|output[0]~8_combout\,
	datab => \mux|output[6]~28_combout\,
	datac => \S3[6]~input_o\,
	datad => \S2[6]~input_o\,
	combout => \mux|output[6]~29_combout\);

-- Location: IOIBUF_X52_Y21_N15
\S4[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S4(6),
	o => \S4[6]~input_o\);

-- Location: LCCOMB_X51_Y23_N14
\mux|output[6]~30\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output[6]~30_combout\ = (\mux|output[0]~11_combout\ & ((\S4[6]~input_o\))) # (!\mux|output[0]~11_combout\ & (\mux|output[6]~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mux|output[6]~29_combout\,
	datac => \S4[6]~input_o\,
	datad => \mux|output[0]~11_combout\,
	combout => \mux|output[6]~30_combout\);

-- Location: LCCOMB_X51_Y23_N8
\mux|output[6]\ : cycloneiv_lcell_comb
-- Equation(s):
-- \mux|output\(6) = (GLOBAL(\mux|output[7]~13clkctrl_outclk\) & (\mux|output[6]~30_combout\)) # (!GLOBAL(\mux|output[7]~13clkctrl_outclk\) & ((\mux|output\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \mux|output[6]~30_combout\,
	datac => \mux|output\(6),
	datad => \mux|output[7]~13clkctrl_outclk\,
	combout => \mux|output\(6));

-- Location: FF_X51_Y23_N9
\price_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \mux|output\(6),
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => price_reg(6));

-- Location: LCCOMB_X50_Y23_N2
\Selector2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\CSTATE.soda_dispensation~q\ & (\subtractor|subtractor|bit5|c_out~combout\ $ (price_reg(6) $ (!\accumulator|temp2\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \subtractor|subtractor|bit5|c_out~combout\,
	datab => \CSTATE.soda_dispensation~q\,
	datac => price_reg(6),
	datad => \accumulator|temp2\(6),
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X50_Y23_N4
\Selector2~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\Selector2~0_combout\) # ((!\CSTATE.INIT_STATE~q\ & \accumulator|temp2\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CSTATE.INIT_STATE~q\,
	datac => \Selector2~0_combout\,
	datad => \accumulator|temp2\(6),
	combout => \Selector2~1_combout\);

-- Location: LCCOMB_X50_Y23_N0
\Selector1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector1~0_combout\ = price_reg(7) $ (((\subtractor|subtractor|bit5|c_out~combout\ & ((\accumulator|temp2\(6)) # (!price_reg(6)))) # (!\subtractor|subtractor|bit5|c_out~combout\ & (\accumulator|temp2\(6) & !price_reg(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000110001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \subtractor|subtractor|bit5|c_out~combout\,
	datab => \accumulator|temp2\(6),
	datac => price_reg(6),
	datad => price_reg(7),
	combout => \Selector1~0_combout\);

-- Location: LCCOMB_X50_Y23_N10
\Selector1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Selector1~1_combout\ = (\accumulator|temp2\(7) & (((\CSTATE.soda_dispensation~q\ & \Selector1~0_combout\)) # (!\CSTATE.INIT_STATE~q\))) # (!\accumulator|temp2\(7) & (((\CSTATE.soda_dispensation~q\ & !\Selector1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \accumulator|temp2\(7),
	datab => \CSTATE.INIT_STATE~q\,
	datac => \CSTATE.soda_dispensation~q\,
	datad => \Selector1~0_combout\,
	combout => \Selector1~1_combout\);

-- Location: IOIBUF_X27_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: FF_X47_Y23_N9
\choice_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \choice[0]~input_o\,
	sload => VCC,
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => choice_reg(0));

-- Location: LCCOMB_X46_Y23_N6
\D~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D~0_combout\ = (\CSTATE.soda_dispensation~q\ & choice_reg(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CSTATE.soda_dispensation~q\,
	datac => choice_reg(0),
	combout => \D~0_combout\);

-- Location: FF_X47_Y23_N1
\choice_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \choice[2]~input_o\,
	sload => VCC,
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => choice_reg(2));

-- Location: LCCOMB_X49_Y23_N0
\stock_S0_reg[1]~33\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[1]~33_cout\ = CARRY(!stock_S0_reg(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(0),
	datad => VCC,
	cout => \stock_S0_reg[1]~33_cout\);

-- Location: LCCOMB_X49_Y23_N2
\stock_S0_reg[1]~34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[1]~34_combout\ = (stock_S0_reg(1) & (\stock_S0_reg[1]~33_cout\ & VCC)) # (!stock_S0_reg(1) & (!\stock_S0_reg[1]~33_cout\))
-- \stock_S0_reg[1]~35\ = CARRY((!stock_S0_reg(1) & !\stock_S0_reg[1]~33_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(1),
	datad => VCC,
	cin => \stock_S0_reg[1]~33_cout\,
	combout => \stock_S0_reg[1]~34_combout\,
	cout => \stock_S0_reg[1]~35\);

-- Location: LCCOMB_X48_Y22_N8
\LessThan1~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~5_combout\ = (!stock_S0_reg(19) & (!stock_S0_reg(16) & (!stock_S0_reg(17) & !stock_S0_reg(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(19),
	datab => stock_S0_reg(16),
	datac => stock_S0_reg(17),
	datad => stock_S0_reg(18),
	combout => \LessThan1~5_combout\);

-- Location: LCCOMB_X49_Y22_N26
\stock_S0_reg[29]~90\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[29]~90_combout\ = (stock_S0_reg(29) & (\stock_S0_reg[28]~89\ & VCC)) # (!stock_S0_reg(29) & (!\stock_S0_reg[28]~89\))
-- \stock_S0_reg[29]~91\ = CARRY((!stock_S0_reg(29) & !\stock_S0_reg[28]~89\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(29),
	datad => VCC,
	cin => \stock_S0_reg[28]~89\,
	combout => \stock_S0_reg[29]~90_combout\,
	cout => \stock_S0_reg[29]~91\);

-- Location: FF_X49_Y22_N27
\stock_S0_reg[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[29]~90_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(29));

-- Location: LCCOMB_X49_Y22_N22
\stock_S0_reg[27]~86\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[27]~86_combout\ = (stock_S0_reg(27) & (\stock_S0_reg[26]~85\ & VCC)) # (!stock_S0_reg(27) & (!\stock_S0_reg[26]~85\))
-- \stock_S0_reg[27]~87\ = CARRY((!stock_S0_reg(27) & !\stock_S0_reg[26]~85\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(27),
	datad => VCC,
	cin => \stock_S0_reg[26]~85\,
	combout => \stock_S0_reg[27]~86_combout\,
	cout => \stock_S0_reg[27]~87\);

-- Location: FF_X49_Y22_N23
\stock_S0_reg[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[27]~86_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(27));

-- Location: LCCOMB_X48_Y22_N0
\LessThan1~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~7_combout\ = (!stock_S0_reg(26) & (!stock_S0_reg(27) & (!stock_S0_reg(24) & !stock_S0_reg(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(26),
	datab => stock_S0_reg(27),
	datac => stock_S0_reg(24),
	datad => stock_S0_reg(25),
	combout => \LessThan1~7_combout\);

-- Location: LCCOMB_X47_Y23_N14
\LessThan1~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~8_combout\ = (!stock_S0_reg(30) & (!stock_S0_reg(28) & (!stock_S0_reg(29) & \LessThan1~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(30),
	datab => stock_S0_reg(28),
	datac => stock_S0_reg(29),
	datad => \LessThan1~7_combout\,
	combout => \LessThan1~8_combout\);

-- Location: LCCOMB_X49_Y23_N26
\stock_S0_reg[13]~58\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[13]~58_combout\ = (stock_S0_reg(13) & (\stock_S0_reg[12]~57\ & VCC)) # (!stock_S0_reg(13) & (!\stock_S0_reg[12]~57\))
-- \stock_S0_reg[13]~59\ = CARRY((!stock_S0_reg(13) & !\stock_S0_reg[12]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(13),
	datad => VCC,
	cin => \stock_S0_reg[12]~57\,
	combout => \stock_S0_reg[13]~58_combout\,
	cout => \stock_S0_reg[13]~59\);

-- Location: FF_X49_Y23_N27
\stock_S0_reg[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[13]~58_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(13));

-- Location: LCCOMB_X48_Y23_N0
\LessThan1~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~3_combout\ = (!stock_S0_reg(15) & (!stock_S0_reg(13) & (!stock_S0_reg(12) & !stock_S0_reg(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(15),
	datab => stock_S0_reg(13),
	datac => stock_S0_reg(12),
	datad => stock_S0_reg(14),
	combout => \LessThan1~3_combout\);

-- Location: LCCOMB_X49_Y23_N22
\stock_S0_reg[11]~54\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[11]~54_combout\ = (stock_S0_reg(11) & (\stock_S0_reg[10]~53\ & VCC)) # (!stock_S0_reg(11) & (!\stock_S0_reg[10]~53\))
-- \stock_S0_reg[11]~55\ = CARRY((!stock_S0_reg(11) & !\stock_S0_reg[10]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(11),
	datad => VCC,
	cin => \stock_S0_reg[10]~53\,
	combout => \stock_S0_reg[11]~54_combout\,
	cout => \stock_S0_reg[11]~55\);

-- Location: FF_X49_Y23_N23
\stock_S0_reg[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[11]~54_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(11));

-- Location: LCCOMB_X48_Y23_N30
\LessThan1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~2_combout\ = (!stock_S0_reg(10) & (!stock_S0_reg(8) & (!stock_S0_reg(9) & !stock_S0_reg(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(10),
	datab => stock_S0_reg(8),
	datac => stock_S0_reg(9),
	datad => stock_S0_reg(11),
	combout => \LessThan1~2_combout\);

-- Location: LCCOMB_X49_Y23_N10
\stock_S0_reg[5]~42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[5]~42_combout\ = (stock_S0_reg(5) & (\stock_S0_reg[4]~41\ & VCC)) # (!stock_S0_reg(5) & (!\stock_S0_reg[4]~41\))
-- \stock_S0_reg[5]~43\ = CARRY((!stock_S0_reg(5) & !\stock_S0_reg[4]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(5),
	datad => VCC,
	cin => \stock_S0_reg[4]~41\,
	combout => \stock_S0_reg[5]~42_combout\,
	cout => \stock_S0_reg[5]~43\);

-- Location: FF_X49_Y23_N11
\stock_S0_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[5]~42_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(5));

-- Location: LCCOMB_X49_Y23_N12
\stock_S0_reg[6]~44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[6]~44_combout\ = (stock_S0_reg(6) & ((GND) # (!\stock_S0_reg[5]~43\))) # (!stock_S0_reg(6) & (\stock_S0_reg[5]~43\ $ (GND)))
-- \stock_S0_reg[6]~45\ = CARRY((stock_S0_reg(6)) # (!\stock_S0_reg[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(6),
	datad => VCC,
	cin => \stock_S0_reg[5]~43\,
	combout => \stock_S0_reg[6]~44_combout\,
	cout => \stock_S0_reg[6]~45\);

-- Location: FF_X49_Y23_N13
\stock_S0_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[6]~44_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(6));

-- Location: LCCOMB_X48_Y23_N28
\LessThan1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (!stock_S0_reg(4) & (!stock_S0_reg(5) & (!stock_S0_reg(7) & !stock_S0_reg(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(4),
	datab => stock_S0_reg(5),
	datac => stock_S0_reg(7),
	datad => stock_S0_reg(6),
	combout => \LessThan1~1_combout\);

-- Location: LCCOMB_X48_Y23_N26
\LessThan1~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~4_combout\ = (\LessThan1~0_combout\ & (\LessThan1~3_combout\ & (\LessThan1~2_combout\ & \LessThan1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \LessThan1~3_combout\,
	datac => \LessThan1~2_combout\,
	datad => \LessThan1~1_combout\,
	combout => \LessThan1~4_combout\);

-- Location: LCCOMB_X47_Y23_N20
\LessThan1~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~9_combout\ = (\LessThan1~6_combout\ & (\LessThan1~5_combout\ & (\LessThan1~8_combout\ & \LessThan1~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~6_combout\,
	datab => \LessThan1~5_combout\,
	datac => \LessThan1~8_combout\,
	datad => \LessThan1~4_combout\,
	combout => \LessThan1~9_combout\);

-- Location: LCCOMB_X48_Y23_N6
\stock_S0_reg[31]~96\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[31]~96_combout\ = (\stock_S0_reg[31]~31_combout\ & (\CSTATE.soda_dispensation~q\ & (!stock_S0_reg(31) & !\LessThan1~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stock_S0_reg[31]~31_combout\,
	datab => \CSTATE.soda_dispensation~q\,
	datac => stock_S0_reg(31),
	datad => \LessThan1~9_combout\,
	combout => \stock_S0_reg[31]~96_combout\);

-- Location: FF_X49_Y23_N3
\stock_S0_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[1]~34_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(1));

-- Location: LCCOMB_X49_Y23_N4
\stock_S0_reg[2]~36\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[2]~36_combout\ = (stock_S0_reg(2) & ((GND) # (!\stock_S0_reg[1]~35\))) # (!stock_S0_reg(2) & (\stock_S0_reg[1]~35\ $ (GND)))
-- \stock_S0_reg[2]~37\ = CARRY((stock_S0_reg(2)) # (!\stock_S0_reg[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(2),
	datad => VCC,
	cin => \stock_S0_reg[1]~35\,
	combout => \stock_S0_reg[2]~36_combout\,
	cout => \stock_S0_reg[2]~37\);

-- Location: FF_X49_Y23_N5
\stock_S0_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[2]~36_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(2));

-- Location: LCCOMB_X49_Y23_N8
\stock_S0_reg[4]~40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[4]~40_combout\ = (stock_S0_reg(4) & ((GND) # (!\stock_S0_reg[3]~39\))) # (!stock_S0_reg(4) & (\stock_S0_reg[3]~39\ $ (GND)))
-- \stock_S0_reg[4]~41\ = CARRY((stock_S0_reg(4)) # (!\stock_S0_reg[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(4),
	datad => VCC,
	cin => \stock_S0_reg[3]~39\,
	combout => \stock_S0_reg[4]~40_combout\,
	cout => \stock_S0_reg[4]~41\);

-- Location: FF_X49_Y23_N9
\stock_S0_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[4]~40_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(4));

-- Location: LCCOMB_X49_Y23_N14
\stock_S0_reg[7]~46\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[7]~46_combout\ = (stock_S0_reg(7) & (\stock_S0_reg[6]~45\ & VCC)) # (!stock_S0_reg(7) & (!\stock_S0_reg[6]~45\))
-- \stock_S0_reg[7]~47\ = CARRY((!stock_S0_reg(7) & !\stock_S0_reg[6]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(7),
	datad => VCC,
	cin => \stock_S0_reg[6]~45\,
	combout => \stock_S0_reg[7]~46_combout\,
	cout => \stock_S0_reg[7]~47\);

-- Location: FF_X49_Y23_N15
\stock_S0_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[7]~46_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(7));

-- Location: LCCOMB_X49_Y23_N16
\stock_S0_reg[8]~48\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[8]~48_combout\ = (stock_S0_reg(8) & ((GND) # (!\stock_S0_reg[7]~47\))) # (!stock_S0_reg(8) & (\stock_S0_reg[7]~47\ $ (GND)))
-- \stock_S0_reg[8]~49\ = CARRY((stock_S0_reg(8)) # (!\stock_S0_reg[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(8),
	datad => VCC,
	cin => \stock_S0_reg[7]~47\,
	combout => \stock_S0_reg[8]~48_combout\,
	cout => \stock_S0_reg[8]~49\);

-- Location: FF_X49_Y23_N17
\stock_S0_reg[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[8]~48_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(8));

-- Location: LCCOMB_X49_Y23_N18
\stock_S0_reg[9]~50\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[9]~50_combout\ = (stock_S0_reg(9) & (\stock_S0_reg[8]~49\ & VCC)) # (!stock_S0_reg(9) & (!\stock_S0_reg[8]~49\))
-- \stock_S0_reg[9]~51\ = CARRY((!stock_S0_reg(9) & !\stock_S0_reg[8]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(9),
	datad => VCC,
	cin => \stock_S0_reg[8]~49\,
	combout => \stock_S0_reg[9]~50_combout\,
	cout => \stock_S0_reg[9]~51\);

-- Location: FF_X49_Y23_N19
\stock_S0_reg[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[9]~50_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(9));

-- Location: LCCOMB_X49_Y23_N20
\stock_S0_reg[10]~52\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[10]~52_combout\ = (stock_S0_reg(10) & ((GND) # (!\stock_S0_reg[9]~51\))) # (!stock_S0_reg(10) & (\stock_S0_reg[9]~51\ $ (GND)))
-- \stock_S0_reg[10]~53\ = CARRY((stock_S0_reg(10)) # (!\stock_S0_reg[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(10),
	datad => VCC,
	cin => \stock_S0_reg[9]~51\,
	combout => \stock_S0_reg[10]~52_combout\,
	cout => \stock_S0_reg[10]~53\);

-- Location: FF_X49_Y23_N21
\stock_S0_reg[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[10]~52_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(10));

-- Location: LCCOMB_X49_Y23_N24
\stock_S0_reg[12]~56\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[12]~56_combout\ = (stock_S0_reg(12) & ((GND) # (!\stock_S0_reg[11]~55\))) # (!stock_S0_reg(12) & (\stock_S0_reg[11]~55\ $ (GND)))
-- \stock_S0_reg[12]~57\ = CARRY((stock_S0_reg(12)) # (!\stock_S0_reg[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(12),
	datad => VCC,
	cin => \stock_S0_reg[11]~55\,
	combout => \stock_S0_reg[12]~56_combout\,
	cout => \stock_S0_reg[12]~57\);

-- Location: FF_X49_Y23_N25
\stock_S0_reg[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[12]~56_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(12));

-- Location: LCCOMB_X49_Y23_N28
\stock_S0_reg[14]~60\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[14]~60_combout\ = (stock_S0_reg(14) & ((GND) # (!\stock_S0_reg[13]~59\))) # (!stock_S0_reg(14) & (\stock_S0_reg[13]~59\ $ (GND)))
-- \stock_S0_reg[14]~61\ = CARRY((stock_S0_reg(14)) # (!\stock_S0_reg[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(14),
	datad => VCC,
	cin => \stock_S0_reg[13]~59\,
	combout => \stock_S0_reg[14]~60_combout\,
	cout => \stock_S0_reg[14]~61\);

-- Location: FF_X49_Y23_N29
\stock_S0_reg[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[14]~60_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(14));

-- Location: LCCOMB_X49_Y22_N0
\stock_S0_reg[16]~64\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[16]~64_combout\ = (stock_S0_reg(16) & ((GND) # (!\stock_S0_reg[15]~63\))) # (!stock_S0_reg(16) & (\stock_S0_reg[15]~63\ $ (GND)))
-- \stock_S0_reg[16]~65\ = CARRY((stock_S0_reg(16)) # (!\stock_S0_reg[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(16),
	datad => VCC,
	cin => \stock_S0_reg[15]~63\,
	combout => \stock_S0_reg[16]~64_combout\,
	cout => \stock_S0_reg[16]~65\);

-- Location: FF_X49_Y22_N1
\stock_S0_reg[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[16]~64_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(16));

-- Location: LCCOMB_X49_Y22_N2
\stock_S0_reg[17]~66\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[17]~66_combout\ = (stock_S0_reg(17) & (\stock_S0_reg[16]~65\ & VCC)) # (!stock_S0_reg(17) & (!\stock_S0_reg[16]~65\))
-- \stock_S0_reg[17]~67\ = CARRY((!stock_S0_reg(17) & !\stock_S0_reg[16]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(17),
	datad => VCC,
	cin => \stock_S0_reg[16]~65\,
	combout => \stock_S0_reg[17]~66_combout\,
	cout => \stock_S0_reg[17]~67\);

-- Location: FF_X49_Y22_N3
\stock_S0_reg[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[17]~66_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(17));

-- Location: LCCOMB_X49_Y22_N4
\stock_S0_reg[18]~68\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[18]~68_combout\ = (stock_S0_reg(18) & ((GND) # (!\stock_S0_reg[17]~67\))) # (!stock_S0_reg(18) & (\stock_S0_reg[17]~67\ $ (GND)))
-- \stock_S0_reg[18]~69\ = CARRY((stock_S0_reg(18)) # (!\stock_S0_reg[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(18),
	datad => VCC,
	cin => \stock_S0_reg[17]~67\,
	combout => \stock_S0_reg[18]~68_combout\,
	cout => \stock_S0_reg[18]~69\);

-- Location: FF_X49_Y22_N5
\stock_S0_reg[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[18]~68_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(18));

-- Location: LCCOMB_X49_Y22_N8
\stock_S0_reg[20]~72\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[20]~72_combout\ = (stock_S0_reg(20) & ((GND) # (!\stock_S0_reg[19]~71\))) # (!stock_S0_reg(20) & (\stock_S0_reg[19]~71\ $ (GND)))
-- \stock_S0_reg[20]~73\ = CARRY((stock_S0_reg(20)) # (!\stock_S0_reg[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(20),
	datad => VCC,
	cin => \stock_S0_reg[19]~71\,
	combout => \stock_S0_reg[20]~72_combout\,
	cout => \stock_S0_reg[20]~73\);

-- Location: FF_X49_Y22_N9
\stock_S0_reg[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[20]~72_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(20));

-- Location: LCCOMB_X49_Y22_N14
\stock_S0_reg[23]~78\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[23]~78_combout\ = (stock_S0_reg(23) & (\stock_S0_reg[22]~77\ & VCC)) # (!stock_S0_reg(23) & (!\stock_S0_reg[22]~77\))
-- \stock_S0_reg[23]~79\ = CARRY((!stock_S0_reg(23) & !\stock_S0_reg[22]~77\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(23),
	datad => VCC,
	cin => \stock_S0_reg[22]~77\,
	combout => \stock_S0_reg[23]~78_combout\,
	cout => \stock_S0_reg[23]~79\);

-- Location: FF_X49_Y22_N15
\stock_S0_reg[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[23]~78_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(23));

-- Location: LCCOMB_X49_Y22_N16
\stock_S0_reg[24]~80\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[24]~80_combout\ = (stock_S0_reg(24) & ((GND) # (!\stock_S0_reg[23]~79\))) # (!stock_S0_reg(24) & (\stock_S0_reg[23]~79\ $ (GND)))
-- \stock_S0_reg[24]~81\ = CARRY((stock_S0_reg(24)) # (!\stock_S0_reg[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(24),
	datad => VCC,
	cin => \stock_S0_reg[23]~79\,
	combout => \stock_S0_reg[24]~80_combout\,
	cout => \stock_S0_reg[24]~81\);

-- Location: FF_X49_Y22_N17
\stock_S0_reg[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[24]~80_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(24));

-- Location: LCCOMB_X49_Y22_N18
\stock_S0_reg[25]~82\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[25]~82_combout\ = (stock_S0_reg(25) & (\stock_S0_reg[24]~81\ & VCC)) # (!stock_S0_reg(25) & (!\stock_S0_reg[24]~81\))
-- \stock_S0_reg[25]~83\ = CARRY((!stock_S0_reg(25) & !\stock_S0_reg[24]~81\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(25),
	datad => VCC,
	cin => \stock_S0_reg[24]~81\,
	combout => \stock_S0_reg[25]~82_combout\,
	cout => \stock_S0_reg[25]~83\);

-- Location: FF_X49_Y22_N19
\stock_S0_reg[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[25]~82_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(25));

-- Location: LCCOMB_X49_Y22_N20
\stock_S0_reg[26]~84\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[26]~84_combout\ = (stock_S0_reg(26) & ((GND) # (!\stock_S0_reg[25]~83\))) # (!stock_S0_reg(26) & (\stock_S0_reg[25]~83\ $ (GND)))
-- \stock_S0_reg[26]~85\ = CARRY((stock_S0_reg(26)) # (!\stock_S0_reg[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(26),
	datad => VCC,
	cin => \stock_S0_reg[25]~83\,
	combout => \stock_S0_reg[26]~84_combout\,
	cout => \stock_S0_reg[26]~85\);

-- Location: FF_X49_Y22_N21
\stock_S0_reg[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[26]~84_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(26));

-- Location: LCCOMB_X49_Y22_N24
\stock_S0_reg[28]~88\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[28]~88_combout\ = (stock_S0_reg(28) & ((GND) # (!\stock_S0_reg[27]~87\))) # (!stock_S0_reg(28) & (\stock_S0_reg[27]~87\ $ (GND)))
-- \stock_S0_reg[28]~89\ = CARRY((stock_S0_reg(28)) # (!\stock_S0_reg[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(28),
	datad => VCC,
	cin => \stock_S0_reg[27]~87\,
	combout => \stock_S0_reg[28]~88_combout\,
	cout => \stock_S0_reg[28]~89\);

-- Location: FF_X49_Y22_N25
\stock_S0_reg[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[28]~88_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(28));

-- Location: LCCOMB_X49_Y22_N28
\stock_S0_reg[30]~92\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[30]~92_combout\ = (stock_S0_reg(30) & ((GND) # (!\stock_S0_reg[29]~91\))) # (!stock_S0_reg(30) & (\stock_S0_reg[29]~91\ $ (GND)))
-- \stock_S0_reg[30]~93\ = CARRY((stock_S0_reg(30)) # (!\stock_S0_reg[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => stock_S0_reg(30),
	datad => VCC,
	cin => \stock_S0_reg[29]~91\,
	combout => \stock_S0_reg[30]~92_combout\,
	cout => \stock_S0_reg[30]~93\);

-- Location: FF_X49_Y22_N29
\stock_S0_reg[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[30]~92_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(30));

-- Location: LCCOMB_X49_Y22_N30
\stock_S0_reg[31]~94\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[31]~94_combout\ = stock_S0_reg(31) $ (!\stock_S0_reg[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => stock_S0_reg(31),
	cin => \stock_S0_reg[30]~93\,
	combout => \stock_S0_reg[31]~94_combout\);

-- Location: FF_X49_Y22_N31
\stock_S0_reg[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \stock_S0_reg[31]~94_combout\,
	ena => \stock_S0_reg[31]~96_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => stock_S0_reg(31));

-- Location: LCCOMB_X47_Y23_N18
\LessThan1~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~10_combout\ = (stock_S0_reg(31)) # (\LessThan1~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => stock_S0_reg(31),
	datad => \LessThan1~9_combout\,
	combout => \LessThan1~10_combout\);

-- Location: LCCOMB_X47_Y23_N28
\D[2]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D[2]~1_combout\ = (choice_reg(1) & (choice_reg(2))) # (!choice_reg(1) & (!choice_reg(2) & ((\LessThan1~10_combout\) # (!choice_reg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => choice_reg(1),
	datab => choice_reg(2),
	datac => choice_reg(0),
	datad => \LessThan1~10_combout\,
	combout => \D[2]~1_combout\);

-- Location: LCCOMB_X46_Y23_N24
\D[2]~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D[2]~2_combout\ = (!\D[2]~1_combout\) # (!\CSTATE.soda_dispensation~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CSTATE.soda_dispensation~q\,
	datad => \D[2]~1_combout\,
	combout => \D[2]~2_combout\);

-- Location: FF_X46_Y23_N7
\D[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \D~0_combout\,
	ena => \D[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \D[0]~reg0_q\);

-- Location: LCCOMB_X47_Y23_N10
\choice_reg[1]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \choice_reg[1]~feeder_combout\ = \choice[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \choice[1]~input_o\,
	combout => \choice_reg[1]~feeder_combout\);

-- Location: FF_X47_Y23_N11
\choice_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \choice_reg[1]~feeder_combout\,
	ena => \ALT_INV_CSTATE.INIT_STATE~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => choice_reg(1));

-- Location: LCCOMB_X46_Y23_N12
\D~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D~3_combout\ = (\CSTATE.soda_dispensation~q\ & choice_reg(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CSTATE.soda_dispensation~q\,
	datac => choice_reg(1),
	combout => \D~3_combout\);

-- Location: FF_X46_Y23_N13
\D[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \D~3_combout\,
	ena => \D[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \D[1]~reg0_q\);

-- Location: LCCOMB_X47_Y23_N0
\D~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \D~4_combout\ = (!choice_reg(1) & ((choice_reg(2)) # (!choice_reg(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => choice_reg(0),
	datac => choice_reg(2),
	datad => choice_reg(1),
	combout => \D~4_combout\);

-- Location: FF_X46_Y23_N25
\D[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \D~4_combout\,
	sclr => \ALT_INV_CSTATE.soda_dispensation~q\,
	sload => VCC,
	ena => \D[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \D[2]~reg0_q\);

-- Location: LCCOMB_X47_Y23_N8
\stock_S0_reg[31]~31\ : cycloneiv_lcell_comb
-- Equation(s):
-- \stock_S0_reg[31]~31_combout\ = (!choice_reg(2) & (choice_reg(0) & !choice_reg(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => choice_reg(2),
	datac => choice_reg(0),
	datad => choice_reg(1),
	combout => \stock_S0_reg[31]~31_combout\);

-- Location: LCCOMB_X48_Y23_N20
\ESTQ~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \ESTQ~0_combout\ = (\stock_S0_reg[31]~31_combout\ & (!\CSTATE.INIT_STATE~q\ & ((\LessThan1~9_combout\) # (stock_S0_reg(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stock_S0_reg[31]~31_combout\,
	datab => \LessThan1~9_combout\,
	datac => stock_S0_reg(31),
	datad => \CSTATE.INIT_STATE~q\,
	combout => \ESTQ~0_combout\);

ww_P(0) <= \P[0]~output_o\;

ww_P(1) <= \P[1]~output_o\;

ww_P(2) <= \P[2]~output_o\;

ww_P(3) <= \P[3]~output_o\;

ww_P(4) <= \P[4]~output_o\;

ww_P(5) <= \P[5]~output_o\;

ww_P(6) <= \P[6]~output_o\;

ww_P(7) <= \P[7]~output_o\;

ww_E(0) <= \E[0]~output_o\;

ww_E(1) <= \E[1]~output_o\;

ww_E(2) <= \E[2]~output_o\;

ww_E(3) <= \E[3]~output_o\;

ww_E(4) <= \E[4]~output_o\;

ww_E(5) <= \E[5]~output_o\;

ww_E(6) <= \E[6]~output_o\;

ww_E(7) <= \E[7]~output_o\;

ww_D(0) <= \D[0]~output_o\;

ww_D(1) <= \D[1]~output_o\;

ww_D(2) <= \D[2]~output_o\;

ww_ESTQ(0) <= \ESTQ[0]~output_o\;

ww_ESTQ(1) <= \ESTQ[1]~output_o\;

ww_ESTQ(2) <= \ESTQ[2]~output_o\;

ww_ESTQ(3) <= \ESTQ[3]~output_o\;

ww_ESTQ(4) <= \ESTQ[4]~output_o\;

ww_ESTQ(5) <= \ESTQ[5]~output_o\;

ww_ESTQ(6) <= \ESTQ[6]~output_o\;

ww_ESTQ(7) <= \ESTQ[7]~output_o\;
END structure;


