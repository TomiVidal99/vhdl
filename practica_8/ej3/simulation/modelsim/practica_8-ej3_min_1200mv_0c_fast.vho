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

-- DATE "11/24/2022 13:23:14"

-- 
-- Device: Altera EP3C5F256C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ej3 IS
    PORT (
	SW : IN std_logic_vector(9 DOWNTO 0);
	HEX0_D : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX1_D : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX2_D : BUFFER std_logic_vector(6 DOWNTO 0);
	HEX3_D : BUFFER std_logic_vector(6 DOWNTO 0)
	);
END ej3;

-- Design Ports Information
-- SW[4]	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0_D[0]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0_D[1]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0_D[2]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0_D[3]	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0_D[4]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0_D[5]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0_D[6]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1_D[0]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1_D[1]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1_D[2]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1_D[3]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1_D[4]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1_D[5]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1_D[6]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2_D[0]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2_D[1]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2_D[2]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2_D[3]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2_D[4]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2_D[5]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2_D[6]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3_D[0]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3_D[1]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3_D[2]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3_D[3]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3_D[4]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3_D[5]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3_D[6]	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ej3 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_HEX0_D : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX1_D : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2_D : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3_D : std_logic_vector(6 DOWNTO 0);
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \HEX0_D[0]~output_o\ : std_logic;
SIGNAL \HEX0_D[1]~output_o\ : std_logic;
SIGNAL \HEX0_D[2]~output_o\ : std_logic;
SIGNAL \HEX0_D[3]~output_o\ : std_logic;
SIGNAL \HEX0_D[4]~output_o\ : std_logic;
SIGNAL \HEX0_D[5]~output_o\ : std_logic;
SIGNAL \HEX0_D[6]~output_o\ : std_logic;
SIGNAL \HEX1_D[0]~output_o\ : std_logic;
SIGNAL \HEX1_D[1]~output_o\ : std_logic;
SIGNAL \HEX1_D[2]~output_o\ : std_logic;
SIGNAL \HEX1_D[3]~output_o\ : std_logic;
SIGNAL \HEX1_D[4]~output_o\ : std_logic;
SIGNAL \HEX1_D[5]~output_o\ : std_logic;
SIGNAL \HEX1_D[6]~output_o\ : std_logic;
SIGNAL \HEX2_D[0]~output_o\ : std_logic;
SIGNAL \HEX2_D[1]~output_o\ : std_logic;
SIGNAL \HEX2_D[2]~output_o\ : std_logic;
SIGNAL \HEX2_D[3]~output_o\ : std_logic;
SIGNAL \HEX2_D[4]~output_o\ : std_logic;
SIGNAL \HEX2_D[5]~output_o\ : std_logic;
SIGNAL \HEX2_D[6]~output_o\ : std_logic;
SIGNAL \HEX3_D[0]~output_o\ : std_logic;
SIGNAL \HEX3_D[1]~output_o\ : std_logic;
SIGNAL \HEX3_D[2]~output_o\ : std_logic;
SIGNAL \HEX3_D[3]~output_o\ : std_logic;
SIGNAL \HEX3_D[4]~output_o\ : std_logic;
SIGNAL \HEX3_D[5]~output_o\ : std_logic;
SIGNAL \HEX3_D[6]~output_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \d7s0|Mux6~0_combout\ : std_logic;
SIGNAL \d7s0|salida[0]~0_combout\ : std_logic;
SIGNAL \d7s0|Mux5~0_combout\ : std_logic;
SIGNAL \d7s0|salida[1]~1_combout\ : std_logic;
SIGNAL \d7s0|Mux4~0_combout\ : std_logic;
SIGNAL \d7s0|salida[2]~2_combout\ : std_logic;
SIGNAL \d7s0|Mux3~0_combout\ : std_logic;
SIGNAL \d7s0|salida[3]~3_combout\ : std_logic;
SIGNAL \d7s0|Mux2~0_combout\ : std_logic;
SIGNAL \d7s0|salida[4]~4_combout\ : std_logic;
SIGNAL \d7s0|Mux1~0_combout\ : std_logic;
SIGNAL \d7s0|salida[5]~5_combout\ : std_logic;
SIGNAL \d7s0|Mux0~0_combout\ : std_logic;
SIGNAL \d7s0|salida[6]~6_combout\ : std_logic;
SIGNAL \d7s1|salida[0]~0_combout\ : std_logic;
SIGNAL \d7s1|salida[1]~1_combout\ : std_logic;
SIGNAL \d7s1|salida[2]~2_combout\ : std_logic;
SIGNAL \d7s1|salida[3]~3_combout\ : std_logic;
SIGNAL \d7s1|salida[4]~4_combout\ : std_logic;
SIGNAL \d7s1|salida[5]~5_combout\ : std_logic;
SIGNAL \d7s1|salida[6]~6_combout\ : std_logic;
SIGNAL \d7s2|salida[0]~0_combout\ : std_logic;
SIGNAL \d7s2|salida[1]~1_combout\ : std_logic;
SIGNAL \d7s2|salida[2]~2_combout\ : std_logic;
SIGNAL \d7s2|salida[3]~3_combout\ : std_logic;
SIGNAL \d7s2|salida[4]~4_combout\ : std_logic;
SIGNAL \d7s2|salida[5]~5_combout\ : std_logic;
SIGNAL \d7s2|salida[6]~6_combout\ : std_logic;
SIGNAL \d7s3|salida[0]~0_combout\ : std_logic;
SIGNAL \d7s3|salida[1]~1_combout\ : std_logic;
SIGNAL \d7s3|salida[2]~2_combout\ : std_logic;
SIGNAL \d7s3|salida[3]~3_combout\ : std_logic;
SIGNAL \d7s3|salida[4]~4_combout\ : std_logic;
SIGNAL \d7s3|salida[5]~5_combout\ : std_logic;
SIGNAL \d7s3|salida[6]~6_combout\ : std_logic;

