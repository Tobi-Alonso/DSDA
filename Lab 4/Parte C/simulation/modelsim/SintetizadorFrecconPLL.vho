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

-- DATE "05/06/2016 12:03:19"

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

ENTITY 	SintetizadorFrecconPLL IS
    PORT (
	clock_50 : IN std_logic;
	clock_sel : IN std_logic_vector(2 DOWNTO 0);
	clock_out : OUT std_logic;
	siete_seg1 : OUT std_logic_vector(0 TO 6);
	siete_seg0 : OUT std_logic_vector(0 TO 6);
	pll_lock : OUT std_logic
	);
END SintetizadorFrecconPLL;

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
-- pll_lock	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_50	=>  Location: PIN_Y2,	 I/O Standard: 3.3-V LVCMOS,	 Current Strength: Default
-- clock_sel[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_sel[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock_sel[2]	=>  Location: PIN_AC27,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SintetizadorFrecconPLL IS
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
SIGNAL ww_pll_lock : std_logic;
SIGNAL \ip_pll_inst|altpll_component|auto_generated|pll1_INCLK_bus\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \ip_pll_inst|altpll_component|auto_generated|pll1_CLK_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;
SIGNAL \clock_50~input_o\ : std_logic;
SIGNAL \ip_pll_inst|altpll_component|auto_generated|wire_pll1_fbout\ : std_logic;
SIGNAL \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\ : std_logic;
SIGNAL \clock_sel[0]~input_o\ : std_logic;
SIGNAL \clock_sel[1]~input_o\ : std_logic;
SIGNAL \divisor|Mux13~0_combout\ : std_logic;
SIGNAL \divisor|Mux0~0_combout\ : std_logic;
SIGNAL \divisor|Add0~0_combout\ : std_logic;
SIGNAL \divisor|Mux12~0_combout\ : std_logic;
SIGNAL \divisor|Add0~1\ : std_logic;
SIGNAL \divisor|Add0~2_combout\ : std_logic;
SIGNAL \divisor|Mux11~0_combout\ : std_logic;
SIGNAL \divisor|Add0~3\ : std_logic;
SIGNAL \divisor|Add0~4_combout\ : std_logic;
SIGNAL \divisor|Mux10~0_combout\ : std_logic;
SIGNAL \divisor|Add0~5\ : std_logic;
SIGNAL \divisor|Add0~6_combout\ : std_logic;
SIGNAL \divisor|Mux9~0_combout\ : std_logic;
SIGNAL \divisor|Add0~7\ : std_logic;
SIGNAL \divisor|Add0~9\ : std_logic;
SIGNAL \divisor|Add0~10_combout\ : std_logic;
SIGNAL \divisor|Mux7~0_combout\ : std_logic;
SIGNAL \divisor|Add0~11\ : std_logic;
SIGNAL \divisor|Add0~12_combout\ : std_logic;
SIGNAL \divisor|Mux6~0_combout\ : std_logic;
SIGNAL \divisor|Add0~13\ : std_logic;
SIGNAL \divisor|Add0~14_combout\ : std_logic;
SIGNAL \divisor|Mux5~0_combout\ : std_logic;
SIGNAL \divisor|Add0~15\ : std_logic;
SIGNAL \divisor|Add0~16_combout\ : std_logic;
SIGNAL \divisor|Mux4~0_combout\ : std_logic;
SIGNAL \divisor|Add0~17\ : std_logic;
SIGNAL \divisor|Add0~19\ : std_logic;
SIGNAL \divisor|Add0~21\ : std_logic;
SIGNAL \divisor|Add0~22_combout\ : std_logic;
SIGNAL \divisor|Mux1~0_combout\ : std_logic;
SIGNAL \divisor|Add0~23\ : std_logic;
SIGNAL \divisor|Add0~24_combout\ : std_logic;
SIGNAL \divisor|LessThan2~3_combout\ : std_logic;
SIGNAL \divisor|LessThan2~5_combout\ : std_logic;
SIGNAL \divisor|LessThan2~4_combout\ : std_logic;
SIGNAL \divisor|cuenta[12]~0_combout\ : std_logic;
SIGNAL \divisor|Mux8~0_combout\ : std_logic;
SIGNAL \divisor|Add0~8_combout\ : std_logic;
SIGNAL \divisor|LessThan2~2_combout\ : std_logic;
SIGNAL \divisor|LessThan4~0_combout\ : std_logic;
SIGNAL \divisor|cuenta[12]~4_combout\ : std_logic;
SIGNAL \divisor|cuenta[12]~3_combout\ : std_logic;
SIGNAL \divisor|LessThan1~0_combout\ : std_logic;
SIGNAL \divisor|LessThan1~1_combout\ : std_logic;
SIGNAL \divisor|LessThan1~2_combout\ : std_logic;
SIGNAL \clock_sel[2]~input_o\ : std_logic;
SIGNAL \divisor|cuenta[12]~5_combout\ : std_logic;
SIGNAL \divisor|Mux2~0_combout\ : std_logic;
SIGNAL \divisor|Add0~20_combout\ : std_logic;
SIGNAL \divisor|LessThan0~2_combout\ : std_logic;
SIGNAL \divisor|cuenta[12]~1_combout\ : std_logic;
SIGNAL \divisor|LessThan0~1_combout\ : std_logic;
SIGNAL \divisor|LessThan0~0_combout\ : std_logic;
SIGNAL \divisor|cuenta[12]~2_combout\ : std_logic;
SIGNAL \divisor|Mux3~0_combout\ : std_logic;
SIGNAL \divisor|Add0~18_combout\ : std_logic;
SIGNAL \divisor|LessThan4~1_combout\ : std_logic;
SIGNAL \divisor|LessThan3~1_combout\ : std_logic;
SIGNAL \divisor|LessThan3~0_combout\ : std_logic;
SIGNAL \divisor|LessThan3~2_combout\ : std_logic;
SIGNAL \divisor|Mux13~1_combout\ : std_logic;
SIGNAL \divisor|Mux13~2_combout\ : std_logic;
SIGNAL \divisor|Mux13~3_combout\ : std_logic;
SIGNAL \divisor|Mux13~4_combout\ : std_logic;
SIGNAL \divisor|estado~0_combout\ : std_logic;
SIGNAL \divisor|Mux13~5_combout\ : std_logic;
SIGNAL \divisor|estado~q\ : std_logic;
SIGNAL \divisor|Mux17~0_combout\ : std_logic;
SIGNAL \divisor|digito1[0]~0_combout\ : std_logic;
SIGNAL \divisor|Mux13~6_combout\ : std_logic;
SIGNAL \divisor|Mux16~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux6~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux5~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux4~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux3~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux2~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux1~0_combout\ : std_logic;
SIGNAL \SieteSeg1|Mux0~0_combout\ : std_logic;
SIGNAL \divisor|Mux19~0_combout\ : std_logic;
SIGNAL \divisor|Mux19~1_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux0~0_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux4~0_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux3~0_combout\ : std_logic;
SIGNAL \SieteSeg0|Mux0~1_combout\ : std_logic;
SIGNAL \ip_pll_inst|altpll_component|auto_generated|wire_pll1_locked\ : std_logic;
SIGNAL \divisor|digito0\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \divisor|digito1\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \divisor|cuenta\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \sicronizadores|q\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \divisor|ALT_INV_digito0\ : std_logic_vector(2 DOWNTO 2);
SIGNAL \SieteSeg1|ALT_INV_Mux1~0_combout\ : std_logic;

BEGIN

ww_clock_50 <= clock_50;
ww_clock_sel <= clock_sel;
clock_out <= ww_clock_out;
siete_seg1 <= ww_siete_seg1;
siete_seg0 <= ww_siete_seg0;
pll_lock <= ww_pll_lock;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ip_pll_inst|altpll_component|auto_generated|pll1_INCLK_bus\ <= (gnd & \clock_50~input_o\);

\ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk\(0) <= \ip_pll_inst|altpll_component|auto_generated|pll1_CLK_bus\(0);
\ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk\(1) <= \ip_pll_inst|altpll_component|auto_generated|pll1_CLK_bus\(1);
\ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk\(2) <= \ip_pll_inst|altpll_component|auto_generated|pll1_CLK_bus\(2);
\ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk\(3) <= \ip_pll_inst|altpll_component|auto_generated|pll1_CLK_bus\(3);
\ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk\(4) <= \ip_pll_inst|altpll_component|auto_generated|pll1_CLK_bus\(4);

\ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk\(0));
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
	o => ww_clock_out);

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
	o => ww_siete_seg1(6));

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
	o => ww_siete_seg1(5));

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
	o => ww_siete_seg1(4));

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
	o => ww_siete_seg1(3));

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
	o => ww_siete_seg1(2));

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
	o => ww_siete_seg1(1));

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
	o => ww_siete_seg1(0));

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
	o => ww_siete_seg0(6));

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
	o => ww_siete_seg0(5));

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
	o => ww_siete_seg0(4));

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
	o => ww_siete_seg0(3));

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
	o => ww_siete_seg0(2));

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
	o => ww_siete_seg0(1));

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
	o => ww_siete_seg0(0));

