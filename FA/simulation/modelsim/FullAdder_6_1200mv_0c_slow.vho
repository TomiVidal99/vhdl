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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/20/2022 10:36:14"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	full_adder IS
    PORT (
	A : IN std_logic;
	B : IN std_logic;
	Ci : IN std_logic;
	S : OUT std_logic;
	Co : OUT std_logic
	);
END full_adder;

-- Design Ports Information
-- S	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Co	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ci	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF full_adder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_Ci : std_logic;
SIGNAL ww_S : std_logic;
SIGNAL ww_Co : std_logic;
SIGNAL \S~output_o\ : std_logic;
SIGNAL \Co~output_o\ : std_logic;
SIGNAL \A~input_o\ : std_logic;
SIGNAL \Ci~input_o\ : std_logic;
SIGNAL \B~input_o\ : std_logic;
SIGNAL \S~0_combout\ : std_logic;
SIGNAL \Co~0_combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_Ci <= Ci;
S <= ww_S;
Co <= ww_Co;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y0_N9
\S~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \S~0_combout\,
	devoe => ww_devoe,
	o => \S~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\Co~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Co~0_combout\,
	devoe => ww_devoe,
	o => \Co~output_o\);

-- Location: IOIBUF_X8_Y0_N1
\A~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A,
	o => \A~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\Ci~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ci,
	o => \Ci~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\B~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B,
	o => \B~input_o\);

-- Location: LCCOMB_X8_Y1_N24
\S~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \S~0_combout\ = \A~input_o\ $ (\Ci~input_o\ $ (\B~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~input_o\,
	datac => \Ci~input_o\,
	datad => \B~input_o\,
	combout => \S~0_combout\);

-- Location: LCCOMB_X8_Y1_N2
\Co~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Co~0_combout\ = (\A~input_o\ & ((\Ci~input_o\) # (\B~input_o\))) # (!\A~input_o\ & (\Ci~input_o\ & \B~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~input_o\,
	datac => \Ci~input_o\,
	datad => \B~input_o\,
	combout => \Co~0_combout\);

ww_S <= \S~output_o\;

ww_Co <= \Co~output_o\;
END structure;