BEGIN

ww_SW <= SW;
HEX0_D <= ww_HEX0_D;
HEX1_D <= ww_HEX1_D;
HEX2_D <= ww_HEX2_D;
HEX3_D <= ww_HEX3_D;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X9_Y0_N2
\HEX0_D[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s0|salida[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX0_D[0]~output_o\);

-- Location: IOOBUF_X21_Y0_N23
\HEX0_D[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s0|salida[1]~1_combout\,
	devoe => ww_devoe,
	o => \HEX0_D[1]~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\HEX0_D[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s0|salida[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX0_D[2]~output_o\);

-- Location: IOOBUF_X11_Y0_N16
\HEX0_D[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s0|salida[3]~3_combout\,
	devoe => ww_devoe,
	o => \HEX0_D[3]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\HEX0_D[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s0|salida[4]~4_combout\,
	devoe => ww_devoe,
	o => \HEX0_D[4]~output_o\);

-- Location: IOOBUF_X0_Y6_N23
\HEX0_D[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s0|salida[5]~5_combout\,
	devoe => ww_devoe,
	o => \HEX0_D[5]~output_o\);

-- Location: IOOBUF_X11_Y0_N9
\HEX0_D[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s0|salida[6]~6_combout\,
	devoe => ww_devoe,
	o => \HEX0_D[6]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\HEX1_D[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s1|salida[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX1_D[0]~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\HEX1_D[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s1|salida[1]~1_combout\,
	devoe => ww_devoe,
	o => \HEX1_D[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N16
\HEX1_D[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s1|salida[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX1_D[2]~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\HEX1_D[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s1|salida[3]~3_combout\,
	devoe => ww_devoe,
	o => \HEX1_D[3]~output_o\);

-- Location: IOOBUF_X13_Y24_N2
\HEX1_D[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s1|salida[4]~4_combout\,
	devoe => ww_devoe,
	o => \HEX1_D[4]~output_o\);

-- Location: IOOBUF_X9_Y0_N23
\HEX1_D[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s1|salida[5]~5_combout\,
	devoe => ww_devoe,
	o => \HEX1_D[5]~output_o\);

-- Location: IOOBUF_X11_Y24_N2
\HEX1_D[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s1|salida[6]~6_combout\,
	devoe => ww_devoe,
	o => \HEX1_D[6]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\HEX2_D[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s2|salida[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX2_D[0]~output_o\);

-- Location: IOOBUF_X7_Y0_N16
\HEX2_D[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s2|salida[1]~1_combout\,
	devoe => ww_devoe,
	o => \HEX2_D[1]~output_o\);

-- Location: IOOBUF_X13_Y0_N16
\HEX2_D[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s2|salida[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX2_D[2]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\HEX2_D[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s2|salida[3]~3_combout\,
	devoe => ww_devoe,
	o => \HEX2_D[3]~output_o\);

-- Location: IOOBUF_X11_Y0_N2
\HEX2_D[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s2|salida[4]~4_combout\,
	devoe => ww_devoe,
	o => \HEX2_D[4]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\HEX2_D[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s2|salida[5]~5_combout\,
	devoe => ww_devoe,
	o => \HEX2_D[5]~output_o\);

-- Location: IOOBUF_X11_Y24_N9
\HEX2_D[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s2|salida[6]~6_combout\,
	devoe => ww_devoe,
	o => \HEX2_D[6]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\HEX3_D[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s3|salida[0]~0_combout\,
	devoe => ww_devoe,
	o => \HEX3_D[0]~output_o\);

-- Location: IOOBUF_X9_Y0_N9
\HEX3_D[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s3|salida[1]~1_combout\,
	devoe => ww_devoe,
	o => \HEX3_D[1]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\HEX3_D[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s3|salida[2]~2_combout\,
	devoe => ww_devoe,
	o => \HEX3_D[2]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\HEX3_D[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s3|salida[3]~3_combout\,
	devoe => ww_devoe,
	o => \HEX3_D[3]~output_o\);

-- Location: IOOBUF_X7_Y0_N9
\HEX3_D[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s3|salida[4]~4_combout\,
	devoe => ww_devoe,
	o => \HEX3_D[4]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\HEX3_D[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s3|salida[5]~5_combout\,
	devoe => ww_devoe,
	o => \HEX3_D[5]~output_o\);

-- Location: IOOBUF_X0_Y5_N23
\HEX3_D[6]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \d7s3|salida[6]~6_combout\,
	devoe => ww_devoe,
	o => \HEX3_D[6]~output_o\);

-- Location: IOIBUF_X13_Y0_N22
\SW[8]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\SW[9]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: IOIBUF_X13_Y24_N8
\SW[0]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: IOIBUF_X11_Y0_N22
\SW[3]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X18_Y0_N1
\SW[2]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: IOIBUF_X18_Y0_N8
\SW[1]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LCCOMB_X14_Y6_N16
\d7s0|Mux6~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|Mux6~0_combout\ = (\SW[0]~input_o\ & (!\SW[2]~input_o\ & (\SW[3]~input_o\ $ (!\SW[1]~input_o\)))) # (!\SW[0]~input_o\ & (!\SW[3]~input_o\ & (\SW[2]~input_o\ & !\SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \d7s0|Mux6~0_combout\);

-- Location: LCCOMB_X14_Y3_N16
\d7s0|salida[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|salida[0]~0_combout\ = (\SW[8]~input_o\) # ((\SW[9]~input_o\) # (\d7s0|Mux6~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux6~0_combout\,
	combout => \d7s0|salida[0]~0_combout\);

-- Location: LCCOMB_X14_Y6_N18
\d7s0|Mux5~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|Mux5~0_combout\ = (\SW[3]~input_o\ & ((\SW[0]~input_o\ & ((\SW[1]~input_o\))) # (!\SW[0]~input_o\ & (\SW[2]~input_o\)))) # (!\SW[3]~input_o\ & (\SW[2]~input_o\ & (\SW[0]~input_o\ $ (\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \d7s0|Mux5~0_combout\);

-- Location: LCCOMB_X14_Y3_N18
\d7s0|salida[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|salida[1]~1_combout\ = (\SW[8]~input_o\) # ((\SW[9]~input_o\) # (\d7s0|Mux5~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux5~0_combout\,
	combout => \d7s0|salida[1]~1_combout\);

-- Location: LCCOMB_X14_Y6_N12
\d7s0|Mux4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|Mux4~0_combout\ = (\SW[3]~input_o\ & (\SW[2]~input_o\ & ((\SW[1]~input_o\) # (!\SW[0]~input_o\)))) # (!\SW[3]~input_o\ & (!\SW[0]~input_o\ & (!\SW[2]~input_o\ & \SW[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \d7s0|Mux4~0_combout\);

-- Location: LCCOMB_X14_Y3_N12
\d7s0|salida[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|salida[2]~2_combout\ = (\SW[8]~input_o\) # ((\d7s0|Mux4~0_combout\) # (\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \d7s0|Mux4~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \d7s0|salida[2]~2_combout\);

-- Location: LCCOMB_X14_Y6_N6
\d7s0|Mux3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|Mux3~0_combout\ = (\SW[3]~input_o\ & (\SW[1]~input_o\ & (\SW[0]~input_o\ $ (!\SW[2]~input_o\)))) # (!\SW[3]~input_o\ & (\SW[0]~input_o\ $ (((\SW[2]~input_o\ & !\SW[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \d7s0|Mux3~0_combout\);

-- Location: LCCOMB_X13_Y6_N24
\d7s0|salida[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|salida[3]~3_combout\ = (\d7s0|Mux3~0_combout\) # ((\SW[8]~input_o\) # (\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux3~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s0|salida[3]~3_combout\);

-- Location: LCCOMB_X14_Y6_N24
\d7s0|Mux2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|Mux2~0_combout\ = (\SW[1]~input_o\ & (\SW[0]~input_o\ & (!\SW[3]~input_o\))) # (!\SW[1]~input_o\ & ((\SW[2]~input_o\ & ((!\SW[3]~input_o\))) # (!\SW[2]~input_o\ & (\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \d7s0|Mux2~0_combout\);

-- Location: LCCOMB_X13_Y6_N2
\d7s0|salida[4]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|salida[4]~4_combout\ = (\d7s0|Mux2~0_combout\) # ((\SW[8]~input_o\) # (\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d7s0|Mux2~0_combout\,
	datac => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s0|salida[4]~4_combout\);

-- Location: LCCOMB_X14_Y6_N2
\d7s0|Mux1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|Mux1~0_combout\ = (\SW[2]~input_o\ & (\SW[0]~input_o\ & (\SW[3]~input_o\ $ (\SW[1]~input_o\)))) # (!\SW[2]~input_o\ & (!\SW[3]~input_o\ & (\SW[0]~input_o\ $ (\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \d7s0|Mux1~0_combout\);

-- Location: LCCOMB_X13_Y6_N4
\d7s0|salida[5]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|salida[5]~5_combout\ = (\d7s0|Mux1~0_combout\) # ((\SW[8]~input_o\) # (\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux1~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s0|salida[5]~5_combout\);

-- Location: LCCOMB_X14_Y6_N4
\d7s0|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|Mux0~0_combout\ = (\SW[1]~input_o\ & (((\SW[3]~input_o\) # (!\SW[2]~input_o\)) # (!\SW[0]~input_o\))) # (!\SW[1]~input_o\ & ((\SW[3]~input_o\ $ (\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \SW[2]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \d7s0|Mux0~0_combout\);

-- Location: LCCOMB_X13_Y6_N14
\d7s0|salida[6]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s0|salida[6]~6_combout\ = ((\SW[8]~input_o\) # (\SW[9]~input_o\)) # (!\d7s0|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux0~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s0|salida[6]~6_combout\);

-- Location: LCCOMB_X14_Y3_N30
\d7s1|salida[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s1|salida[0]~0_combout\ = ((\SW[9]~input_o\) # (\d7s0|Mux6~0_combout\)) # (!\SW[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux6~0_combout\,
	combout => \d7s1|salida[0]~0_combout\);

-- Location: LCCOMB_X14_Y3_N8
\d7s1|salida[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s1|salida[1]~1_combout\ = ((\SW[9]~input_o\) # (\d7s0|Mux5~0_combout\)) # (!\SW[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux5~0_combout\,
	combout => \d7s1|salida[1]~1_combout\);

-- Location: LCCOMB_X14_Y3_N10
\d7s1|salida[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s1|salida[2]~2_combout\ = ((\d7s0|Mux4~0_combout\) # (\SW[9]~input_o\)) # (!\SW[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \d7s0|Mux4~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \d7s1|salida[2]~2_combout\);

-- Location: LCCOMB_X13_Y6_N8
\d7s1|salida[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s1|salida[3]~3_combout\ = (\d7s0|Mux3~0_combout\) # ((\SW[9]~input_o\) # (!\SW[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux3~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s1|salida[3]~3_combout\);

-- Location: LCCOMB_X13_Y6_N26
\d7s1|salida[4]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s1|salida[4]~4_combout\ = (\d7s0|Mux2~0_combout\) # ((\SW[9]~input_o\) # (!\SW[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d7s0|Mux2~0_combout\,
	datac => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s1|salida[4]~4_combout\);

-- Location: LCCOMB_X13_Y6_N12
\d7s1|salida[5]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s1|salida[5]~5_combout\ = (\d7s0|Mux1~0_combout\) # ((\SW[9]~input_o\) # (!\SW[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux1~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s1|salida[5]~5_combout\);

-- Location: LCCOMB_X13_Y6_N22
\d7s1|salida[6]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s1|salida[6]~6_combout\ = ((\SW[9]~input_o\) # (!\SW[8]~input_o\)) # (!\d7s0|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux0~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s1|salida[6]~6_combout\);

-- Location: LCCOMB_X14_Y3_N4
\d7s2|salida[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s2|salida[0]~0_combout\ = (\SW[8]~input_o\) # ((\d7s0|Mux6~0_combout\) # (!\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux6~0_combout\,
	combout => \d7s2|salida[0]~0_combout\);

-- Location: LCCOMB_X14_Y3_N14
\d7s2|salida[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s2|salida[1]~1_combout\ = (\SW[8]~input_o\) # ((\d7s0|Mux5~0_combout\) # (!\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux5~0_combout\,
	combout => \d7s2|salida[1]~1_combout\);

-- Location: LCCOMB_X14_Y3_N24
\d7s2|salida[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s2|salida[2]~2_combout\ = (\SW[8]~input_o\) # ((\d7s0|Mux4~0_combout\) # (!\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \d7s0|Mux4~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \d7s2|salida[2]~2_combout\);

-- Location: LCCOMB_X13_Y6_N16
\d7s2|salida[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s2|salida[3]~3_combout\ = (\d7s0|Mux3~0_combout\) # ((\SW[8]~input_o\) # (!\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux3~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s2|salida[3]~3_combout\);

-- Location: LCCOMB_X13_Y6_N18
\d7s2|salida[4]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s2|salida[4]~4_combout\ = (\d7s0|Mux2~0_combout\) # ((\SW[8]~input_o\) # (!\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d7s0|Mux2~0_combout\,
	datac => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s2|salida[4]~4_combout\);

-- Location: LCCOMB_X13_Y6_N28
\d7s2|salida[5]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s2|salida[5]~5_combout\ = (\d7s0|Mux1~0_combout\) # ((\SW[8]~input_o\) # (!\SW[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux1~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s2|salida[5]~5_combout\);

-- Location: LCCOMB_X13_Y6_N30
\d7s2|salida[6]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s2|salida[6]~6_combout\ = ((\SW[8]~input_o\) # (!\SW[9]~input_o\)) # (!\d7s0|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux0~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s2|salida[6]~6_combout\);

-- Location: LCCOMB_X14_Y3_N26
\d7s3|salida[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s3|salida[0]~0_combout\ = ((\d7s0|Mux6~0_combout\) # (!\SW[9]~input_o\)) # (!\SW[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux6~0_combout\,
	combout => \d7s3|salida[0]~0_combout\);

-- Location: LCCOMB_X14_Y3_N28
\d7s3|salida[1]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s3|salida[1]~1_combout\ = ((\d7s0|Mux5~0_combout\) # (!\SW[9]~input_o\)) # (!\SW[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \SW[9]~input_o\,
	datad => \d7s0|Mux5~0_combout\,
	combout => \d7s3|salida[1]~1_combout\);

-- Location: LCCOMB_X14_Y3_N22
\d7s3|salida[2]~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s3|salida[2]~2_combout\ = ((\d7s0|Mux4~0_combout\) # (!\SW[9]~input_o\)) # (!\SW[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[8]~input_o\,
	datab => \d7s0|Mux4~0_combout\,
	datad => \SW[9]~input_o\,
	combout => \d7s3|salida[2]~2_combout\);

-- Location: LCCOMB_X13_Y6_N0
\d7s3|salida[3]~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s3|salida[3]~3_combout\ = (\d7s0|Mux3~0_combout\) # ((!\SW[9]~input_o\) # (!\SW[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux3~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s3|salida[3]~3_combout\);

-- Location: LCCOMB_X13_Y6_N10
\d7s3|salida[4]~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s3|salida[4]~4_combout\ = (\d7s0|Mux2~0_combout\) # ((!\SW[9]~input_o\) # (!\SW[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \d7s0|Mux2~0_combout\,
	datac => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s3|salida[4]~4_combout\);

-- Location: LCCOMB_X13_Y6_N20
\d7s3|salida[5]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s3|salida[5]~5_combout\ = (\d7s0|Mux1~0_combout\) # ((!\SW[9]~input_o\) # (!\SW[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux1~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s3|salida[5]~5_combout\);

-- Location: LCCOMB_X13_Y6_N6
\d7s3|salida[6]~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \d7s3|salida[6]~6_combout\ = ((!\SW[9]~input_o\) # (!\SW[8]~input_o\)) # (!\d7s0|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \d7s0|Mux0~0_combout\,
	datab => \SW[8]~input_o\,
	datad => \SW[9]~input_o\,
	combout => \d7s3|salida[6]~6_combout\);

-- Location: IOIBUF_X34_Y12_N8
\SW[4]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\SW[5]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: IOIBUF_X3_Y24_N15
\SW[6]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X28_Y24_N22
\SW[7]~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

ww_HEX0_D(0) <= \HEX0_D[0]~output_o\;

ww_HEX0_D(1) <= \HEX0_D[1]~output_o\;

ww_HEX0_D(2) <= \HEX0_D[2]~output_o\;

ww_HEX0_D(3) <= \HEX0_D[3]~output_o\;

ww_HEX0_D(4) <= \HEX0_D[4]~output_o\;

ww_HEX0_D(5) <= \HEX0_D[5]~output_o\;

ww_HEX0_D(6) <= \HEX0_D[6]~output_o\;

ww_HEX1_D(0) <= \HEX1_D[0]~output_o\;

ww_HEX1_D(1) <= \HEX1_D[1]~output_o\;

ww_HEX1_D(2) <= \HEX1_D[2]~output_o\;

ww_HEX1_D(3) <= \HEX1_D[3]~output_o\;

ww_HEX1_D(4) <= \HEX1_D[4]~output_o\;

ww_HEX1_D(5) <= \HEX1_D[5]~output_o\;

ww_HEX1_D(6) <= \HEX1_D[6]~output_o\;

ww_HEX2_D(0) <= \HEX2_D[0]~output_o\;

ww_HEX2_D(1) <= \HEX2_D[1]~output_o\;

ww_HEX2_D(2) <= \HEX2_D[2]~output_o\;

ww_HEX2_D(3) <= \HEX2_D[3]~output_o\;

ww_HEX2_D(4) <= \HEX2_D[4]~output_o\;

ww_HEX2_D(5) <= \HEX2_D[5]~output_o\;

ww_HEX2_D(6) <= \HEX2_D[6]~output_o\;

ww_HEX3_D(0) <= \HEX3_D[0]~output_o\;

ww_HEX3_D(1) <= \HEX3_D[1]~output_o\;

ww_HEX3_D(2) <= \HEX3_D[2]~output_o\;

ww_HEX3_D(3) <= \HEX3_D[3]~output_o\;

ww_HEX3_D(4) <= \HEX3_D[4]~output_o\;

ww_HEX3_D(5) <= \HEX3_D[5]~output_o\;

ww_HEX3_D(6) <= \HEX3_D[6]~output_o\;
END structure;