-- Location: IOOBUF_X94_Y73_N2
\pll_lock~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_locked\,
	devoe => ww_devoe,
	o => ww_pll_lock);

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

-- Location: PLL_1
\ip_pll_inst|altpll_component|auto_generated|pll1\ : cycloneive_pll
-- pragma translate_off
GENERIC MAP (
	auto_settings => "false",
	bandwidth_type => "medium",
	c0_high => 250,
	c0_initial => 1,
	c0_low => 250,
	c0_mode => "even",
	c0_ph => 0,
	c1_high => 250,
	c1_initial => 1,
	c1_low => 250,
	c1_mode => "even",
	c1_ph => 0,
	c1_use_casc_in => "on",
	c2_high => 0,
	c2_initial => 0,
	c2_low => 0,
	c2_mode => "bypass",
	c2_ph => 0,
	c2_use_casc_in => "off",
	c3_high => 0,
	c3_initial => 0,
	c3_low => 0,
	c3_mode => "bypass",
	c3_ph => 0,
	c3_use_casc_in => "off",
	c4_high => 0,
	c4_initial => 0,
	c4_low => 0,
	c4_mode => "bypass",
	c4_ph => 0,
	c4_use_casc_in => "off",
	charge_pump_current_bits => 1,
	clk0_counter => "c1",
	clk0_divide_by => 125000,
	clk0_duty_cycle => 50,
	clk0_multiply_by => 3,
	clk0_phase_shift => "0",
	clk1_counter => "unused",
	clk1_divide_by => 0,
	clk1_duty_cycle => 50,
	clk1_multiply_by => 0,
	clk1_phase_shift => "0",
	clk2_counter => "unused",
	clk2_divide_by => 0,
	clk2_duty_cycle => 50,
	clk2_multiply_by => 0,
	clk2_phase_shift => "0",
	clk3_counter => "unused",
	clk3_divide_by => 0,
	clk3_duty_cycle => 50,
	clk3_multiply_by => 0,
	clk3_phase_shift => "0",
	clk4_counter => "unused",
	clk4_divide_by => 0,
	clk4_duty_cycle => 50,
	clk4_multiply_by => 0,
	clk4_phase_shift => "0",
	compensate_clock => "clock0",
	inclk0_input_frequency => 20000,
	inclk1_input_frequency => 0,
	loop_filter_c_bits => 0,
	loop_filter_r_bits => 27,
	m => 6,
	m_initial => 1,
	m_ph => 0,
	n => 1,
	operation_mode => "normal",
	pfd_max => 200000,
	pfd_min => 3076,
	self_reset_on_loss_lock => "off",
	simulation_type => "timing",
	switch_over_type => "auto",
	vco_center => 1538,
	vco_divide_by => 0,
	vco_frequency_control => "auto",
	vco_max => 3333,
	vco_min => 1538,
	vco_multiply_by => 0,
	vco_phase_shift_step => 416,
	vco_post_scale => 2)
