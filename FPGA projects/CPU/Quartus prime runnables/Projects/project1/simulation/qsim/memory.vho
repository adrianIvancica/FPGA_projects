-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "03/28/2024 16:24:53"

-- 
-- Device: Altera 5CSEMA5F31C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DAG_top IS
    PORT (
	DMD : BUFFER std_logic_vector(15 DOWNTO 0);
	clk : IN std_logic;
	reverse_bit : IN std_logic;
	sel : IN std_logic_vector(6 DOWNTO 0)
	);
END DAG_top;

-- Design Ports Information
-- reverse_bit	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[0]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[1]	=>  Location: PIN_AD7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[2]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[0]	=>  Location: PIN_V16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[1]	=>  Location: PIN_W16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[2]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[3]	=>  Location: PIN_V18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[4]	=>  Location: PIN_W17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[5]	=>  Location: PIN_W19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[7]	=>  Location: PIN_W20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[8]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[9]	=>  Location: PIN_Y21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[10]	=>  Location: PIN_AJ17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[11]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[12]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[13]	=>  Location: PIN_AK18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[14]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DMD[15]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[5]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[6]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sel[4]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF DAG_top IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_DMD : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_reverse_bit : std_logic;
SIGNAL ww_sel : std_logic_vector(6 DOWNTO 0);
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(19 DOWNTO 0);
SIGNAL \reverse_bit~input_o\ : std_logic;
SIGNAL \sel[0]~input_o\ : std_logic;
SIGNAL \sel[1]~input_o\ : std_logic;
SIGNAL \sel[2]~input_o\ : std_logic;
SIGNAL \DMD[0]~input_o\ : std_logic;
SIGNAL \DMD[1]~input_o\ : std_logic;
SIGNAL \DMD[2]~input_o\ : std_logic;
SIGNAL \DMD[3]~input_o\ : std_logic;
SIGNAL \DMD[4]~input_o\ : std_logic;
SIGNAL \DMD[5]~input_o\ : std_logic;
SIGNAL \DMD[6]~input_o\ : std_logic;
SIGNAL \DMD[7]~input_o\ : std_logic;
SIGNAL \DMD[8]~input_o\ : std_logic;
SIGNAL \DMD[9]~input_o\ : std_logic;
SIGNAL \DMD[10]~input_o\ : std_logic;
SIGNAL \DMD[11]~input_o\ : std_logic;
SIGNAL \DMD[12]~input_o\ : std_logic;
SIGNAL \DMD[13]~input_o\ : std_logic;
SIGNAL \DMD[14]~input_o\ : std_logic;
SIGNAL \DMD[15]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \sel[6]~input_o\ : std_logic;
SIGNAL \sel[5]~input_o\ : std_logic;
SIGNAL \MUX3|output~0_combout\ : std_logic;
SIGNAL \sel[3]~input_o\ : std_logic;
SIGNAL \sel[4]~input_o\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a0~portadataout\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a1\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a2\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a3\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a4\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a5\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a6\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a7\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a8\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a9\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a10\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a11\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a12\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a13\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a14\ : std_logic;
SIGNAL \memoryunit|altsyncram_component|auto_generated|ram_block1a15\ : std_logic;
SIGNAL \ALT_INV_sel[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_sel[5]~input_o\ : std_logic;

BEGIN

DMD <= ww_DMD;
ww_clk <= clk;
ww_reverse_bit <= reverse_bit;
ww_sel <= sel;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & 
\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & vcc & \~GND~combout\);

\memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\sel[4]~input_o\ & \sel[3]~input_o\ & \sel[6]~input_o\ & \MUX3|output~0_combout\ & \~GND~combout\);

\memoryunit|altsyncram_component|auto_generated|ram_block1a0~portadataout\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\memoryunit|altsyncram_component|auto_generated|ram_block1a1\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\memoryunit|altsyncram_component|auto_generated|ram_block1a2\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\memoryunit|altsyncram_component|auto_generated|ram_block1a3\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\memoryunit|altsyncram_component|auto_generated|ram_block1a4\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\memoryunit|altsyncram_component|auto_generated|ram_block1a5\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\memoryunit|altsyncram_component|auto_generated|ram_block1a6\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\memoryunit|altsyncram_component|auto_generated|ram_block1a7\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\memoryunit|altsyncram_component|auto_generated|ram_block1a8\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\memoryunit|altsyncram_component|auto_generated|ram_block1a9\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\memoryunit|altsyncram_component|auto_generated|ram_block1a10\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\memoryunit|altsyncram_component|auto_generated|ram_block1a11\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\memoryunit|altsyncram_component|auto_generated|ram_block1a12\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\memoryunit|altsyncram_component|auto_generated|ram_block1a13\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\memoryunit|altsyncram_component|auto_generated|ram_block1a14\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\memoryunit|altsyncram_component|auto_generated|ram_block1a15\ <= \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);
\ALT_INV_sel[6]~input_o\ <= NOT \sel[6]~input_o\;
\ALT_INV_sel[5]~input_o\ <= NOT \sel[5]~input_o\;

-- Location: IOOBUF_X52_Y0_N2
\DMD[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a0~portadataout\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(0));

-- Location: IOOBUF_X52_Y0_N19
\DMD[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a1\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(1));

-- Location: IOOBUF_X60_Y0_N2
\DMD[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a2\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(2));

-- Location: IOOBUF_X80_Y0_N2
\DMD[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a3\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(3));

