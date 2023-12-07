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

-- DATE "12/01/2023 11:02:50"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
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

ENTITY 	acumulador8 IS
    PORT (
	clock : IN std_logic;
	reset_acumulador : IN std_logic;
	C : IN std_logic;
	dados_entrada : IN std_logic_vector(7 DOWNTO 0);
	dados_saida : OUT std_logic_vector(7 DOWNTO 0)
	);
END acumulador8;

-- Design Ports Information
-- dados_saida[0]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_saida[1]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_saida[2]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_saida[3]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_saida[4]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_saida[5]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_saida[6]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_saida[7]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_acumulador	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[0]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[1]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[2]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[4]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[5]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[6]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dados_entrada[7]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF acumulador8 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset_acumulador : std_logic;
SIGNAL ww_C : std_logic;
SIGNAL ww_dados_entrada : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_dados_saida : std_logic_vector(7 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \dados_entrada[6]~input_o\ : std_logic;
SIGNAL \dados_entrada[7]~input_o\ : std_logic;
SIGNAL \dados_saida[0]~output_o\ : std_logic;
SIGNAL \dados_saida[1]~output_o\ : std_logic;
SIGNAL \dados_saida[2]~output_o\ : std_logic;
SIGNAL \dados_saida[3]~output_o\ : std_logic;
SIGNAL \dados_saida[4]~output_o\ : std_logic;
SIGNAL \dados_saida[5]~output_o\ : std_logic;
SIGNAL \dados_saida[6]~output_o\ : std_logic;
SIGNAL \dados_saida[7]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \dados_entrada[0]~input_o\ : std_logic;
SIGNAL \reset_acumulador~input_o\ : std_logic;
SIGNAL \temp2~0_combout\ : std_logic;
SIGNAL \C~input_o\ : std_logic;
SIGNAL \temp2[0]~1_combout\ : std_logic;
SIGNAL \dados_entrada[1]~input_o\ : std_logic;
SIGNAL \somador|bit1|soma~0_combout\ : std_logic;
SIGNAL \temp2~2_combout\ : std_logic;
SIGNAL \dados_entrada[2]~input_o\ : std_logic;
SIGNAL \somador|bit1|c_out~0_combout\ : std_logic;
SIGNAL \temp2~3_combout\ : std_logic;
SIGNAL \somador|bit3|soma~0_combout\ : std_logic;
SIGNAL \temp2~4_combout\ : std_logic;
SIGNAL \dados_entrada[4]~input_o\ : std_logic;
SIGNAL \somador|bit4|soma~0_combout\ : std_logic;
SIGNAL \dados_entrada[3]~input_o\ : std_logic;
SIGNAL \somador|bit3|c_out~1_combout\ : std_logic;
SIGNAL \somador|bit3|c_out~2_combout\ : std_logic;
SIGNAL \temp2~5_combout\ : std_logic;
SIGNAL \somador|bit3|c_out~0_combout\ : std_logic;
SIGNAL \somador|bit4|c_out~0_combout\ : std_logic;
SIGNAL \temp2~6_combout\ : std_logic;
SIGNAL \dados_entrada[5]~input_o\ : std_logic;
SIGNAL \somador|bit5|c_out~0_combout\ : std_logic;
SIGNAL \temp2~7_combout\ : std_logic;
SIGNAL \temp2~8_combout\ : std_logic;
SIGNAL \temp2~9_combout\ : std_logic;
SIGNAL temp2 : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_clock <= clock;
ww_reset_acumulador <= reset_acumulador;
ww_C <= C;
ww_dados_entrada <= dados_entrada;
dados_saida <= ww_dados_saida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);

-- Location: IOIBUF_X31_Y0_N8
\dados_entrada[6]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(6),
	o => \dados_entrada[6]~input_o\);

-- Location: IOIBUF_X29_Y0_N1
\dados_entrada[7]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(7),
	o => \dados_entrada[7]~input_o\);