-- pragma translate_on
PORT MAP (
	areset => GND,
	fbin => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_fbout\,
	inclk => \ip_pll_inst|altpll_component|auto_generated|pll1_INCLK_bus\,
	locked => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_locked\,
	fbout => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_fbout\,
	clk => \ip_pll_inst|altpll_component|auto_generated|pll1_CLK_bus\);

-- Location: CLKCTRL_G4
\ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\);

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

-- Location: FF_X111_Y30_N23
\sicronizadores|q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \clock_sel[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sicronizadores|q\(0));

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

-- Location: FF_X111_Y30_N13
\sicronizadores|q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \clock_sel[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sicronizadores|q\(1));

-- Location: LCCOMB_X111_Y30_N22
\divisor|Mux13~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~0_combout\ = (!\sicronizadores|q\(0) & !\sicronizadores|q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sicronizadores|q\(0),
	datad => \sicronizadores|q\(1),
	combout => \divisor|Mux13~0_combout\);

-- Location: LCCOMB_X112_Y30_N8
\divisor|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux0~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~24_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~24_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux0~0_combout\);

-- Location: FF_X112_Y30_N9
\divisor|cuenta[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(12));

-- Location: LCCOMB_X113_Y30_N4
\divisor|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~0_combout\ = \divisor|cuenta\(0) $ (VCC)
-- \divisor|Add0~1\ = CARRY(\divisor|cuenta\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(0),
	datad => VCC,
	combout => \divisor|Add0~0_combout\,
	cout => \divisor|Add0~1\);

-- Location: LCCOMB_X112_Y30_N30
\divisor|Mux12~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux12~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~0_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~0_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux12~0_combout\);

-- Location: FF_X112_Y30_N31
\divisor|cuenta[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux12~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(0));

-- Location: LCCOMB_X113_Y30_N6
\divisor|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~2_combout\ = (\divisor|cuenta\(1) & (!\divisor|Add0~1\)) # (!\divisor|cuenta\(1) & ((\divisor|Add0~1\) # (GND)))
-- \divisor|Add0~3\ = CARRY((!\divisor|Add0~1\) # (!\divisor|cuenta\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(1),
	datad => VCC,
	cin => \divisor|Add0~1\,
	combout => \divisor|Add0~2_combout\,
	cout => \divisor|Add0~3\);

-- Location: LCCOMB_X112_Y30_N12
\divisor|Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux11~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~2_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~2_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux11~0_combout\);

-- Location: FF_X112_Y30_N13
\divisor|cuenta[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(1));