-- Location: IOOBUF_X60_Y0_N19
\DMD[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a4\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(4));

-- Location: IOOBUF_X80_Y0_N19
\DMD[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a5\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(5));

-- Location: IOOBUF_X84_Y0_N2
\DMD[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a6\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(6));

-- Location: IOOBUF_X89_Y6_N5
\DMD[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a7\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(7));

-- Location: IOOBUF_X89_Y8_N5
\DMD[8]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a8\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(8));

-- Location: IOOBUF_X89_Y6_N22
\DMD[9]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a9\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(9));

-- Location: IOOBUF_X58_Y0_N42
\DMD[10]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a10\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(10));

-- Location: IOOBUF_X58_Y0_N76
\DMD[11]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a11\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(11));

-- Location: IOOBUF_X58_Y0_N93
\DMD[12]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a12\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(12));

-- Location: IOOBUF_X58_Y0_N59
\DMD[13]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a13\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(13));

-- Location: IOOBUF_X56_Y0_N53
\DMD[14]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a14\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(14));

-- Location: IOOBUF_X56_Y0_N2
\DMD[15]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \memoryunit|altsyncram_component|auto_generated|ram_block1a15\,
	oe => VCC,
	devoe => ww_devoe,
	o => ww_DMD(15));

-- Location: IOIBUF_X36_Y0_N1
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G6
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: LABCELL_X57_Y2_N36
\~GND\ : cyclonev_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: IOIBUF_X4_Y0_N52
\sel[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(6),
	o => \sel[6]~input_o\);

-- Location: IOIBUF_X8_Y0_N35
\sel[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(5),
	o => \sel[5]~input_o\);

-- Location: LABCELL_X42_Y2_N48
\MUX3|output~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \MUX3|output~0_combout\ = ( \sel[6]~input_o\ & ( \sel[5]~input_o\ ) ) # ( !\sel[6]~input_o\ & ( !\sel[5]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111000000000000000000000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datae => \ALT_INV_sel[6]~input_o\,
	dataf => \ALT_INV_sel[5]~input_o\,
	combout => \MUX3|output~0_combout\);

-- Location: IOIBUF_X12_Y0_N18
\sel[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(3),
	o => \sel[3]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\sel[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(4),
	o => \sel[4]~input_o\);

-- Location: M10K_X58_Y2_N0
\memoryunit|altsyncram_component|auto_generated|ram_block1a0\ : cyclonev_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => "0000000000000000001C00000000000000000018000000001600000000000000000000000000001000000000000000000000000000000A00000000080000000006000000000400000000020000000000",
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "memory.mif",
	init_file_layout => "port_a",
	logical_ram_name => "testMEM:memoryunit|altsyncram:altsyncram_component|altsyncram_nn14:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 5,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 20,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 31,
	port_a_logical_ram_depth => 16384,
	port_a_logical_ram_width => 16,
	port_a_read_during_write_mode => "new_data_no_nbe_read",
	port_b_address_width => 5,
	port_b_data_width => 20,
	ram_block_type => "M20K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~inputCLKENA0_outclk\,
	ena0 => VCC,
	portadatain => \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \memoryunit|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: IOIBUF_X89_Y11_N44
\reverse_bit~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reverse_bit,
	o => \reverse_bit~input_o\);

-- Location: IOIBUF_X89_Y4_N44
\sel[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(0),
	o => \sel[0]~input_o\);

-- Location: IOIBUF_X6_Y0_N1
\sel[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(1),
	o => \sel[1]~input_o\);

-- Location: IOIBUF_X86_Y0_N1
\sel[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sel(2),
	o => \sel[2]~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\DMD[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(0),
	o => \DMD[0]~input_o\);

-- Location: IOIBUF_X52_Y0_N18
\DMD[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(1),
	o => \DMD[1]~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\DMD[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(2),
	o => \DMD[2]~input_o\);

-- Location: IOIBUF_X80_Y0_N1
\DMD[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(3),
	o => \DMD[3]~input_o\);

-- Location: IOIBUF_X60_Y0_N18
\DMD[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(4),
	o => \DMD[4]~input_o\);

-- Location: IOIBUF_X80_Y0_N18
\DMD[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(5),
	o => \DMD[5]~input_o\);

-- Location: IOIBUF_X84_Y0_N1
\DMD[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(6),
	o => \DMD[6]~input_o\);

-- Location: IOIBUF_X89_Y6_N4
\DMD[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(7),
	o => \DMD[7]~input_o\);

-- Location: IOIBUF_X89_Y8_N4
\DMD[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(8),
	o => \DMD[8]~input_o\);

-- Location: IOIBUF_X89_Y6_N21
\DMD[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(9),
	o => \DMD[9]~input_o\);

-- Location: IOIBUF_X58_Y0_N41
\DMD[10]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(10),
	o => \DMD[10]~input_o\);

-- Location: IOIBUF_X58_Y0_N75
\DMD[11]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(11),
	o => \DMD[11]~input_o\);

-- Location: IOIBUF_X58_Y0_N92
\DMD[12]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(12),
	o => \DMD[12]~input_o\);

-- Location: IOIBUF_X58_Y0_N58
\DMD[13]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(13),
	o => \DMD[13]~input_o\);

-- Location: IOIBUF_X56_Y0_N52
\DMD[14]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(14),
	o => \DMD[14]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\DMD[15]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DMD(15),
	o => \DMD[15]~input_o\);
END structure;


