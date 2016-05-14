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

-- DATE "05/02/2016 22:24:34"

-- 
-- Device: Altera EP4CE115F29C9L Package FBGA780
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

ENTITY 	cont_lfsr IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	Sal_cont : OUT std_logic_vector(3 DOWNTO 0)
	);
END cont_lfsr;

-- Design Ports Information
-- Sal_cont[0]	=>  Location: PIN_U3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sal_cont[1]	=>  Location: PIN_U4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sal_cont[2]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sal_cont[3]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF cont_lfsr IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_Sal_cont : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Sal_cont[0]~output_o\ : std_logic;
SIGNAL \Sal_cont[1]~output_o\ : std_logic;
SIGNAL \Sal_cont[2]~output_o\ : std_logic;
SIGNAL \Sal_cont[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \feedback~combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ff1|Sal_int~q\ : std_logic;
SIGNAL \ffs:2:ff2|Sal_int~0_combout\ : std_logic;
SIGNAL \ffs:2:ff2|Sal_int~q\ : std_logic;
SIGNAL \ffs:1:ff2|Sal_int~feeder_combout\ : std_logic;
SIGNAL \ffs:1:ff2|Sal_int~q\ : std_logic;
SIGNAL \ffs:0:ff2|Sal_int~feeder_combout\ : std_logic;
SIGNAL \ffs:0:ff2|Sal_int~q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ff1|ALT_INV_Sal_int~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
Sal_cont <= ww_Sal_cont;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ff1|ALT_INV_Sal_int~q\ <= NOT \ff1|Sal_int~q\;

-- Location: IOOBUF_X0_Y34_N9
\Sal_cont[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ffs:0:ff2|Sal_int~q\,
	devoe => ww_devoe,
	o => \Sal_cont[0]~output_o\);

-- Location: IOOBUF_X0_Y34_N16
\Sal_cont[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ffs:1:ff2|Sal_int~q\,
	devoe => ww_devoe,
	o => \Sal_cont[1]~output_o\);

-- Location: IOOBUF_X0_Y34_N23
\Sal_cont[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ffs:2:ff2|Sal_int~q\,
	devoe => ww_devoe,
	o => \Sal_cont[2]~output_o\);

-- Location: IOOBUF_X0_Y34_N2
\Sal_cont[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ff1|ALT_INV_Sal_int~q\,
	devoe => ww_devoe,
	o => \Sal_cont[3]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
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

-- Location: LCCOMB_X1_Y34_N18
feedback : cycloneive_lcell_comb
-- Equation(s):
-- \feedback~combout\ = \ffs:1:ff2|Sal_int~q\ $ (!\ffs:0:ff2|Sal_int~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ffs:1:ff2|Sal_int~q\,
	datad => \ffs:0:ff2|Sal_int~q\,
	combout => \feedback~combout\);

-- Location: IOIBUF_X0_Y36_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X1_Y34_N19
\ff1|Sal_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \feedback~combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ff1|Sal_int~q\);

-- Location: LCCOMB_X1_Y34_N28
\ffs:2:ff2|Sal_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ffs:2:ff2|Sal_int~0_combout\ = !\ff1|Sal_int~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ff1|Sal_int~q\,
	combout => \ffs:2:ff2|Sal_int~0_combout\);

-- Location: FF_X1_Y34_N29
\ffs:2:ff2|Sal_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ffs:2:ff2|Sal_int~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ffs:2:ff2|Sal_int~q\);

-- Location: LCCOMB_X1_Y34_N26
\ffs:1:ff2|Sal_int~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ffs:1:ff2|Sal_int~feeder_combout\ = \ffs:2:ff2|Sal_int~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ffs:2:ff2|Sal_int~q\,
	combout => \ffs:1:ff2|Sal_int~feeder_combout\);

-- Location: FF_X1_Y34_N27
\ffs:1:ff2|Sal_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ffs:1:ff2|Sal_int~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ffs:1:ff2|Sal_int~q\);

-- Location: LCCOMB_X1_Y34_N20
\ffs:0:ff2|Sal_int~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \ffs:0:ff2|Sal_int~feeder_combout\ = \ffs:1:ff2|Sal_int~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ffs:1:ff2|Sal_int~q\,
	combout => \ffs:0:ff2|Sal_int~feeder_combout\);

-- Location: FF_X1_Y34_N21
\ffs:0:ff2|Sal_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \ffs:0:ff2|Sal_int~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ffs:0:ff2|Sal_int~q\);

ww_Sal_cont(0) <= \Sal_cont[0]~output_o\;

ww_Sal_cont(1) <= \Sal_cont[1]~output_o\;

ww_Sal_cont(2) <= \Sal_cont[2]~output_o\;

ww_Sal_cont(3) <= \Sal_cont[3]~output_o\;
END structure;