-- Location: LCCOMB_X113_Y30_N8
\divisor|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~4_combout\ = (\divisor|cuenta\(2) & (\divisor|Add0~3\ $ (GND))) # (!\divisor|cuenta\(2) & (!\divisor|Add0~3\ & VCC))
-- \divisor|Add0~5\ = CARRY((\divisor|cuenta\(2) & !\divisor|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(2),
	datad => VCC,
	cin => \divisor|Add0~3\,
	combout => \divisor|Add0~4_combout\,
	cout => \divisor|Add0~5\);

-- Location: LCCOMB_X112_Y30_N10
\divisor|Mux10~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux10~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~4_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~4_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux10~0_combout\);

-- Location: FF_X112_Y30_N11
\divisor|cuenta[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux10~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(2));

-- Location: LCCOMB_X113_Y30_N10
\divisor|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~6_combout\ = (\divisor|cuenta\(3) & (!\divisor|Add0~5\)) # (!\divisor|cuenta\(3) & ((\divisor|Add0~5\) # (GND)))
-- \divisor|Add0~7\ = CARRY((!\divisor|Add0~5\) # (!\divisor|cuenta\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(3),
	datad => VCC,
	cin => \divisor|Add0~5\,
	combout => \divisor|Add0~6_combout\,
	cout => \divisor|Add0~7\);

-- Location: LCCOMB_X112_Y30_N24
\divisor|Mux9~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux9~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~6_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~6_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux9~0_combout\);

-- Location: FF_X112_Y30_N25
\divisor|cuenta[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux9~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(3));

-- Location: LCCOMB_X113_Y30_N12
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

-- Location: LCCOMB_X113_Y30_N14
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

-- Location: LCCOMB_X112_Y30_N28
\divisor|Mux7~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux7~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~10_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~10_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux7~0_combout\);

-- Location: FF_X112_Y30_N29
\divisor|cuenta[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux7~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(5));

-- Location: LCCOMB_X113_Y30_N16
\divisor|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~12_combout\ = (\divisor|cuenta\(6) & (\divisor|Add0~11\ $ (GND))) # (!\divisor|cuenta\(6) & (!\divisor|Add0~11\ & VCC))
-- \divisor|Add0~13\ = CARRY((\divisor|cuenta\(6) & !\divisor|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(6),
	datad => VCC,
	cin => \divisor|Add0~11\,
	combout => \divisor|Add0~12_combout\,
	cout => \divisor|Add0~13\);

-- Location: LCCOMB_X112_Y30_N26
\divisor|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux6~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (!\divisor|cuenta[12]~0_combout\ & \divisor|Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|cuenta[12]~0_combout\,
	datad => \divisor|Add0~12_combout\,
	combout => \divisor|Mux6~0_combout\);

-- Location: FF_X112_Y30_N27
\divisor|cuenta[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux6~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(6));

-- Location: LCCOMB_X113_Y30_N18
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

-- Location: LCCOMB_X112_Y30_N0
\divisor|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux5~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~14_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~14_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux5~0_combout\);

-- Location: FF_X112_Y30_N1
\divisor|cuenta[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(7));

-- Location: LCCOMB_X113_Y30_N20
\divisor|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~16_combout\ = (\divisor|cuenta\(8) & (\divisor|Add0~15\ $ (GND))) # (!\divisor|cuenta\(8) & (!\divisor|Add0~15\ & VCC))
-- \divisor|Add0~17\ = CARRY((\divisor|cuenta\(8) & !\divisor|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(8),
	datad => VCC,
	cin => \divisor|Add0~15\,
	combout => \divisor|Add0~16_combout\,
	cout => \divisor|Add0~17\);

-- Location: LCCOMB_X112_Y30_N16
\divisor|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux4~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~16_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~16_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux4~0_combout\);

-- Location: FF_X112_Y30_N17
\divisor|cuenta[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(8));

-- Location: LCCOMB_X113_Y30_N22
\divisor|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~18_combout\ = (\divisor|cuenta\(9) & (!\divisor|Add0~17\)) # (!\divisor|cuenta\(9) & ((\divisor|Add0~17\) # (GND)))
-- \divisor|Add0~19\ = CARRY((!\divisor|Add0~17\) # (!\divisor|cuenta\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta\(9),
	datad => VCC,
	cin => \divisor|Add0~17\,
	combout => \divisor|Add0~18_combout\,
	cout => \divisor|Add0~19\);

-- Location: LCCOMB_X113_Y30_N24
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

-- Location: LCCOMB_X113_Y30_N26
\divisor|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~22_combout\ = (\divisor|cuenta\(11) & (!\divisor|Add0~21\)) # (!\divisor|cuenta\(11) & ((\divisor|Add0~21\) # (GND)))
-- \divisor|Add0~23\ = CARRY((!\divisor|Add0~21\) # (!\divisor|cuenta\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \divisor|cuenta\(11),
	datad => VCC,
	cin => \divisor|Add0~21\,
	combout => \divisor|Add0~22_combout\,
	cout => \divisor|Add0~23\);