-- Location: IOOBUF_X12_Y0_N9
\dados_saida[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(0),
	devoe => ww_devoe,
	o => \dados_saida[0]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\dados_saida[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(1),
	devoe => ww_devoe,
	o => \dados_saida[1]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\dados_saida[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(2),
	devoe => ww_devoe,
	o => \dados_saida[2]~output_o\);

-- Location: IOOBUF_X24_Y0_N2
\dados_saida[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(3),
	devoe => ww_devoe,
	o => \dados_saida[3]~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\dados_saida[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(4),
	devoe => ww_devoe,
	o => \dados_saida[4]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\dados_saida[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(5),
	devoe => ww_devoe,
	o => \dados_saida[5]~output_o\);

-- Location: IOOBUF_X12_Y0_N2
\dados_saida[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(6),
	devoe => ww_devoe,
	o => \dados_saida[6]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\dados_saida[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp2(7),
	devoe => ww_devoe,
	o => \dados_saida[7]~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\clock~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G17
\clock~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X33_Y16_N1
\dados_entrada[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(0),
	o => \dados_entrada[0]~input_o\);

-- Location: IOIBUF_X33_Y16_N8
\reset_acumulador~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_acumulador,
	o => \reset_acumulador~input_o\);

-- Location: LCCOMB_X25_Y1_N4
\temp2~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~0_combout\ = (\reset_acumulador~input_o\ & (\dados_entrada[0]~input_o\ $ (temp2(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \dados_entrada[0]~input_o\,
	datac => temp2(0),
	datad => \reset_acumulador~input_o\,
	combout => \temp2~0_combout\);

-- Location: IOIBUF_X31_Y0_N1
\C~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C,
	o => \C~input_o\);

-- Location: LCCOMB_X26_Y1_N6
\temp2[0]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2[0]~1_combout\ = (\C~input_o\) # (!\reset_acumulador~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_acumulador~input_o\,
	datad => \C~input_o\,
	combout => \temp2[0]~1_combout\);

-- Location: FF_X25_Y1_N5
\temp2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~0_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(0));

-- Location: IOIBUF_X26_Y0_N1
\dados_entrada[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(1),
	o => \dados_entrada[1]~input_o\);

-- Location: LCCOMB_X25_Y1_N22
\somador|bit1|soma~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit1|soma~0_combout\ = \dados_entrada[1]~input_o\ $ (temp2(1) $ (((temp2(0) & \dados_entrada[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp2(0),
	datab => \dados_entrada[0]~input_o\,
	datac => \dados_entrada[1]~input_o\,
	datad => temp2(1),
	combout => \somador|bit1|soma~0_combout\);

-- Location: LCCOMB_X25_Y1_N10
\temp2~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~2_combout\ = (\somador|bit1|soma~0_combout\ & \reset_acumulador~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \somador|bit1|soma~0_combout\,
	datad => \reset_acumulador~input_o\,
	combout => \temp2~2_combout\);

-- Location: FF_X25_Y1_N11
\temp2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~2_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(1));

-- Location: IOIBUF_X29_Y0_N8
\dados_entrada[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(2),
	o => \dados_entrada[2]~input_o\);

-- Location: LCCOMB_X25_Y1_N28
\somador|bit1|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit1|c_out~0_combout\ = (\dados_entrada[1]~input_o\ & ((temp2(1)) # ((\dados_entrada[0]~input_o\ & temp2(0))))) # (!\dados_entrada[1]~input_o\ & (\dados_entrada[0]~input_o\ & (temp2(0) & temp2(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[1]~input_o\,
	datab => \dados_entrada[0]~input_o\,
	datac => temp2(0),
	datad => temp2(1),
	combout => \somador|bit1|c_out~0_combout\);

-- Location: LCCOMB_X25_Y1_N24
\temp2~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~3_combout\ = (\reset_acumulador~input_o\ & (\dados_entrada[2]~input_o\ $ (temp2(2) $ (\somador|bit1|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset_acumulador~input_o\,
	datab => \dados_entrada[2]~input_o\,
	datac => temp2(2),
	datad => \somador|bit1|c_out~0_combout\,
	combout => \temp2~3_combout\);

-- Location: FF_X25_Y1_N25
\temp2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~3_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(2));

-- Location: LCCOMB_X25_Y1_N30
\somador|bit3|soma~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit3|soma~0_combout\ = temp2(3) $ (((\dados_entrada[2]~input_o\ & ((temp2(2)) # (\somador|bit1|c_out~0_combout\))) # (!\dados_entrada[2]~input_o\ & (temp2(2) & \somador|bit1|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[2]~input_o\,
	datab => temp2(2),
	datac => temp2(3),
	datad => \somador|bit1|c_out~0_combout\,
	combout => \somador|bit3|soma~0_combout\);

-- Location: LCCOMB_X25_Y1_N6
\temp2~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~4_combout\ = (\reset_acumulador~input_o\ & (\dados_entrada[3]~input_o\ $ (\somador|bit3|soma~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[3]~input_o\,
	datac => \somador|bit3|soma~0_combout\,
	datad => \reset_acumulador~input_o\,
	combout => \temp2~4_combout\);

-- Location: FF_X25_Y1_N7
\temp2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~4_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(3));

-- Location: IOIBUF_X26_Y0_N8
\dados_entrada[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(4),
	o => \dados_entrada[4]~input_o\);

-- Location: LCCOMB_X26_Y1_N0
\somador|bit4|soma~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit4|soma~0_combout\ = temp2(4) $ (\dados_entrada[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => temp2(4),
	datad => \dados_entrada[4]~input_o\,
	combout => \somador|bit4|soma~0_combout\);

-- Location: IOIBUF_X22_Y0_N1
\dados_entrada[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(3),
	o => \dados_entrada[3]~input_o\);

-- Location: LCCOMB_X25_Y1_N26
\somador|bit3|c_out~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit3|c_out~1_combout\ = (\dados_entrada[3]~input_o\) # (temp2(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dados_entrada[3]~input_o\,
	datad => temp2(3),
	combout => \somador|bit3|c_out~1_combout\);

-- Location: LCCOMB_X25_Y1_N20
\somador|bit3|c_out~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit3|c_out~2_combout\ = (\somador|bit3|c_out~1_combout\ & ((\dados_entrada[2]~input_o\ & ((temp2(2)) # (\somador|bit1|c_out~0_combout\))) # (!\dados_entrada[2]~input_o\ & (temp2(2) & \somador|bit1|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[2]~input_o\,
	datab => temp2(2),
	datac => \somador|bit3|c_out~1_combout\,
	datad => \somador|bit1|c_out~0_combout\,
	combout => \somador|bit3|c_out~2_combout\);

-- Location: LCCOMB_X26_Y1_N4
\temp2~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~5_combout\ = (\reset_acumulador~input_o\ & (\somador|bit4|soma~0_combout\ $ (((\somador|bit3|c_out~0_combout\) # (\somador|bit3|c_out~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \somador|bit3|c_out~0_combout\,
	datab => \somador|bit4|soma~0_combout\,
	datac => \reset_acumulador~input_o\,
	datad => \somador|bit3|c_out~2_combout\,
	combout => \temp2~5_combout\);

-- Location: FF_X26_Y1_N5
\temp2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~5_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(4));

-- Location: LCCOMB_X25_Y1_N8
\somador|bit3|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit3|c_out~0_combout\ = (\dados_entrada[3]~input_o\ & temp2(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \dados_entrada[3]~input_o\,
	datad => temp2(3),
	combout => \somador|bit3|c_out~0_combout\);

-- Location: LCCOMB_X25_Y1_N2
\somador|bit4|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit4|c_out~0_combout\ = (temp2(4) & ((\dados_entrada[4]~input_o\) # ((\somador|bit3|c_out~0_combout\) # (\somador|bit3|c_out~2_combout\)))) # (!temp2(4) & (\dados_entrada[4]~input_o\ & ((\somador|bit3|c_out~0_combout\) # 
-- (\somador|bit3|c_out~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp2(4),
	datab => \dados_entrada[4]~input_o\,
	datac => \somador|bit3|c_out~0_combout\,
	datad => \somador|bit3|c_out~2_combout\,
	combout => \somador|bit4|c_out~0_combout\);

-- Location: LCCOMB_X25_Y1_N16
\temp2~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~6_combout\ = (\reset_acumulador~input_o\ & (\dados_entrada[5]~input_o\ $ (temp2(5) $ (\somador|bit4|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[5]~input_o\,
	datab => \reset_acumulador~input_o\,
	datac => temp2(5),
	datad => \somador|bit4|c_out~0_combout\,
	combout => \temp2~6_combout\);

-- Location: FF_X25_Y1_N17
\temp2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~6_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(5));

-- Location: IOIBUF_X22_Y0_N8
\dados_entrada[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dados_entrada(5),
	o => \dados_entrada[5]~input_o\);

-- Location: LCCOMB_X25_Y1_N0
\somador|bit5|c_out~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somador|bit5|c_out~0_combout\ = (temp2(5) & ((\dados_entrada[5]~input_o\) # (\somador|bit4|c_out~0_combout\))) # (!temp2(5) & (\dados_entrada[5]~input_o\ & \somador|bit4|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => temp2(5),
	datac => \dados_entrada[5]~input_o\,
	datad => \somador|bit4|c_out~0_combout\,
	combout => \somador|bit5|c_out~0_combout\);

-- Location: LCCOMB_X25_Y1_N14
\temp2~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~7_combout\ = (\reset_acumulador~input_o\ & (\dados_entrada[6]~input_o\ $ (temp2(6) $ (\somador|bit5|c_out~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[6]~input_o\,
	datab => \reset_acumulador~input_o\,
	datac => temp2(6),
	datad => \somador|bit5|c_out~0_combout\,
	combout => \temp2~7_combout\);

-- Location: FF_X25_Y1_N15
\temp2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~7_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(6));

-- Location: LCCOMB_X25_Y1_N18
\temp2~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~8_combout\ = (\dados_entrada[6]~input_o\ & ((temp2(6)) # (\somador|bit5|c_out~0_combout\))) # (!\dados_entrada[6]~input_o\ & (temp2(6) & \somador|bit5|c_out~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[6]~input_o\,
	datac => temp2(6),
	datad => \somador|bit5|c_out~0_combout\,
	combout => \temp2~8_combout\);

-- Location: LCCOMB_X25_Y1_N12
\temp2~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \temp2~9_combout\ = (\reset_acumulador~input_o\ & (\dados_entrada[7]~input_o\ $ (temp2(7) $ (\temp2~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \dados_entrada[7]~input_o\,
	datab => \reset_acumulador~input_o\,
	datac => temp2(7),
	datad => \temp2~8_combout\,
	combout => \temp2~9_combout\);

-- Location: FF_X25_Y1_N13
\temp2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \temp2~9_combout\,
	ena => \temp2[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp2(7));

ww_dados_saida(0) <= \dados_saida[0]~output_o\;

ww_dados_saida(1) <= \dados_saida[1]~output_o\;

ww_dados_saida(2) <= \dados_saida[2]~output_o\;

ww_dados_saida(3) <= \dados_saida[3]~output_o\;

ww_dados_saida(4) <= \dados_saida[4]~output_o\;

ww_dados_saida(5) <= \dados_saida[5]~output_o\;

ww_dados_saida(6) <= \dados_saida[6]~output_o\;

ww_dados_saida(7) <= \dados_saida[7]~output_o\;
END structure;


