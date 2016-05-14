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

-- DATE "05/12/2016 14:21:42"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
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

ENTITY 	SintetizadorFrec IS
    PORT (
	clock_50 : IN std_logic;
	clock_sel : IN std_logic_vector(2 DOWNTO 0);
	clock_out : BUFFER std_logic;
	siete_seg1 : BUFFER std_logic_vector(0 TO 6);
	siete_seg0 : BUFFER std_logic_vector(0 TO 6)
	);
END SintetizadorFrec;

-- Design Ports Information
-- clock_out	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- siete_seg0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- clock_sel[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_sel[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_sel[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SintetizadorFrec IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock_50 : std_logic;
SIGNAL ww_clock_sel : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_clock_out : std_logic;
SIGNAL ww_siete_seg1 : std_logic_vector(0 TO 6);
SIGNAL ww_siete_seg0 : std_logic_vector(0 TO 6);
SIGNAL \clock_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock_out~output_o\ : std_logic;
SIGNAL \siete_seg1[6]~output_o\ : std_logic;
SIGNAL \siete_seg1[5]~output_o\ : std_logic;
SIGNAL \siete_seg1[4]~output_o\ : std_logic;
SIGNAL \siete_seg1[3]~output_o\ : std_logic;
SIGNAL \siete_seg1[2]~output_o\ : std_logic;
SIGNAL \siete_seg1[1]~output_o\ : std_logic;
SIGNAL \siete_seg1[0]~output_o\ : std_logic;
SIGNAL \siete_seg0[6]~output_o\ : std_logic;
SIGNAL \siete_seg0[5]~output_o\ : std_logic;
SIGNAL \siete_seg0[4]~output_o\ : std_logic;
SIGNAL \siete_seg0[3]~output_o\ : std_logic;
SIGNAL \siete_seg0[2]~output_o\ : std_logic;
SIGNAL \siete_seg0[1]~output_o\ : std_logic;
SIGNAL \siete_seg0[0]~output_o\ : std_logic;
SIGNAL \clock_50~input_o\ : std_logic;
SIGNAL \clock_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \clock_sel[2]~input_o\ : std_logic;
SIGNAL \clock_sel[1]~input_o\ : std_logic;
SIGNAL \clock_sel[0]~input_o\ : std_logic;
SIGNAL \divisor|Mux3~0_combout\ : std_logic;
SIGNAL \divisor|Add0~0_combout\ : std_logic;
SIGNAL \divisor|Mux27~0_combout\ : std_logic;
SIGNAL \divisor|Add0~1\ : std_logic;
SIGNAL \divisor|Add0~2_combout\ : std_logic;
SIGNAL \divisor|Mux26~0_combout\ : std_logic;
SIGNAL \divisor|Add0~3\ : std_logic;
SIGNAL \divisor|Add0~4_combout\ : std_logic;
SIGNAL \divisor|Mux25~0_combout\ : std_logic;
SIGNAL \divisor|Add0~5\ : std_logic;
SIGNAL \divisor|Add0~6_combout\ : std_logic;
SIGNAL \divisor|Mux24~0_combout\ : std_logic;
SIGNAL \divisor|Add0~7\ : std_logic;
SIGNAL \divisor|Add0~8_combout\ : std_logic;
SIGNAL \divisor|Mux23~0_combout\ : std_logic;
SIGNAL \divisor|Add0~9\ : std_logic;
SIGNAL \divisor|Add0~10_combout\ : std_logic;
SIGNAL \divisor|Mux22~0_combout\ : std_logic;
SIGNAL \divisor|Add0~11\ : std_logic;
SIGNAL \divisor|Add0~12_combout\ : std_logic;
SIGNAL \divisor|Mux21~0_combout\ : std_logic;
SIGNAL \divisor|Add0~13\ : std_logic;
SIGNAL \divisor|Add0~14_combout\ : std_logic;
SIGNAL \divisor|Mux20~0_combout\ : std_logic;
SIGNAL \divisor|Add0~15\ : std_logic;
SIGNAL \divisor|Add0~16_combout\ : std_logic;
SIGNAL \divisor|Mux19~0_combout\ : std_logic;
SIGNAL \divisor|Add0~17\ : std_logic;
SIGNAL \divisor|Add0~18_combout\ : std_logic;
SIGNAL \divisor|Mux18~0_combout\ : std_logic;
SIGNAL \divisor|Add0~19\ : std_logic;
SIGNAL \divisor|Add0~20_combout\ : std_logic;
SIGNAL \divisor|Mux17~0_combout\ : std_logic;
SIGNAL \divisor|Add0~21\ : std_logic;
SIGNAL \divisor|Add0~22_combout\ : std_logic;
SIGNAL \divisor|Mux16~0_combout\ : std_logic;
SIGNAL \divisor|Add0~23\ : std_logic;
SIGNAL \divisor|Add0~24_combout\ : std_logic;
SIGNAL \divisor|Mux15~0_combout\ : std_logic;
SIGNAL \divisor|Add0~25\ : std_logic;
SIGNAL \divisor|Add0~26_combout\ : std_logic;
SIGNAL \divisor|Mux14~0_combout\ : std_logic;
SIGNAL \divisor|Add0~27\ : std_logic;
SIGNAL \divisor|Add0~28_combout\ : std_logic;
SIGNAL \divisor|Mux13~0_combout\ : std_logic;
SIGNAL \divisor|Add0~29\ : std_logic;
SIGNAL \divisor|Add0~30_combout\ : std_logic;
SIGNAL \divisor|Mux12~0_combout\ : std_logic;
SIGNAL \divisor|Add0~31\ : std_logic;
SIGNAL \divisor|Add0~32_combout\ : std_logic;
SIGNAL \divisor|Mux11~0_combout\ : std_logic;
SIGNAL \divisor|Add0~33\ : std_logic;
SIGNAL \divisor|Add0~34_combout\ : std_logic;
SIGNAL \divisor|Mux10~0_combout\ : std_logic;
SIGNAL \divisor|Add0~35\ : std_logic;
SIGNAL \divisor|Add0~36_combout\ : std_logic;
SIGNAL \divisor|Mux9~0_combout\ : std_logic;
SIGNAL \divisor|Add0~37\ : std_logic;
SIGNAL \divisor|Add0~38_combout\ : std_logic;
SIGNAL \divisor|Mux8~0_combout\ : std_logic;
SIGNAL \divisor|Add0~39\ : std_logic;
SIGNAL \divisor|Add0~40_combout\ : std_logic;
SIGNAL \divisor|Mux7~0_combout\ : std_logic;
SIGNAL \divisor|Add0~41\ : std_logic;
SIGNAL \divisor|Add0~43\ : std_logic;
SIGNAL \divisor|Add0~45\ : std_logic;
SIGNAL \divisor|Add0~46_combout\ : std_logic;
SIGNAL \divisor|Mux4~0_combout\ : std_logic;
SIGNAL \divisor|Add0~47\ : std_logic;
SIGNAL \divisor|Add0~48_combout\ : std_logic;
SIGNAL \divisor|LessThan2~0_combout\ : std_logic;
SIGNAL \divisor|LessThan3~2_combout\ : std_logic;
SIGNAL \divisor|LessThan1~0_combout\ : std_logic;
SIGNAL \divisor|LessThan1~1_combout\ : std_logic;
SIGNAL \divisor|LessThan1~2_combout\ : std_logic;
SIGNAL \divisor|LessThan1~3_combout\ : std_logic;
SIGNAL \divisor|LessThan1~4_combout\ : std_logic;
SIGNAL \divisor|Mux0~0_combout\ : std_logic;
SIGNAL \divisor|Add0~49\ : std_logic;
SIGNAL \divisor|Add0~50_combout\ : std_logic;
SIGNAL \divisor|Mux2~0_combout\ : std_logic;
SIGNAL \divisor|Add0~51\ : std_logic;
SIGNAL \divisor|Add0~53\ : std_logic;
SIGNAL \divisor|Add0~54_combout\ : std_logic;
SIGNAL \divisor|LessThan1~5_combout\ : std_logic;
SIGNAL \divisor|LessThan3~5_combout\ : std_logic;
SIGNAL \divisor|LessThan3~6_combout\ : std_logic;
SIGNAL \divisor|LessThan3~4_combout\ : std_logic;
SIGNAL \divisor|LessThan3~0_combout\ : std_logic;
SIGNAL \divisor|LessThan3~3_combout\ : std_logic;
SIGNAL \divisor|LessThan3~7_combout\ : std_logic;
SIGNAL \divisor|LessThan3~8_combout\ : std_logic;
SIGNAL \divisor|cuenta[19]~4_combout\ : std_logic;
SIGNAL \divisor|Mux5~0_combout\ : std_logic;
SIGNAL \divisor|Add0~44_combout\ : std_logic;
SIGNAL \divisor|LessThan4~0_combout\ : std_logic;
SIGNAL \divisor|LessThan4~1_combout\ : std_logic;
SIGNAL \divisor|LessThan4~2_combout\ : std_logic;
SIGNAL \divisor|LessThan4~3_combout\ : std_logic;
SIGNAL \divisor|LessThan4~4_combout\ : std_logic;
SIGNAL \divisor|LessThan4~5_combout\ : std_logic;
SIGNAL \divisor|LessThan4~6_combout\ : std_logic;
SIGNAL \divisor|cuenta[19]~3_combout\ : std_logic;
SIGNAL \divisor|Mux1~0_combout\ : std_logic;
SIGNAL \divisor|Add0~52_combout\ : std_logic;
SIGNAL \divisor|LessThan0~0_combout\ : std_logic;
SIGNAL \divisor|LessThan0~1_combout\ : std_logic;
SIGNAL \divisor|LessThan0~2_combout\ : std_logic;
SIGNAL \divisor|LessThan0~3_combout\ : std_logic;
SIGNAL \divisor|LessThan0~4_combout\ : std_logic;
SIGNAL \divisor|LessThan0~5_combout\ : std_logic;
SIGNAL \divisor|LessThan0~6_combout\ : std_logic;
SIGNAL \divisor|cuenta[19]~1_combout\ : std_logic;
SIGNAL \divisor|cuenta[19]~2_combout\ : std_logic;
SIGNAL \divisor|Mux6~0_combout\ : std_logic;
SIGNAL \divisor|Add0~42_combout\ : std_logic;
SIGNAL \divisor|LessThan3~1_combout\ : std_logic;
SIGNAL \divisor|LessThan2~1_combout\ : std_logic;
SIGNAL \divisor|LessThan2~2_combout\ : std_logic;
SIGNAL \divisor|LessThan2~3_combout\ : std_logic;
SIGNAL \divisor|LessThan2~4_combout\ : std_logic;
SIGNAL \divisor|LessThan2~5_combout\ : std_logic;
SIGNAL \divisor|LessThan2~6_combout\ : std_logic;
SIGNAL \divisor|Mux28~2_combout\ : std_logic;
SIGNAL \divisor|Mux28~3_combout\ : std_logic;
SIGNAL \divisor|Mux28~0_combout\ : std_logic;
SIGNAL \divisor|Mux28~1_combout\ : std_logic;
SIGNAL \divisor|Mux28~4_combout\ : std_logic;
SIGNAL \divisor|estado~q\ : std_logic;
SIGNAL \divisor|digito1[0]~0_combout\ : std_logic;
SIGNAL \divisor|Mux31~0_combout\ : std_logic;
SIGNAL \divisor|Mux32~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux6~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux5~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux4~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux3~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux2~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux1~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux0~0_combout\ : std_logic;
SIGNAL \divisor|Mux34~0_combout\ : std_logic;
SIGNAL \divisor|cuenta[19]~0_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux0~0_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux4~0_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux3~0_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux0~1_combout\ : std_logic;
SIGNAL \divisor|digito1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \divisor|digito0\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \sicronizadores|q\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \divisor|cuenta\ : std_logic_vector(27 DOWNTO 0);
SIGNAL \divisor|ALT_INV_digito0\ : std_logic_vector(2 DOWNTO 2);
SIGNAL \SieteSeg1|ALT_INV_Mux1~0_combout\ : std_logic;

BEGIN

ww_clock_50 <= clock_50;
ww_clock_sel <= clock_sel;
clock_out <= ww_clock_out;
siete_seg1 <= ww_siete_seg1;
siete_seg0 <= ww_siete_seg0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock_50~input_o\);
\divisor|ALT_INV_digito0\(2) <= NOT \divisor|digito0\(2);
\SieteSeg1|ALT_INV_Mux1~0_combout\ <= NOT \SieteSeg1|Mux1~0_combout\;

-- Location: IOOBUF_X69_Y73_N16
\clock_out~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \divisor|estado~q\,
	devoe => ww_devoe,
	o => \clock_out~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\siete_seg1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg1[6]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\siete_seg1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg1|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg1[5]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\siete_seg1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg1|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg1[4]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\siete_seg1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg1|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg1[3]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\siete_seg1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg1|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\siete_seg1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg1|ALT_INV_Mux1~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg1[1]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\siete_seg1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg1|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg1[0]~output_o\);

-- Location: IOOBUF_X115_Y69_N2
\siete_seg0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \divisor|ALT_INV_digito0\(2),
	devoe => ww_devoe,
	o => \siete_seg0[6]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\siete_seg0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg0|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg0[5]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\siete_seg0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg0|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg0[4]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\siete_seg0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg0[3]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\siete_seg0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \siete_seg0[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\siete_seg0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg0|Mux0~1_combout\,
	devoe => ww_devoe,
	o => \siete_seg0[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\siete_seg0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SieteSeg0|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \siete_seg0[0]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\clock_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock_50,
	o => \clock_50~input_o\);

-- Location: CLKCTRL_G4
\clock_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y15_N8
\clock_sel[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock_sel(2),
	o => \clock_sel[2]~input_o\);

-- Location: FF_X112_Y29_N13
\sicronizadores|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	asdata => \clock_sel[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sicronizadores|q\(2));

-- Location: IOIBUF_X115_Y14_N1
\clock_sel[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock_sel(1),
	o => \clock_sel[1]~input_o\);

-- Location: FF_X112_Y29_N3
\sicronizadores|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	asdata => \clock_sel[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sicronizadores|q\(1));

-- Location: IOIBUF_X115_Y17_N1
\clock_sel[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock_sel(0),
	o => \clock_sel[0]~input_o\);

-- Location: FF_X112_Y29_N1
\sicronizadores|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	asdata => \clock_sel[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sicronizadores|q\(0));

-- Location: LCCOMB_X111_Y29_N18
\divisor|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux3~0_combout\ = (\divisor|Add0~48_combout\ & (!\divisor|cuenta[19]~2_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~48_combout\,
	datab => \divisor|cuenta[19]~2_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux3~0_combout\);

-- Location: FF_X111_Y29_N19
\divisor|cuenta[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(24));

-- Location: LCCOMB_X110_Y30_N4
\divisor|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~0_combout\ = \divisor|cuenta\(0) $ (VCC)
-- \divisor|Add0~1\ = CARRY(\divisor|cuenta\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(0),
	datad => VCC,
	combout => \divisor|Add0~0_combout\,
	cout => \divisor|Add0~1\);

-- Location: LCCOMB_X109_Y30_N2
\divisor|Mux27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux27~0_combout\ = (\divisor|Add0~0_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~0_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~2_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux27~0_combout\);

-- Location: FF_X109_Y30_N3
\divisor|cuenta[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux27~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(0));

-- Location: LCCOMB_X110_Y30_N6
\divisor|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~2_combout\ = (\divisor|cuenta\(1) & (!\divisor|Add0~1\)) # (!\divisor|cuenta\(1) & ((\divisor|Add0~1\) # (GND)))
-- \divisor|Add0~3\ = CARRY((!\divisor|Add0~1\) # (!\divisor|cuenta\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(1),
	datad => VCC,
	cin => \divisor|Add0~1\,
	combout => \divisor|Add0~2_combout\,
	cout => \divisor|Add0~3\);

-- Location: LCCOMB_X111_Y30_N0
\divisor|Mux26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux26~0_combout\ = (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~3_combout\ & (\divisor|Add0~2_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~4_combout\,
	datab => \divisor|cuenta[19]~3_combout\,
	datac => \divisor|Add0~2_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux26~0_combout\);

-- Location: FF_X111_Y30_N1
\divisor|cuenta[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux26~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(1));

-- Location: LCCOMB_X110_Y30_N8
\divisor|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~4_combout\ = (\divisor|cuenta\(2) & (\divisor|Add0~3\ $ (GND))) # (!\divisor|cuenta\(2) & (!\divisor|Add0~3\ & VCC))
-- \divisor|Add0~5\ = CARRY((\divisor|cuenta\(2) & !\divisor|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(2),
	datad => VCC,
	cin => \divisor|Add0~3\,
	combout => \divisor|Add0~4_combout\,
	cout => \divisor|Add0~5\);

-- Location: LCCOMB_X111_Y30_N14
\divisor|Mux25~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux25~0_combout\ = (\divisor|Add0~4_combout\ & (!\divisor|cuenta[19]~3_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~4_combout\,
	datab => \divisor|cuenta[19]~3_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux25~0_combout\);

-- Location: FF_X111_Y30_N15
\divisor|cuenta[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux25~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(2));

-- Location: LCCOMB_X110_Y30_N10
\divisor|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~6_combout\ = (\divisor|cuenta\(3) & (!\divisor|Add0~5\)) # (!\divisor|cuenta\(3) & ((\divisor|Add0~5\) # (GND)))
-- \divisor|Add0~7\ = CARRY((!\divisor|Add0~5\) # (!\divisor|cuenta\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(3),
	datad => VCC,
	cin => \divisor|Add0~5\,
	combout => \divisor|Add0~6_combout\,
	cout => \divisor|Add0~7\);

-- Location: LCCOMB_X111_Y30_N20
\divisor|Mux24~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux24~0_combout\ = (\divisor|Add0~6_combout\ & (!\divisor|cuenta[19]~3_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~6_combout\,
	datab => \divisor|cuenta[19]~3_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux24~0_combout\);

-- Location: FF_X111_Y30_N21
\divisor|cuenta[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux24~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(3));

-- Location: LCCOMB_X110_Y30_N12
\divisor|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~8_combout\ = (\divisor|cuenta\(4) & (\divisor|Add0~7\ $ (GND))) # (!\divisor|cuenta\(4) & (!\divisor|Add0~7\ & VCC))
-- \divisor|Add0~9\ = CARRY((\divisor|cuenta\(4) & !\divisor|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(4),
	datad => VCC,
	cin => \divisor|Add0~7\,
	combout => \divisor|Add0~8_combout\,
	cout => \divisor|Add0~9\);

-- Location: LCCOMB_X111_Y30_N2
\divisor|Mux23~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux23~0_combout\ = (\divisor|Add0~8_combout\ & (!\divisor|cuenta[19]~3_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~8_combout\,
	datab => \divisor|cuenta[19]~3_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux23~0_combout\);

-- Location: FF_X111_Y30_N3
\divisor|cuenta[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux23~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(4));

-- Location: LCCOMB_X110_Y30_N14
\divisor|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~10_combout\ = (\divisor|cuenta\(5) & (!\divisor|Add0~9\)) # (!\divisor|cuenta\(5) & ((\divisor|Add0~9\) # (GND)))
-- \divisor|Add0~11\ = CARRY((!\divisor|Add0~9\) # (!\divisor|cuenta\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(5),
	datad => VCC,
	cin => \divisor|Add0~9\,
	combout => \divisor|Add0~10_combout\,
	cout => \divisor|Add0~11\);

-- Location: LCCOMB_X109_Y30_N24
\divisor|Mux22~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux22~0_combout\ = (\divisor|Add0~10_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~10_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~2_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux22~0_combout\);

-- Location: FF_X109_Y30_N25
\divisor|cuenta[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux22~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(5));

-- Location: LCCOMB_X110_Y30_N16
\divisor|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~12_combout\ = (\divisor|cuenta\(6) & (\divisor|Add0~11\ $ (GND))) # (!\divisor|cuenta\(6) & (!\divisor|Add0~11\ & VCC))
-- \divisor|Add0~13\ = CARRY((\divisor|cuenta\(6) & !\divisor|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(6),
	datad => VCC,
	cin => \divisor|Add0~11\,
	combout => \divisor|Add0~12_combout\,
	cout => \divisor|Add0~13\);

-- Location: LCCOMB_X111_Y30_N16
\divisor|Mux21~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux21~0_combout\ = (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~3_combout\ & (\divisor|Add0~12_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~4_combout\,
	datab => \divisor|cuenta[19]~3_combout\,
	datac => \divisor|Add0~12_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux21~0_combout\);

-- Location: FF_X111_Y30_N17
\divisor|cuenta[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux21~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(6));

-- Location: LCCOMB_X110_Y30_N18
\divisor|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~14_combout\ = (\divisor|cuenta\(7) & (!\divisor|Add0~13\)) # (!\divisor|cuenta\(7) & ((\divisor|Add0~13\) # (GND)))
-- \divisor|Add0~15\ = CARRY((!\divisor|Add0~13\) # (!\divisor|cuenta\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(7),
	datad => VCC,
	cin => \divisor|Add0~13\,
	combout => \divisor|Add0~14_combout\,
	cout => \divisor|Add0~15\);

-- Location: LCCOMB_X111_Y30_N6
\divisor|Mux20~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux20~0_combout\ = (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~14_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~2_combout\,
	datab => \divisor|Add0~14_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux20~0_combout\);

-- Location: FF_X111_Y30_N7
\divisor|cuenta[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux20~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(7));

-- Location: LCCOMB_X110_Y30_N20
\divisor|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~16_combout\ = (\divisor|cuenta\(8) & (\divisor|Add0~15\ $ (GND))) # (!\divisor|cuenta\(8) & (!\divisor|Add0~15\ & VCC))
-- \divisor|Add0~17\ = CARRY((\divisor|cuenta\(8) & !\divisor|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(8),
	datad => VCC,
	cin => \divisor|Add0~15\,
	combout => \divisor|Add0~16_combout\,
	cout => \divisor|Add0~17\);

-- Location: LCCOMB_X111_Y30_N28
\divisor|Mux19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux19~0_combout\ = (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~16_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~2_combout\,
	datab => \divisor|Add0~16_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux19~0_combout\);

-- Location: FF_X111_Y30_N29
\divisor|cuenta[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux19~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(8));

-- Location: LCCOMB_X110_Y30_N22
\divisor|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~18_combout\ = (\divisor|cuenta\(9) & (!\divisor|Add0~17\)) # (!\divisor|cuenta\(9) & ((\divisor|Add0~17\) # (GND)))
-- \divisor|Add0~19\ = CARRY((!\divisor|Add0~17\) # (!\divisor|cuenta\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(9),
	datad => VCC,
	cin => \divisor|Add0~17\,
	combout => \divisor|Add0~18_combout\,
	cout => \divisor|Add0~19\);

-- Location: LCCOMB_X111_Y30_N26
\divisor|Mux18~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux18~0_combout\ = (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~18_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~2_combout\,
	datab => \divisor|Add0~18_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux18~0_combout\);

-- Location: FF_X111_Y30_N27
\divisor|cuenta[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux18~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(9));

-- Location: LCCOMB_X110_Y30_N24
\divisor|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~20_combout\ = (\divisor|cuenta\(10) & (\divisor|Add0~19\ $ (GND))) # (!\divisor|cuenta\(10) & (!\divisor|Add0~19\ & VCC))
-- \divisor|Add0~21\ = CARRY((\divisor|cuenta\(10) & !\divisor|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(10),
	datad => VCC,
	cin => \divisor|Add0~19\,
	combout => \divisor|Add0~20_combout\,
	cout => \divisor|Add0~21\);

-- Location: LCCOMB_X109_Y30_N6
\divisor|Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux17~0_combout\ = (!\divisor|cuenta[19]~3_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & \divisor|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~3_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~2_combout\,
	datad => \divisor|Add0~20_combout\,
	combout => \divisor|Mux17~0_combout\);

-- Location: FF_X109_Y30_N7
\divisor|cuenta[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux17~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(10));

-- Location: LCCOMB_X110_Y30_N26
\divisor|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~22_combout\ = (\divisor|cuenta\(11) & (!\divisor|Add0~21\)) # (!\divisor|cuenta\(11) & ((\divisor|Add0~21\) # (GND)))
-- \divisor|Add0~23\ = CARRY((!\divisor|Add0~21\) # (!\divisor|cuenta\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(11),
	datad => VCC,
	cin => \divisor|Add0~21\,
	combout => \divisor|Add0~22_combout\,
	cout => \divisor|Add0~23\);

-- Location: LCCOMB_X109_Y30_N12
\divisor|Mux16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux16~0_combout\ = (!\divisor|cuenta[19]~3_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & \divisor|Add0~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~3_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~2_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|Mux16~0_combout\);

-- Location: FF_X109_Y30_N13
\divisor|cuenta[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux16~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(11));

-- Location: LCCOMB_X110_Y30_N28
\divisor|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~24_combout\ = (\divisor|cuenta\(12) & (\divisor|Add0~23\ $ (GND))) # (!\divisor|cuenta\(12) & (!\divisor|Add0~23\ & VCC))
-- \divisor|Add0~25\ = CARRY((\divisor|cuenta\(12) & !\divisor|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(12),
	datad => VCC,
	cin => \divisor|Add0~23\,
	combout => \divisor|Add0~24_combout\,
	cout => \divisor|Add0~25\);

-- Location: LCCOMB_X109_Y30_N10
\divisor|Mux15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux15~0_combout\ = (!\divisor|cuenta[19]~3_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & \divisor|Add0~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~3_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~2_combout\,
	datad => \divisor|Add0~24_combout\,
	combout => \divisor|Mux15~0_combout\);

-- Location: FF_X109_Y30_N11
\divisor|cuenta[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux15~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(12));

-- Location: LCCOMB_X110_Y30_N30
\divisor|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~26_combout\ = (\divisor|cuenta\(13) & (!\divisor|Add0~25\)) # (!\divisor|cuenta\(13) & ((\divisor|Add0~25\) # (GND)))
-- \divisor|Add0~27\ = CARRY((!\divisor|Add0~25\) # (!\divisor|cuenta\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(13),
	datad => VCC,
	cin => \divisor|Add0~25\,
	combout => \divisor|Add0~26_combout\,
	cout => \divisor|Add0~27\);

-- Location: LCCOMB_X109_Y30_N16
\divisor|Mux14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux14~0_combout\ = (\divisor|Add0~26_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~26_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~2_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux14~0_combout\);

-- Location: FF_X109_Y30_N17
\divisor|cuenta[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux14~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(13));

-- Location: LCCOMB_X110_Y29_N0
\divisor|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~28_combout\ = (\divisor|cuenta\(14) & (\divisor|Add0~27\ $ (GND))) # (!\divisor|cuenta\(14) & (!\divisor|Add0~27\ & VCC))
-- \divisor|Add0~29\ = CARRY((\divisor|cuenta\(14) & !\divisor|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(14),
	datad => VCC,
	cin => \divisor|Add0~27\,
	combout => \divisor|Add0~28_combout\,
	cout => \divisor|Add0~29\);

-- Location: LCCOMB_X109_Y29_N4
\divisor|Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~0_combout\ = (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~28_combout\ & (!\divisor|cuenta[19]~3_combout\ & !\divisor|cuenta[19]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~2_combout\,
	datab => \divisor|Add0~28_combout\,
	datac => \divisor|cuenta[19]~3_combout\,
	datad => \divisor|cuenta[19]~4_combout\,
	combout => \divisor|Mux13~0_combout\);

-- Location: FF_X109_Y29_N5
\divisor|cuenta[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux13~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(14));

-- Location: LCCOMB_X110_Y29_N2
\divisor|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~30_combout\ = (\divisor|cuenta\(15) & (!\divisor|Add0~29\)) # (!\divisor|cuenta\(15) & ((\divisor|Add0~29\) # (GND)))
-- \divisor|Add0~31\ = CARRY((!\divisor|Add0~29\) # (!\divisor|cuenta\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(15),
	datad => VCC,
	cin => \divisor|Add0~29\,
	combout => \divisor|Add0~30_combout\,
	cout => \divisor|Add0~31\);

-- Location: LCCOMB_X111_Y29_N0
\divisor|Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux12~0_combout\ = (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~30_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~4_combout\,
	datab => \divisor|cuenta[19]~2_combout\,
	datac => \divisor|Add0~30_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux12~0_combout\);

-- Location: FF_X111_Y29_N1
\divisor|cuenta[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(15));

-- Location: LCCOMB_X110_Y29_N4
\divisor|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~32_combout\ = (\divisor|cuenta\(16) & (\divisor|Add0~31\ $ (GND))) # (!\divisor|cuenta\(16) & (!\divisor|Add0~31\ & VCC))
-- \divisor|Add0~33\ = CARRY((\divisor|cuenta\(16) & !\divisor|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(16),
	datad => VCC,
	cin => \divisor|Add0~31\,
	combout => \divisor|Add0~32_combout\,
	cout => \divisor|Add0~33\);

-- Location: LCCOMB_X111_Y29_N6
\divisor|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux11~0_combout\ = (!\divisor|cuenta[19]~3_combout\ & (\divisor|Add0~32_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~3_combout\,
	datab => \divisor|Add0~32_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux11~0_combout\);

-- Location: FF_X111_Y29_N7
\divisor|cuenta[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(16));

-- Location: LCCOMB_X110_Y29_N6
\divisor|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~34_combout\ = (\divisor|cuenta\(17) & (!\divisor|Add0~33\)) # (!\divisor|cuenta\(17) & ((\divisor|Add0~33\) # (GND)))
-- \divisor|Add0~35\ = CARRY((!\divisor|Add0~33\) # (!\divisor|cuenta\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(17),
	datad => VCC,
	cin => \divisor|Add0~33\,
	combout => \divisor|Add0~34_combout\,
	cout => \divisor|Add0~35\);

-- Location: LCCOMB_X111_Y30_N8
\divisor|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux10~0_combout\ = (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~3_combout\ & (\divisor|Add0~34_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~4_combout\,
	datab => \divisor|cuenta[19]~3_combout\,
	datac => \divisor|Add0~34_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux10~0_combout\);

-- Location: FF_X111_Y30_N9
\divisor|cuenta[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(17));

-- Location: LCCOMB_X110_Y29_N8
\divisor|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~36_combout\ = (\divisor|cuenta\(18) & (\divisor|Add0~35\ $ (GND))) # (!\divisor|cuenta\(18) & (!\divisor|Add0~35\ & VCC))
-- \divisor|Add0~37\ = CARRY((\divisor|cuenta\(18) & !\divisor|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(18),
	datad => VCC,
	cin => \divisor|Add0~35\,
	combout => \divisor|Add0~36_combout\,
	cout => \divisor|Add0~37\);

-- Location: LCCOMB_X109_Y29_N2
\divisor|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux9~0_combout\ = (!\divisor|cuenta[19]~2_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~3_combout\ & \divisor|Add0~36_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~2_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~3_combout\,
	datad => \divisor|Add0~36_combout\,
	combout => \divisor|Mux9~0_combout\);

-- Location: FF_X109_Y29_N3
\divisor|cuenta[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(18));

-- Location: LCCOMB_X110_Y29_N10
\divisor|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~38_combout\ = (\divisor|cuenta\(19) & (!\divisor|Add0~37\)) # (!\divisor|cuenta\(19) & ((\divisor|Add0~37\) # (GND)))
-- \divisor|Add0~39\ = CARRY((!\divisor|Add0~37\) # (!\divisor|cuenta\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(19),
	datad => VCC,
	cin => \divisor|Add0~37\,
	combout => \divisor|Add0~38_combout\,
	cout => \divisor|Add0~39\);

-- Location: LCCOMB_X110_Y29_N28
\divisor|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux8~0_combout\ = (\divisor|Add0~38_combout\ & (!\divisor|cuenta[19]~2_combout\ & (!\divisor|cuenta[19]~3_combout\ & !\divisor|cuenta[19]~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~38_combout\,
	datab => \divisor|cuenta[19]~2_combout\,
	datac => \divisor|cuenta[19]~3_combout\,
	datad => \divisor|cuenta[19]~4_combout\,
	combout => \divisor|Mux8~0_combout\);

-- Location: FF_X110_Y29_N29
\divisor|cuenta[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(19));

-- Location: LCCOMB_X110_Y29_N12
\divisor|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~40_combout\ = (\divisor|cuenta\(20) & (\divisor|Add0~39\ $ (GND))) # (!\divisor|cuenta\(20) & (!\divisor|Add0~39\ & VCC))
-- \divisor|Add0~41\ = CARRY((\divisor|cuenta\(20) & !\divisor|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(20),
	datad => VCC,
	cin => \divisor|Add0~39\,
	combout => \divisor|Add0~40_combout\,
	cout => \divisor|Add0~41\);

-- Location: LCCOMB_X111_Y29_N20
\divisor|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux7~0_combout\ = (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~40_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~4_combout\,
	datab => \divisor|cuenta[19]~2_combout\,
	datac => \divisor|Add0~40_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux7~0_combout\);

-- Location: FF_X111_Y29_N21
\divisor|cuenta[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(20));

-- Location: LCCOMB_X110_Y29_N14
\divisor|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~42_combout\ = (\divisor|cuenta\(21) & (!\divisor|Add0~41\)) # (!\divisor|cuenta\(21) & ((\divisor|Add0~41\) # (GND)))
-- \divisor|Add0~43\ = CARRY((!\divisor|Add0~41\) # (!\divisor|cuenta\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(21),
	datad => VCC,
	cin => \divisor|Add0~41\,
	combout => \divisor|Add0~42_combout\,
	cout => \divisor|Add0~43\);

-- Location: LCCOMB_X110_Y29_N16
\divisor|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~44_combout\ = (\divisor|cuenta\(22) & (\divisor|Add0~43\ $ (GND))) # (!\divisor|cuenta\(22) & (!\divisor|Add0~43\ & VCC))
-- \divisor|Add0~45\ = CARRY((\divisor|cuenta\(22) & !\divisor|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(22),
	datad => VCC,
	cin => \divisor|Add0~43\,
	combout => \divisor|Add0~44_combout\,
	cout => \divisor|Add0~45\);

-- Location: LCCOMB_X110_Y29_N18
\divisor|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~46_combout\ = (\divisor|cuenta\(23) & (!\divisor|Add0~45\)) # (!\divisor|cuenta\(23) & ((\divisor|Add0~45\) # (GND)))
-- \divisor|Add0~47\ = CARRY((!\divisor|Add0~45\) # (!\divisor|cuenta\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(23),
	datad => VCC,
	cin => \divisor|Add0~45\,
	combout => \divisor|Add0~46_combout\,
	cout => \divisor|Add0~47\);

-- Location: LCCOMB_X111_Y29_N24
\divisor|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux4~0_combout\ = (!\divisor|cuenta[19]~3_combout\ & (\divisor|Add0~46_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~3_combout\,
	datab => \divisor|Add0~46_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux4~0_combout\);

-- Location: FF_X111_Y29_N25
\divisor|cuenta[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(23));

-- Location: LCCOMB_X110_Y29_N20
\divisor|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~48_combout\ = (\divisor|cuenta\(24) & (\divisor|Add0~47\ $ (GND))) # (!\divisor|cuenta\(24) & (!\divisor|Add0~47\ & VCC))
-- \divisor|Add0~49\ = CARRY((\divisor|cuenta\(24) & !\divisor|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(24),
	datad => VCC,
	cin => \divisor|Add0~47\,
	combout => \divisor|Add0~48_combout\,
	cout => \divisor|Add0~49\);

-- Location: LCCOMB_X111_Y30_N4
\divisor|LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~0_combout\ = (!\divisor|Add0~16_combout\ & (!\divisor|Add0~18_combout\ & !\divisor|Add0~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|Add0~16_combout\,
	datac => \divisor|Add0~18_combout\,
	datad => \divisor|Add0~14_combout\,
	combout => \divisor|LessThan2~0_combout\);

-- Location: LCCOMB_X109_Y30_N0
\divisor|LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~2_combout\ = (\divisor|Add0~26_combout\ & \divisor|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \divisor|Add0~26_combout\,
	datad => \divisor|Add0~24_combout\,
	combout => \divisor|LessThan3~2_combout\);

-- Location: LCCOMB_X109_Y30_N26
\divisor|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~0_combout\ = (\divisor|Add0~30_combout\ & (\divisor|Add0~34_combout\ & (\divisor|Add0~28_combout\ & \divisor|LessThan3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~30_combout\,
	datab => \divisor|Add0~34_combout\,
	datac => \divisor|Add0~28_combout\,
	datad => \divisor|LessThan3~2_combout\,
	combout => \divisor|LessThan1~0_combout\);

-- Location: LCCOMB_X109_Y30_N4
\divisor|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~1_combout\ = (\divisor|LessThan1~0_combout\ & (((\divisor|Add0~20_combout\) # (\divisor|Add0~22_combout\)) # (!\divisor|LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan2~0_combout\,
	datab => \divisor|Add0~20_combout\,
	datac => \divisor|LessThan1~0_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan1~1_combout\);

-- Location: LCCOMB_X109_Y29_N22
\divisor|LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~2_combout\ = (\divisor|LessThan1~1_combout\) # ((\divisor|Add0~36_combout\) # ((\divisor|Add0~32_combout\ & \divisor|Add0~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~32_combout\,
	datab => \divisor|LessThan1~1_combout\,
	datac => \divisor|Add0~36_combout\,
	datad => \divisor|Add0~34_combout\,
	combout => \divisor|LessThan1~2_combout\);

-- Location: LCCOMB_X109_Y29_N0
\divisor|LessThan1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~3_combout\ = (\divisor|LessThan3~1_combout\ & (\divisor|Add0~44_combout\ & (\divisor|LessThan1~2_combout\ & \divisor|Add0~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan3~1_combout\,
	datab => \divisor|Add0~44_combout\,
	datac => \divisor|LessThan1~2_combout\,
	datad => \divisor|Add0~46_combout\,
	combout => \divisor|LessThan1~3_combout\);

-- Location: LCCOMB_X111_Y29_N12
\divisor|LessThan1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~4_combout\ = (\divisor|Add0~48_combout\) # (\divisor|LessThan1~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~48_combout\,
	datac => \divisor|LessThan1~3_combout\,
	combout => \divisor|LessThan1~4_combout\);

-- Location: LCCOMB_X111_Y29_N8
\divisor|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux0~0_combout\ = (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~54_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~4_combout\,
	datab => \divisor|cuenta[19]~2_combout\,
	datac => \divisor|Add0~54_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux0~0_combout\);

-- Location: FF_X111_Y29_N9
\divisor|cuenta[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(27));

-- Location: LCCOMB_X110_Y29_N22
\divisor|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~50_combout\ = (\divisor|cuenta\(25) & (!\divisor|Add0~49\)) # (!\divisor|cuenta\(25) & ((\divisor|Add0~49\) # (GND)))
-- \divisor|Add0~51\ = CARRY((!\divisor|Add0~49\) # (!\divisor|cuenta\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(25),
	datad => VCC,
	cin => \divisor|Add0~49\,
	combout => \divisor|Add0~50_combout\,
	cout => \divisor|Add0~51\);

-- Location: LCCOMB_X111_Y29_N28
\divisor|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux2~0_combout\ = (!\divisor|cuenta[19]~3_combout\ & (\divisor|Add0~50_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~3_combout\,
	datab => \divisor|Add0~50_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux2~0_combout\);

-- Location: FF_X111_Y29_N29
\divisor|cuenta[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(25));

-- Location: LCCOMB_X110_Y29_N24
\divisor|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~52_combout\ = (\divisor|cuenta\(26) & (\divisor|Add0~51\ $ (GND))) # (!\divisor|cuenta\(26) & (!\divisor|Add0~51\ & VCC))
-- \divisor|Add0~53\ = CARRY((\divisor|cuenta\(26) & !\divisor|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(26),
	datad => VCC,
	cin => \divisor|Add0~51\,
	combout => \divisor|Add0~52_combout\,
	cout => \divisor|Add0~53\);

-- Location: LCCOMB_X110_Y29_N26
\divisor|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~54_combout\ = \divisor|cuenta\(27) $ (\divisor|Add0~53\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(27),
	cin => \divisor|Add0~53\,
	combout => \divisor|Add0~54_combout\);

-- Location: LCCOMB_X111_Y29_N22
\divisor|LessThan1~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~5_combout\ = (\divisor|Add0~52_combout\) # ((\divisor|Add0~54_combout\) # ((\divisor|LessThan1~4_combout\ & \divisor|Add0~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan1~4_combout\,
	datab => \divisor|Add0~52_combout\,
	datac => \divisor|Add0~54_combout\,
	datad => \divisor|Add0~50_combout\,
	combout => \divisor|LessThan1~5_combout\);

-- Location: LCCOMB_X109_Y30_N20
\divisor|LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~5_combout\ = (\divisor|LessThan3~2_combout\ & (\divisor|Add0~22_combout\ & (\divisor|Add0~30_combout\ & \divisor|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan3~2_combout\,
	datab => \divisor|Add0~22_combout\,
	datac => \divisor|Add0~30_combout\,
	datad => \divisor|Add0~20_combout\,
	combout => \divisor|LessThan3~5_combout\);

-- Location: LCCOMB_X109_Y30_N30
\divisor|LessThan3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~6_combout\ = (\divisor|LessThan3~5_combout\ & (((\divisor|Add0~10_combout\) # (\divisor|Add0~12_combout\)) # (!\divisor|LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan2~0_combout\,
	datab => \divisor|LessThan3~5_combout\,
	datac => \divisor|Add0~10_combout\,
	datad => \divisor|Add0~12_combout\,
	combout => \divisor|LessThan3~6_combout\);

-- Location: LCCOMB_X109_Y29_N18
\divisor|LessThan3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~4_combout\ = (\divisor|LessThan3~1_combout\ & (\divisor|Add0~46_combout\ & (\divisor|Add0~36_combout\ & \divisor|Add0~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan3~1_combout\,
	datab => \divisor|Add0~46_combout\,
	datac => \divisor|Add0~36_combout\,
	datad => \divisor|Add0~34_combout\,
	combout => \divisor|LessThan3~4_combout\);

-- Location: LCCOMB_X111_Y29_N26
\divisor|LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~0_combout\ = (!\divisor|Add0~48_combout\ & (!\divisor|Add0~52_combout\ & (!\divisor|Add0~54_combout\ & !\divisor|Add0~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~48_combout\,
	datab => \divisor|Add0~52_combout\,
	datac => \divisor|Add0~54_combout\,
	datad => \divisor|Add0~50_combout\,
	combout => \divisor|LessThan3~0_combout\);

-- Location: LCCOMB_X109_Y29_N8
\divisor|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~3_combout\ = ((\divisor|Add0~44_combout\ & \divisor|Add0~46_combout\)) # (!\divisor|LessThan3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|Add0~44_combout\,
	datac => \divisor|LessThan3~0_combout\,
	datad => \divisor|Add0~46_combout\,
	combout => \divisor|LessThan3~3_combout\);

-- Location: LCCOMB_X109_Y29_N20
\divisor|LessThan3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~7_combout\ = (\divisor|Add0~32_combout\) # ((\divisor|Add0~28_combout\ & \divisor|Add0~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~32_combout\,
	datac => \divisor|Add0~28_combout\,
	datad => \divisor|Add0~30_combout\,
	combout => \divisor|LessThan3~7_combout\);

-- Location: LCCOMB_X109_Y29_N14
\divisor|LessThan3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~8_combout\ = (\divisor|LessThan3~3_combout\) # ((\divisor|LessThan3~4_combout\ & ((\divisor|LessThan3~6_combout\) # (\divisor|LessThan3~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan3~6_combout\,
	datab => \divisor|LessThan3~4_combout\,
	datac => \divisor|LessThan3~3_combout\,
	datad => \divisor|LessThan3~7_combout\,
	combout => \divisor|LessThan3~8_combout\);

-- Location: LCCOMB_X111_Y30_N30
\divisor|cuenta[19]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[19]~4_combout\ = (\sicronizadores|q\(0) & ((\sicronizadores|q\(1) & ((\divisor|LessThan3~8_combout\))) # (!\sicronizadores|q\(1) & (\divisor|LessThan1~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan1~5_combout\,
	datab => \divisor|LessThan3~8_combout\,
	datac => \sicronizadores|q\(1),
	datad => \sicronizadores|q\(0),
	combout => \divisor|cuenta[19]~4_combout\);

-- Location: LCCOMB_X111_Y29_N10
\divisor|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux5~0_combout\ = (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~2_combout\ & (\divisor|Add0~44_combout\ & !\divisor|cuenta[19]~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~4_combout\,
	datab => \divisor|cuenta[19]~2_combout\,
	datac => \divisor|Add0~44_combout\,
	datad => \divisor|cuenta[19]~3_combout\,
	combout => \divisor|Mux5~0_combout\);

-- Location: FF_X111_Y29_N11
\divisor|cuenta[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(22));

-- Location: LCCOMB_X109_Y29_N30
\divisor|LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~0_combout\ = (\divisor|Add0~46_combout\) # ((\divisor|Add0~44_combout\ & ((\divisor|Add0~42_combout\) # (\divisor|Add0~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~44_combout\,
	datab => \divisor|Add0~42_combout\,
	datac => \divisor|Add0~40_combout\,
	datad => \divisor|Add0~46_combout\,
	combout => \divisor|LessThan4~0_combout\);

-- Location: LCCOMB_X111_Y30_N18
\divisor|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~1_combout\ = (\divisor|Add0~18_combout\ & (\divisor|Add0~16_combout\ & ((\divisor|Add0~12_combout\) # (\divisor|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~18_combout\,
	datab => \divisor|Add0~16_combout\,
	datac => \divisor|Add0~12_combout\,
	datad => \divisor|Add0~14_combout\,
	combout => \divisor|LessThan4~1_combout\);

-- Location: LCCOMB_X110_Y30_N0
\divisor|LessThan4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~2_combout\ = (\divisor|Add0~22_combout\ & ((\divisor|Add0~20_combout\) # (\divisor|LessThan4~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|Add0~20_combout\,
	datac => \divisor|Add0~22_combout\,
	datad => \divisor|LessThan4~1_combout\,
	combout => \divisor|LessThan4~2_combout\);

-- Location: LCCOMB_X109_Y30_N28
\divisor|LessThan4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~3_combout\ = (\divisor|Add0~28_combout\ & ((\divisor|LessThan4~2_combout\) # ((\divisor|Add0~26_combout\) # (\divisor|Add0~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~28_combout\,
	datab => \divisor|LessThan4~2_combout\,
	datac => \divisor|Add0~26_combout\,
	datad => \divisor|Add0~24_combout\,
	combout => \divisor|LessThan4~3_combout\);

-- Location: LCCOMB_X109_Y30_N22
\divisor|LessThan4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~4_combout\ = (\divisor|Add0~30_combout\) # ((\divisor|Add0~32_combout\) # ((\divisor|Add0~34_combout\) # (\divisor|LessThan4~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~30_combout\,
	datab => \divisor|Add0~32_combout\,
	datac => \divisor|Add0~34_combout\,
	datad => \divisor|LessThan4~3_combout\,
	combout => \divisor|LessThan4~4_combout\);

-- Location: LCCOMB_X109_Y29_N24
\divisor|LessThan4~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~5_combout\ = (\divisor|Add0~36_combout\ & (\divisor|Add0~38_combout\ & \divisor|Add0~44_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|Add0~36_combout\,
	datac => \divisor|Add0~38_combout\,
	datad => \divisor|Add0~44_combout\,
	combout => \divisor|LessThan4~5_combout\);

-- Location: LCCOMB_X109_Y29_N26
\divisor|LessThan4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~6_combout\ = (\divisor|LessThan4~0_combout\) # (((\divisor|LessThan4~4_combout\ & \divisor|LessThan4~5_combout\)) # (!\divisor|LessThan3~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan4~0_combout\,
	datab => \divisor|LessThan4~4_combout\,
	datac => \divisor|LessThan3~0_combout\,
	datad => \divisor|LessThan4~5_combout\,
	combout => \divisor|LessThan4~6_combout\);

-- Location: LCCOMB_X112_Y29_N2
\divisor|cuenta[19]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[19]~3_combout\ = (\sicronizadores|q\(2) & ((\divisor|LessThan4~6_combout\) # ((\sicronizadores|q\(1)) # (\sicronizadores|q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \divisor|LessThan4~6_combout\,
	datac => \sicronizadores|q\(1),
	datad => \sicronizadores|q\(0),
	combout => \divisor|cuenta[19]~3_combout\);

-- Location: LCCOMB_X111_Y29_N30
\divisor|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux1~0_combout\ = (!\divisor|cuenta[19]~3_combout\ & (\divisor|Add0~52_combout\ & (!\divisor|cuenta[19]~4_combout\ & !\divisor|cuenta[19]~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~3_combout\,
	datab => \divisor|Add0~52_combout\,
	datac => \divisor|cuenta[19]~4_combout\,
	datad => \divisor|cuenta[19]~2_combout\,
	combout => \divisor|Mux1~0_combout\);

-- Location: FF_X111_Y29_N31
\divisor|cuenta[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(26));

-- Location: LCCOMB_X111_Y30_N22
\divisor|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~0_combout\ = ((!\divisor|Add0~16_combout\ & !\divisor|Add0~14_combout\)) # (!\divisor|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|Add0~16_combout\,
	datac => \divisor|Add0~18_combout\,
	datad => \divisor|Add0~14_combout\,
	combout => \divisor|LessThan0~0_combout\);

-- Location: LCCOMB_X109_Y30_N14
\divisor|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~1_combout\ = ((\divisor|LessThan0~0_combout\ & (!\divisor|Add0~22_combout\ & !\divisor|Add0~20_combout\))) # (!\divisor|LessThan3~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan0~0_combout\,
	datab => \divisor|Add0~22_combout\,
	datac => \divisor|LessThan3~2_combout\,
	datad => \divisor|Add0~20_combout\,
	combout => \divisor|LessThan0~1_combout\);

-- Location: LCCOMB_X109_Y29_N10
\divisor|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~2_combout\ = (\divisor|Add0~32_combout\) # ((\divisor|Add0~30_combout\ & ((\divisor|Add0~28_combout\) # (!\divisor|LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~32_combout\,
	datab => \divisor|LessThan0~1_combout\,
	datac => \divisor|Add0~28_combout\,
	datad => \divisor|Add0~30_combout\,
	combout => \divisor|LessThan0~2_combout\);

-- Location: LCCOMB_X109_Y29_N28
\divisor|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~3_combout\ = (\divisor|Add0~38_combout\) # ((\divisor|LessThan0~2_combout\ & (\divisor|Add0~36_combout\ & \divisor|Add0~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan0~2_combout\,
	datab => \divisor|Add0~36_combout\,
	datac => \divisor|Add0~38_combout\,
	datad => \divisor|Add0~34_combout\,
	combout => \divisor|LessThan0~3_combout\);

-- Location: LCCOMB_X109_Y29_N6
\divisor|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~4_combout\ = (\divisor|Add0~42_combout\ & (\divisor|Add0~44_combout\ & ((\divisor|LessThan0~3_combout\) # (\divisor|Add0~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan0~3_combout\,
	datab => \divisor|Add0~42_combout\,
	datac => \divisor|Add0~40_combout\,
	datad => \divisor|Add0~44_combout\,
	combout => \divisor|LessThan0~4_combout\);

-- Location: LCCOMB_X111_Y29_N16
\divisor|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~5_combout\ = (\divisor|Add0~48_combout\) # ((\divisor|LessThan0~4_combout\ & \divisor|Add0~46_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~48_combout\,
	datac => \divisor|LessThan0~4_combout\,
	datad => \divisor|Add0~46_combout\,
	combout => \divisor|LessThan0~5_combout\);

-- Location: LCCOMB_X111_Y29_N2
\divisor|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~6_combout\ = (\divisor|Add0~52_combout\ & (\divisor|Add0~50_combout\ & (\divisor|Add0~54_combout\ & \divisor|LessThan0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~52_combout\,
	datab => \divisor|Add0~50_combout\,
	datac => \divisor|Add0~54_combout\,
	datad => \divisor|LessThan0~5_combout\,
	combout => \divisor|LessThan0~6_combout\);

-- Location: LCCOMB_X112_Y30_N24
\divisor|cuenta[19]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[19]~1_combout\ = (!\sicronizadores|q\(2) & (\divisor|LessThan0~6_combout\ & !\sicronizadores|q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \divisor|LessThan0~6_combout\,
	datad => \sicronizadores|q\(1),
	combout => \divisor|cuenta[19]~1_combout\);

-- Location: LCCOMB_X111_Y30_N12
\divisor|cuenta[19]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[19]~2_combout\ = (!\sicronizadores|q\(0) & ((\divisor|cuenta[19]~1_combout\) # ((\sicronizadores|q\(1) & \divisor|LessThan2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datab => \sicronizadores|q\(0),
	datac => \divisor|LessThan2~6_combout\,
	datad => \divisor|cuenta[19]~1_combout\,
	combout => \divisor|cuenta[19]~2_combout\);

-- Location: LCCOMB_X109_Y29_N16
\divisor|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux6~0_combout\ = (!\divisor|cuenta[19]~2_combout\ & (!\divisor|cuenta[19]~4_combout\ & (!\divisor|cuenta[19]~3_combout\ & \divisor|Add0~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[19]~2_combout\,
	datab => \divisor|cuenta[19]~4_combout\,
	datac => \divisor|cuenta[19]~3_combout\,
	datad => \divisor|Add0~42_combout\,
	combout => \divisor|Mux6~0_combout\);

-- Location: FF_X109_Y29_N17
\divisor|cuenta[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(21));

-- Location: LCCOMB_X109_Y29_N12
\divisor|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~1_combout\ = (\divisor|Add0~42_combout\ & (\divisor|Add0~38_combout\ & \divisor|Add0~40_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|Add0~42_combout\,
	datac => \divisor|Add0~38_combout\,
	datad => \divisor|Add0~40_combout\,
	combout => \divisor|LessThan3~1_combout\);

-- Location: LCCOMB_X110_Y29_N30
\divisor|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~1_combout\ = (\divisor|LessThan3~1_combout\ & (\divisor|Add0~44_combout\ & (\divisor|Add0~36_combout\ & \divisor|Add0~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan3~1_combout\,
	datab => \divisor|Add0~44_combout\,
	datac => \divisor|Add0~36_combout\,
	datad => \divisor|Add0~48_combout\,
	combout => \divisor|LessThan2~1_combout\);

-- Location: LCCOMB_X111_Y29_N4
\divisor|LessThan2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~2_combout\ = (\divisor|Add0~50_combout\) # ((\divisor|Add0~54_combout\) # ((\divisor|Add0~48_combout\ & \divisor|Add0~46_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~48_combout\,
	datab => \divisor|Add0~50_combout\,
	datac => \divisor|Add0~54_combout\,
	datad => \divisor|Add0~46_combout\,
	combout => \divisor|LessThan2~2_combout\);

-- Location: LCCOMB_X109_Y30_N8
\divisor|LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~3_combout\ = (\divisor|Add0~28_combout\ & (\divisor|Add0~32_combout\ & (\divisor|LessThan3~2_combout\ & \divisor|Add0~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~28_combout\,
	datab => \divisor|Add0~32_combout\,
	datac => \divisor|LessThan3~2_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan2~3_combout\);

-- Location: LCCOMB_X109_Y30_N18
\divisor|LessThan2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~4_combout\ = (\divisor|LessThan2~3_combout\ & (((\divisor|Add0~12_combout\) # (\divisor|Add0~20_combout\)) # (!\divisor|LessThan2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan2~0_combout\,
	datab => \divisor|Add0~12_combout\,
	datac => \divisor|LessThan2~3_combout\,
	datad => \divisor|Add0~20_combout\,
	combout => \divisor|LessThan2~4_combout\);

-- Location: LCCOMB_X110_Y30_N2
\divisor|LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~5_combout\ = (\divisor|LessThan2~4_combout\) # ((\divisor|Add0~34_combout\) # ((\divisor|Add0~30_combout\ & \divisor|Add0~32_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~30_combout\,
	datab => \divisor|LessThan2~4_combout\,
	datac => \divisor|Add0~34_combout\,
	datad => \divisor|Add0~32_combout\,
	combout => \divisor|LessThan2~5_combout\);

-- Location: LCCOMB_X111_Y29_N14
\divisor|LessThan2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~6_combout\ = (\divisor|Add0~52_combout\) # ((\divisor|LessThan2~2_combout\) # ((\divisor|LessThan2~1_combout\ & \divisor|LessThan2~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan2~1_combout\,
	datab => \divisor|Add0~52_combout\,
	datac => \divisor|LessThan2~2_combout\,
	datad => \divisor|LessThan2~5_combout\,
	combout => \divisor|LessThan2~6_combout\);

-- Location: LCCOMB_X111_Y30_N24
\divisor|Mux28~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux28~2_combout\ = (\sicronizadores|q\(1) & ((\sicronizadores|q\(0) & ((\divisor|LessThan3~8_combout\))) # (!\sicronizadores|q\(0) & (\divisor|LessThan2~6_combout\)))) # (!\sicronizadores|q\(1) & (((\sicronizadores|q\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datab => \divisor|LessThan2~6_combout\,
	datac => \divisor|LessThan3~8_combout\,
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux28~2_combout\);

-- Location: LCCOMB_X111_Y30_N10
\divisor|Mux28~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux28~3_combout\ = (\sicronizadores|q\(1) & (\divisor|Mux28~2_combout\)) # (!\sicronizadores|q\(1) & ((\divisor|Mux28~2_combout\ & (\divisor|LessThan1~5_combout\)) # (!\divisor|Mux28~2_combout\ & ((\divisor|LessThan0~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datab => \divisor|Mux28~2_combout\,
	datac => \divisor|LessThan1~5_combout\,
	datad => \divisor|LessThan0~6_combout\,
	combout => \divisor|Mux28~3_combout\);

-- Location: LCCOMB_X112_Y29_N22
\divisor|Mux28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux28~0_combout\ = (\sicronizadores|q\(2) & (!\sicronizadores|q\(1) & !\sicronizadores|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \sicronizadores|q\(1),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux28~0_combout\);

-- Location: LCCOMB_X112_Y29_N28
\divisor|Mux28~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux28~1_combout\ = (\divisor|Mux28~0_combout\ & (\divisor|LessThan4~6_combout\ $ (\divisor|estado~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|LessThan4~6_combout\,
	datac => \divisor|Mux28~0_combout\,
	datad => \divisor|estado~q\,
	combout => \divisor|Mux28~1_combout\);

-- Location: LCCOMB_X112_Y29_N16
\divisor|Mux28~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux28~4_combout\ = (\divisor|Mux28~1_combout\) # ((!\sicronizadores|q\(2) & (\divisor|Mux28~3_combout\ $ (\divisor|estado~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \divisor|Mux28~3_combout\,
	datac => \divisor|estado~q\,
	datad => \divisor|Mux28~1_combout\,
	combout => \divisor|Mux28~4_combout\);

-- Location: FF_X112_Y29_N17
\divisor|estado\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux28~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|estado~q\);

-- Location: LCCOMB_X112_Y29_N14
\divisor|digito1[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|digito1[0]~0_combout\ = (\sicronizadores|q\(2)) # (((\divisor|LessThan2~6_combout\) # (\sicronizadores|q\(0))) # (!\sicronizadores|q\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \sicronizadores|q\(1),
	datac => \divisor|LessThan2~6_combout\,
	datad => \sicronizadores|q\(0),
	combout => \divisor|digito1[0]~0_combout\);

-- Location: FF_X112_Y29_N23
\divisor|digito1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux28~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito1\(2));

-- Location: LCCOMB_X112_Y29_N4
\divisor|Mux31~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux31~0_combout\ = (!\sicronizadores|q\(2) & (\sicronizadores|q\(1) & \sicronizadores|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \sicronizadores|q\(1),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux31~0_combout\);

-- Location: FF_X112_Y29_N5
\divisor|digito1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux31~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito1\(1));

-- Location: LCCOMB_X112_Y29_N18
\divisor|Mux32~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux32~0_combout\ = (!\sicronizadores|q\(0) & (\sicronizadores|q\(2) $ (\sicronizadores|q\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \sicronizadores|q\(1),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux32~0_combout\);

-- Location: FF_X112_Y29_N19
\divisor|digito1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux32~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito1\(0));

-- Location: LCCOMB_X112_Y29_N0
\SieteSeg1|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux6~0_combout\ = (\divisor|digito1\(2) & (\divisor|digito1\(1) & \divisor|digito1\(0))) # (!\divisor|digito1\(2) & (!\divisor|digito1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(2),
	datab => \divisor|digito1\(1),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux6~0_combout\);

-- Location: LCCOMB_X112_Y29_N26
\SieteSeg1|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux5~0_combout\ = (\divisor|digito1\(1) & ((\divisor|digito1\(0)) # (!\divisor|digito1\(2)))) # (!\divisor|digito1\(1) & (!\divisor|digito1\(2) & \divisor|digito1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito1\(1),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux5~0_combout\);

-- Location: LCCOMB_X112_Y29_N20
\SieteSeg1|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux4~0_combout\ = (\divisor|digito1\(0)) # ((!\divisor|digito1\(1) & \divisor|digito1\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito1\(1),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux4~0_combout\);

-- Location: LCCOMB_X112_Y29_N6
\SieteSeg1|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux3~0_combout\ = (\divisor|digito1\(1) & (\divisor|digito1\(2) & \divisor|digito1\(0))) # (!\divisor|digito1\(1) & (\divisor|digito1\(2) $ (\divisor|digito1\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito1\(1),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux3~0_combout\);

-- Location: LCCOMB_X112_Y29_N8
\SieteSeg1|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux2~0_combout\ = (\divisor|digito1\(1) & (!\divisor|digito1\(2) & !\divisor|digito1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito1\(1),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux2~0_combout\);

-- Location: LCCOMB_X112_Y29_N10
\SieteSeg1|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux1~0_combout\ = (\divisor|digito1\(1) $ (!\divisor|digito1\(0))) # (!\divisor|digito1\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito1\(1),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux1~0_combout\);

-- Location: LCCOMB_X112_Y29_N12
\SieteSeg1|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux0~0_combout\ = (!\divisor|digito1\(1) & (\divisor|digito1\(2) $ (\divisor|digito1\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(2),
	datab => \divisor|digito1\(1),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux0~0_combout\);

-- Location: LCCOMB_X112_Y29_N30
\divisor|Mux34~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux34~0_combout\ = (!\sicronizadores|q\(2) & (!\sicronizadores|q\(1) & \sicronizadores|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datab => \sicronizadores|q\(1),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux34~0_combout\);

-- Location: FF_X112_Y29_N31
\divisor|digito0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|Mux34~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito0\(2));

-- Location: LCCOMB_X112_Y29_N24
\divisor|cuenta[19]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[19]~0_combout\ = (!\sicronizadores|q\(2) & !\sicronizadores|q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(1),
	combout => \divisor|cuenta[19]~0_combout\);

-- Location: FF_X112_Y29_N25
\divisor|digito0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock_50~inputclkctrl_outclk\,
	d => \divisor|cuenta[19]~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito0\(0));

-- Location: LCCOMB_X113_Y57_N0
\SieteSeg0|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux0~0_combout\ = (!\divisor|digito0\(2) & \divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito0\(2),
	datad => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux0~0_combout\);

-- Location: LCCOMB_X113_Y57_N2
\SieteSeg0|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux4~0_combout\ = (\divisor|digito0\(2)) # (\divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito0\(2),
	datad => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux4~0_combout\);

-- Location: LCCOMB_X113_Y57_N20
\SieteSeg0|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux3~0_combout\ = \divisor|digito0\(2) $ (\divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito0\(2),
	datad => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux3~0_combout\);

-- Location: LCCOMB_X113_Y57_N22
\SieteSeg0|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux0~1_combout\ = (\divisor|digito0\(2) & \divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito0\(2),
	datad => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux0~1_combout\);

ww_clock_out <= \clock_out~output_o\;

ww_siete_seg1(6) <= \siete_seg1[6]~output_o\;

ww_siete_seg1(5) <= \siete_seg1[5]~output_o\;

ww_siete_seg1(4) <= \siete_seg1[4]~output_o\;

ww_siete_seg1(3) <= \siete_seg1[3]~output_o\;

ww_siete_seg1(2) <= \siete_seg1[2]~output_o\;

ww_siete_seg1(1) <= \siete_seg1[1]~output_o\;

ww_siete_seg1(0) <= \siete_seg1[0]~output_o\;

ww_siete_seg0(6) <= \siete_seg0[6]~output_o\;

ww_siete_seg0(5) <= \siete_seg0[5]~output_o\;

ww_siete_seg0(4) <= \siete_seg0[4]~output_o\;

ww_siete_seg0(3) <= \siete_seg0[3]~output_o\;

ww_siete_seg0(2) <= \siete_seg0[2]~output_o\;

ww_siete_seg0(1) <= \siete_seg0[1]~output_o\;

ww_siete_seg0(0) <= \siete_seg0[0]~output_o\;
END structure;


