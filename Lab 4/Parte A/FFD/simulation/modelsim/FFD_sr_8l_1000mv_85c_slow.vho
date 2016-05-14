-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Lite Edition"

-- DATE "05/02/2016 18:08:16"

-- 
-- Device: Altera EP4CE115F29C8L Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FFD_sr IS
    PORT (
	set_int : IN std_logic;
	reset_int : IN std_logic;
	data_int : IN std_logic;
	clk_int : IN std_logic;
	Sal_int : OUT std_logic
	);
END FFD_sr;

-- Design Ports Information
-- Sal_int	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- set_int	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_int	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_int	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_int	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FFD_sr IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_set_int : std_logic;
SIGNAL ww_reset_int : std_logic;
SIGNAL ww_data_int : std_logic;
SIGNAL ww_clk_int : std_logic;
SIGNAL ww_Sal_int : std_logic;
SIGNAL \Sal_int~output_o\ : std_logic;
SIGNAL \set_int~input_o\ : std_logic;
SIGNAL \reset_int~input_o\ : std_logic;
SIGNAL \Sal_int~1_combout\ : std_logic;
SIGNAL \clk_int~input_o\ : std_logic;
SIGNAL \data_int~input_o\ : std_logic;
SIGNAL \Sal_int~3_combout\ : std_logic;
SIGNAL \Sal_int~0_combout\ : std_logic;
SIGNAL \Sal_int~reg0_emulated_q\ : std_logic;
SIGNAL \Sal_int~2_combout\ : std_logic;
SIGNAL \ALT_INV_Sal_int~0_combout\ : std_logic;

BEGIN

ww_set_int <= set_int;
ww_reset_int <= reset_int;
ww_data_int <= data_int;
ww_clk_int <= clk_int;
Sal_int <= ww_Sal_int;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Sal_int~0_combout\ <= NOT \Sal_int~0_combout\;

-- Location: IOOBUF_X47_Y73_N2
\Sal_int~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Sal_int~2_combout\,
	devoe => ww_devoe,
	o => \Sal_int~output_o\);

-- Location: IOIBUF_X45_Y73_N8
\set_int~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_set_int,
	o => \set_int~input_o\);

-- Location: IOIBUF_X49_Y73_N15
\reset_int~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_int,
	o => \reset_int~input_o\);

-- Location: LCCOMB_X48_Y72_N6
\Sal_int~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sal_int~1_combout\ = (!\reset_int~input_o\ & ((\set_int~input_o\) # (\Sal_int~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \set_int~input_o\,
	datac => \reset_int~input_o\,
	datad => \Sal_int~1_combout\,
	combout => \Sal_int~1_combout\);

-- Location: IOIBUF_X47_Y73_N15
\clk_int~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_int,
	o => \clk_int~input_o\);

-- Location: IOIBUF_X49_Y73_N22
\data_int~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_int,
	o => \data_int~input_o\);

-- Location: LCCOMB_X48_Y72_N24
\Sal_int~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sal_int~3_combout\ = \Sal_int~1_combout\ $ (\data_int~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sal_int~1_combout\,
	datad => \data_int~input_o\,
	combout => \Sal_int~3_combout\);

-- Location: LCCOMB_X48_Y72_N28
\Sal_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sal_int~0_combout\ = (\reset_int~input_o\) # (\set_int~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset_int~input_o\,
	datad => \set_int~input_o\,
	combout => \Sal_int~0_combout\);

-- Location: FF_X48_Y72_N25
\Sal_int~reg0_emulated\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_int~input_o\,
	d => \Sal_int~3_combout\,
	clrn => \ALT_INV_Sal_int~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Sal_int~reg0_emulated_q\);

-- Location: LCCOMB_X48_Y72_N2
\Sal_int~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Sal_int~2_combout\ = (!\reset_int~input_o\ & ((\set_int~input_o\) # (\Sal_int~1_combout\ $ (\Sal_int~reg0_emulated_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Sal_int~1_combout\,
	datab => \set_int~input_o\,
	datac => \reset_int~input_o\,
	datad => \Sal_int~reg0_emulated_q\,
	combout => \Sal_int~2_combout\);

ww_Sal_int <= \Sal_int~output_o\;
END structure;