-- Location: LCCOMB_X112_Y30_N22
\divisor|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux1~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (\divisor|Add0~22_combout\ & (!\divisor|cuenta[12]~0_combout\ & !\divisor|cuenta[12]~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|Add0~22_combout\,
	datac => \divisor|cuenta[12]~0_combout\,
	datad => \divisor|cuenta[12]~5_combout\,
	combout => \divisor|Mux1~0_combout\);

-- Location: FF_X112_Y30_N23
\divisor|cuenta[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(11));

-- Location: LCCOMB_X113_Y30_N28
\divisor|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Add0~24_combout\ = \divisor|Add0~23\ $ (!\divisor|cuenta\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \divisor|cuenta\(12),
	cin => \divisor|Add0~23\,
	combout => \divisor|Add0~24_combout\);

-- Location: LCCOMB_X113_Y30_N2
\divisor|LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~3_combout\ = (\divisor|Add0~12_combout\ & ((\divisor|Add0~10_combout\) # ((\divisor|Add0~8_combout\ & \divisor|Add0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~8_combout\,
	datab => \divisor|Add0~12_combout\,
	datac => \divisor|Add0~10_combout\,
	datad => \divisor|Add0~6_combout\,
	combout => \divisor|LessThan2~3_combout\);

-- Location: LCCOMB_X113_Y30_N30
\divisor|LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~5_combout\ = (\divisor|Add0~18_combout\ & ((\divisor|Add0~14_combout\) # ((\divisor|LessThan2~3_combout\) # (\divisor|Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~14_combout\,
	datab => \divisor|LessThan2~3_combout\,
	datac => \divisor|Add0~18_combout\,
	datad => \divisor|Add0~16_combout\,
	combout => \divisor|LessThan2~5_combout\);

-- Location: LCCOMB_X111_Y30_N18
\divisor|LessThan2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~4_combout\ = (\divisor|Add0~24_combout\) # ((\divisor|Add0~20_combout\) # ((\divisor|LessThan2~5_combout\) # (\divisor|Add0~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~24_combout\,
	datab => \divisor|Add0~20_combout\,
	datac => \divisor|LessThan2~5_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan2~4_combout\);

-- Location: LCCOMB_X111_Y30_N8
\divisor|cuenta[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[12]~0_combout\ = (\sicronizadores|q\(1) & ((\sicronizadores|q\(0) & ((\divisor|LessThan3~2_combout\))) # (!\sicronizadores|q\(0) & (\divisor|LessThan2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan2~4_combout\,
	datab => \divisor|LessThan3~2_combout\,
	datac => \sicronizadores|q\(0),
	datad => \sicronizadores|q\(1),
	combout => \divisor|cuenta[12]~0_combout\);

-- Location: LCCOMB_X112_Y30_N14
\divisor|Mux8~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux8~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~8_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~8_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux8~0_combout\);

-- Location: FF_X112_Y30_N15
\divisor|cuenta[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(4));

-- Location: LCCOMB_X113_Y30_N0
\divisor|LessThan2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan2~2_combout\ = (\divisor|Add0~8_combout\ & (\divisor|Add0~12_combout\ & (\divisor|Add0~10_combout\ & \divisor|Add0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~8_combout\,
	datab => \divisor|Add0~12_combout\,
	datac => \divisor|Add0~10_combout\,
	datad => \divisor|Add0~6_combout\,
	combout => \divisor|LessThan2~2_combout\);

-- Location: LCCOMB_X111_Y30_N24
\divisor|LessThan4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~0_combout\ = (!\divisor|Add0~16_combout\ & !\divisor|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \divisor|Add0~16_combout\,
	datad => \divisor|Add0~14_combout\,
	combout => \divisor|LessThan4~0_combout\);

-- Location: LCCOMB_X110_Y30_N12
\divisor|cuenta[12]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[12]~4_combout\ = (((\divisor|LessThan2~2_combout\) # (!\divisor|LessThan4~0_combout\)) # (!\divisor|LessThan4~1_combout\)) # (!\divisor|Mux13~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Mux13~0_combout\,
	datab => \divisor|LessThan4~1_combout\,
	datac => \divisor|LessThan2~2_combout\,
	datad => \divisor|LessThan4~0_combout\,
	combout => \divisor|cuenta[12]~4_combout\);

-- Location: LCCOMB_X111_Y30_N28
\divisor|cuenta[12]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[12]~3_combout\ = (\sicronizadores|q\(0) & !\sicronizadores|q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(0),
	datad => \sicronizadores|q\(1),
	combout => \divisor|cuenta[12]~3_combout\);

-- Location: LCCOMB_X111_Y30_N0
\divisor|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~0_combout\ = (\divisor|Add0~22_combout\) # ((\divisor|Add0~20_combout\ & ((\divisor|Add0~18_combout\) # (\divisor|Add0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~18_combout\,
	datab => \divisor|Add0~20_combout\,
	datac => \divisor|Add0~16_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan1~0_combout\);

-- Location: LCCOMB_X112_Y30_N18
\divisor|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~1_combout\ = (\divisor|Add0~14_combout\ & ((\divisor|Add0~12_combout\) # ((\divisor|Add0~10_combout\ & \divisor|Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~12_combout\,
	datab => \divisor|Add0~10_combout\,
	datac => \divisor|Add0~8_combout\,
	datad => \divisor|Add0~14_combout\,
	combout => \divisor|LessThan1~1_combout\);

-- Location: LCCOMB_X111_Y30_N26
\divisor|LessThan1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan1~2_combout\ = (\divisor|LessThan1~0_combout\) # ((\divisor|Add0~24_combout\) # ((\divisor|LessThan1~1_combout\ & \divisor|Add0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan1~0_combout\,
	datab => \divisor|LessThan1~1_combout\,
	datac => \divisor|Add0~24_combout\,
	datad => \divisor|Add0~20_combout\,
	combout => \divisor|LessThan1~2_combout\);

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

-- Location: FF_X111_Y30_N21
\sicronizadores|q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	asdata => \clock_sel[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sicronizadores|q\(2));

-- Location: LCCOMB_X111_Y30_N30
\divisor|cuenta[12]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[12]~5_combout\ = (\divisor|cuenta[12]~4_combout\ & ((\sicronizadores|q\(2)) # ((\divisor|cuenta[12]~3_combout\ & \divisor|LessThan1~2_combout\)))) # (!\divisor|cuenta[12]~4_combout\ & (\divisor|cuenta[12]~3_combout\ & 
-- (\divisor|LessThan1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~4_combout\,
	datab => \divisor|cuenta[12]~3_combout\,
	datac => \divisor|LessThan1~2_combout\,
	datad => \sicronizadores|q\(2),
	combout => \divisor|cuenta[12]~5_combout\);

-- Location: LCCOMB_X112_Y30_N20
\divisor|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux2~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~20_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~20_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux2~0_combout\);

-- Location: FF_X112_Y30_N21
\divisor|cuenta[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(10));

-- Location: LCCOMB_X111_Y30_N6
\divisor|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~2_combout\ = (\divisor|Add0~24_combout\ & ((\divisor|Add0~22_combout\) # ((\divisor|Add0~18_combout\ & \divisor|Add0~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~18_combout\,
	datab => \divisor|Add0~20_combout\,
	datac => \divisor|Add0~24_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan0~2_combout\);

-- Location: LCCOMB_X110_Y30_N2
\divisor|cuenta[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[12]~1_combout\ = (!\sicronizadores|q\(1) & (!\sicronizadores|q\(2) & !\sicronizadores|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datac => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(0),
	combout => \divisor|cuenta[12]~1_combout\);

-- Location: LCCOMB_X111_Y30_N4
\divisor|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~1_combout\ = (\divisor|Add0~22_combout\) # ((\divisor|Add0~16_combout\ & ((\divisor|Add0~10_combout\) # (\divisor|Add0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~10_combout\,
	datab => \divisor|Add0~14_combout\,
	datac => \divisor|Add0~16_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan0~1_combout\);

-- Location: LCCOMB_X112_Y30_N6
\divisor|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan0~0_combout\ = (\divisor|Add0~14_combout\) # ((\divisor|Add0~22_combout\) # ((\divisor|Add0~12_combout\ & \divisor|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~12_combout\,
	datab => \divisor|Add0~14_combout\,
	datac => \divisor|Add0~8_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan0~0_combout\);

-- Location: LCCOMB_X111_Y30_N2
\divisor|cuenta[12]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|cuenta[12]~2_combout\ = (\divisor|LessThan0~2_combout\ & (\divisor|cuenta[12]~1_combout\ & (\divisor|LessThan0~1_combout\ & \divisor|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan0~2_combout\,
	datab => \divisor|cuenta[12]~1_combout\,
	datac => \divisor|LessThan0~1_combout\,
	datad => \divisor|LessThan0~0_combout\,
	combout => \divisor|cuenta[12]~2_combout\);

-- Location: LCCOMB_X112_Y30_N2
\divisor|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux3~0_combout\ = (!\divisor|cuenta[12]~2_combout\ & (!\divisor|cuenta[12]~5_combout\ & (\divisor|Add0~18_combout\ & !\divisor|cuenta[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|cuenta[12]~2_combout\,
	datab => \divisor|cuenta[12]~5_combout\,
	datac => \divisor|Add0~18_combout\,
	datad => \divisor|cuenta[12]~0_combout\,
	combout => \divisor|Mux3~0_combout\);

-- Location: FF_X112_Y30_N3
\divisor|cuenta[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux3~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|cuenta\(9));

-- Location: LCCOMB_X111_Y30_N10
\divisor|LessThan4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan4~1_combout\ = (!\divisor|Add0~18_combout\ & (!\divisor|Add0~20_combout\ & (!\divisor|Add0~24_combout\ & !\divisor|Add0~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~18_combout\,
	datab => \divisor|Add0~20_combout\,
	datac => \divisor|Add0~24_combout\,
	datad => \divisor|Add0~22_combout\,
	combout => \divisor|LessThan4~1_combout\);

-- Location: LCCOMB_X111_Y30_N20
\divisor|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~1_combout\ = (\divisor|Add0~12_combout\) # (\divisor|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~12_combout\,
	datad => \divisor|Add0~14_combout\,
	combout => \divisor|LessThan3~1_combout\);

-- Location: LCCOMB_X112_Y30_N4
\divisor|LessThan3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~0_combout\ = (\divisor|Add0~10_combout\ & ((\divisor|Add0~8_combout\) # ((\divisor|Add0~6_combout\ & \divisor|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Add0~8_combout\,
	datab => \divisor|Add0~10_combout\,
	datac => \divisor|Add0~6_combout\,
	datad => \divisor|Add0~4_combout\,
	combout => \divisor|LessThan3~0_combout\);

-- Location: LCCOMB_X111_Y30_N14
\divisor|LessThan3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|LessThan3~2_combout\ = ((\divisor|Add0~16_combout\ & ((\divisor|LessThan3~1_combout\) # (\divisor|LessThan3~0_combout\)))) # (!\divisor|LessThan4~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan4~1_combout\,
	datab => \divisor|LessThan3~1_combout\,
	datac => \divisor|Add0~16_combout\,
	datad => \divisor|LessThan3~0_combout\,
	combout => \divisor|LessThan3~2_combout\);

-- Location: LCCOMB_X111_Y30_N16
\divisor|Mux13~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~1_combout\ = (\sicronizadores|q\(1) & (\divisor|LessThan3~2_combout\)) # (!\sicronizadores|q\(1) & ((\divisor|LessThan1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|LessThan3~2_combout\,
	datac => \divisor|LessThan1~2_combout\,
	datad => \sicronizadores|q\(1),
	combout => \divisor|Mux13~1_combout\);

-- Location: LCCOMB_X111_Y30_N12
\divisor|Mux13~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~2_combout\ = (\divisor|LessThan0~0_combout\ & (\divisor|LessThan0~1_combout\ & \divisor|LessThan0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan0~0_combout\,
	datab => \divisor|LessThan0~1_combout\,
	datad => \divisor|LessThan0~2_combout\,
	combout => \divisor|Mux13~2_combout\);

-- Location: LCCOMB_X110_Y30_N4
\divisor|Mux13~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~3_combout\ = (\sicronizadores|q\(1) & (\divisor|LessThan2~4_combout\)) # (!\sicronizadores|q\(1) & ((\divisor|Mux13~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|LessThan2~4_combout\,
	datac => \divisor|Mux13~2_combout\,
	datad => \sicronizadores|q\(1),
	combout => \divisor|Mux13~3_combout\);

-- Location: LCCOMB_X110_Y30_N30
\divisor|Mux13~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~4_combout\ = \divisor|estado~q\ $ (((\sicronizadores|q\(0) & (\divisor|Mux13~1_combout\)) # (!\sicronizadores|q\(0) & ((\divisor|Mux13~3_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|estado~q\,
	datab => \divisor|Mux13~1_combout\,
	datac => \divisor|Mux13~3_combout\,
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux13~4_combout\);

-- Location: LCCOMB_X110_Y30_N18
\divisor|estado~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|estado~0_combout\ = \divisor|estado~q\ $ (((\divisor|LessThan2~2_combout\) # ((!\divisor|LessThan4~0_combout\) # (!\divisor|LessThan4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|LessThan2~2_combout\,
	datab => \divisor|estado~q\,
	datac => \divisor|LessThan4~1_combout\,
	datad => \divisor|LessThan4~0_combout\,
	combout => \divisor|estado~0_combout\);

-- Location: LCCOMB_X110_Y30_N24
\divisor|Mux13~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~5_combout\ = (\sicronizadores|q\(2) & (((\divisor|estado~0_combout\ & \divisor|Mux13~0_combout\)))) # (!\sicronizadores|q\(2) & (\divisor|Mux13~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|Mux13~4_combout\,
	datab => \divisor|estado~0_combout\,
	datac => \sicronizadores|q\(2),
	datad => \divisor|Mux13~0_combout\,
	combout => \divisor|Mux13~5_combout\);

-- Location: FF_X110_Y30_N25
\divisor|estado\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux13~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|estado~q\);

-- Location: LCCOMB_X110_Y30_N10
\divisor|Mux17~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux17~0_combout\ = (!\sicronizadores|q\(0) & (\sicronizadores|q\(1) $ (\sicronizadores|q\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datac => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux17~0_combout\);

-- Location: LCCOMB_X110_Y30_N8
\divisor|digito1[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|digito1[0]~0_combout\ = ((\divisor|LessThan2~4_combout\) # ((\sicronizadores|q\(2)) # (\sicronizadores|q\(0)))) # (!\sicronizadores|q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datab => \divisor|LessThan2~4_combout\,
	datac => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(0),
	combout => \divisor|digito1[0]~0_combout\);

-- Location: FF_X110_Y30_N11
\divisor|digito1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux17~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito1\(0));

-- Location: LCCOMB_X110_Y30_N6
\divisor|Mux13~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux13~6_combout\ = (!\sicronizadores|q\(1) & (\sicronizadores|q\(2) & !\sicronizadores|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datac => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux13~6_combout\);

-- Location: FF_X110_Y30_N7
\divisor|digito1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux13~6_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito1\(2));

-- Location: LCCOMB_X110_Y30_N28
\divisor|Mux16~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux16~0_combout\ = (\sicronizadores|q\(1) & (!\sicronizadores|q\(2) & \sicronizadores|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datac => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux16~0_combout\);

-- Location: FF_X110_Y30_N29
\divisor|digito1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux16~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito1\(1));

-- Location: LCCOMB_X111_Y28_N16
\SieteSeg1|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux6~0_combout\ = (\divisor|digito1\(2) & (\divisor|digito1\(0) & \divisor|digito1\(1))) # (!\divisor|digito1\(2) & ((!\divisor|digito1\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(0),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(1),
	combout => \SieteSeg1|Mux6~0_combout\);

-- Location: LCCOMB_X111_Y28_N18
\SieteSeg1|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux5~0_combout\ = (\divisor|digito1\(0) & ((\divisor|digito1\(1)) # (!\divisor|digito1\(2)))) # (!\divisor|digito1\(0) & (!\divisor|digito1\(2) & \divisor|digito1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(0),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(1),
	combout => \SieteSeg1|Mux5~0_combout\);

-- Location: LCCOMB_X111_Y28_N4
\SieteSeg1|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux4~0_combout\ = (\divisor|digito1\(0)) # ((\divisor|digito1\(2) & !\divisor|digito1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(0),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(1),
	combout => \SieteSeg1|Mux4~0_combout\);

-- Location: LCCOMB_X110_Y30_N16
\SieteSeg1|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux3~0_combout\ = (\divisor|digito1\(2) & (\divisor|digito1\(1) $ (!\divisor|digito1\(0)))) # (!\divisor|digito1\(2) & (!\divisor|digito1\(1) & \divisor|digito1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(2),
	datab => \divisor|digito1\(1),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux3~0_combout\);

-- Location: LCCOMB_X111_Y28_N14
\SieteSeg1|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux2~0_combout\ = (!\divisor|digito1\(0) & (!\divisor|digito1\(2) & \divisor|digito1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(0),
	datac => \divisor|digito1\(2),
	datad => \divisor|digito1\(1),
	combout => \SieteSeg1|Mux2~0_combout\);

-- Location: LCCOMB_X110_Y30_N26
\SieteSeg1|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg1|Mux1~0_combout\ = (\divisor|digito1\(1) $ (!\divisor|digito1\(0))) # (!\divisor|digito1\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \divisor|digito1\(2),
	datab => \divisor|digito1\(1),
	datad => \divisor|digito1\(0),
	combout => \SieteSeg1|Mux1~0_combout\);

-- Location: LCCOMB_X110_Y30_N20
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

-- Location: LCCOMB_X110_Y30_N14
\divisor|Mux19~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux19~0_combout\ = (!\sicronizadores|q\(1) & (!\sicronizadores|q\(2) & \sicronizadores|q\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sicronizadores|q\(1),
	datac => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(0),
	combout => \divisor|Mux19~0_combout\);

-- Location: FF_X110_Y30_N15
\divisor|digito0[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux19~0_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito0\(2));

-- Location: LCCOMB_X110_Y30_N0
\divisor|Mux19~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \divisor|Mux19~1_combout\ = (!\sicronizadores|q\(2) & !\sicronizadores|q\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \sicronizadores|q\(2),
	datad => \sicronizadores|q\(1),
	combout => \divisor|Mux19~1_combout\);

-- Location: FF_X110_Y30_N1
\divisor|digito0[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ip_pll_inst|altpll_component|auto_generated|wire_pll1_clk[0]~clkctrl_outclk\,
	d => \divisor|Mux19~1_combout\,
	ena => \divisor|digito1[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \divisor|digito0\(0));

-- Location: LCCOMB_X108_Y67_N0
\SieteSeg0|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux0~0_combout\ = (!\divisor|digito0\(2) & \divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito0\(2),
	datac => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux0~0_combout\);

-- Location: LCCOMB_X108_Y67_N10
\SieteSeg0|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux4~0_combout\ = (\divisor|digito0\(2)) # (\divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito0\(2),
	datac => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux4~0_combout\);

-- Location: LCCOMB_X108_Y67_N20
\SieteSeg0|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux3~0_combout\ = \divisor|digito0\(2) $ (\divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito0\(2),
	datac => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux3~0_combout\);

-- Location: LCCOMB_X108_Y67_N6
\SieteSeg0|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \SieteSeg0|Mux0~1_combout\ = (\divisor|digito0\(2) & \divisor|digito0\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \divisor|digito0\(2),
	datac => \divisor|digito0\(0),
	combout => \SieteSeg0|Mux0~1_combout\);
END structure;


