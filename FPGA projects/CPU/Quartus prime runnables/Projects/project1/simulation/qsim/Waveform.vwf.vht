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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/28/2024 16:24:52"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DAG_top
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DAG_top_vhd_vec_tst IS
END DAG_top_vhd_vec_tst;
ARCHITECTURE DAG_top_arch OF DAG_top_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL DMD : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL reverse_bit : STD_LOGIC;
SIGNAL sel : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT DAG_top
	PORT (
	clk : IN STD_LOGIC;
	DMD : BUFFER STD_LOGIC_VECTOR(15 DOWNTO 0);
	reverse_bit : IN STD_LOGIC;
	sel : IN STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : DAG_top
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	DMD => DMD,
	reverse_bit => reverse_bit,
	sel => sel
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	clk <= '1';
WAIT;
END PROCESS t_prcs_clk;
-- DMD[15]
t_prcs_DMD_15: PROCESS
BEGIN
	DMD(15) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_15;
-- DMD[14]
t_prcs_DMD_14: PROCESS
BEGIN
	DMD(14) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_14;
-- DMD[13]
t_prcs_DMD_13: PROCESS
BEGIN
	DMD(13) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_13;
-- DMD[12]
t_prcs_DMD_12: PROCESS
BEGIN
	DMD(12) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_12;
-- DMD[11]
t_prcs_DMD_11: PROCESS
BEGIN
	DMD(11) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_11;
-- DMD[10]
t_prcs_DMD_10: PROCESS
BEGIN
	DMD(10) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_10;
-- DMD[9]
t_prcs_DMD_9: PROCESS
BEGIN
	DMD(9) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_9;
-- DMD[8]
t_prcs_DMD_8: PROCESS
BEGIN
	DMD(8) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_8;
-- DMD[7]
t_prcs_DMD_7: PROCESS
BEGIN
	DMD(7) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_7;
-- DMD[6]
t_prcs_DMD_6: PROCESS
BEGIN
	DMD(6) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_6;
-- DMD[5]
t_prcs_DMD_5: PROCESS
BEGIN
	DMD(5) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_5;
-- DMD[4]
t_prcs_DMD_4: PROCESS
BEGIN
	DMD(4) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_4;
-- DMD[3]
t_prcs_DMD_3: PROCESS
BEGIN
	DMD(3) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_3;
-- DMD[2]
t_prcs_DMD_2: PROCESS
BEGIN
	DMD(2) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_2;
-- DMD[1]
t_prcs_DMD_1: PROCESS
BEGIN
	DMD(1) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_1;
-- DMD[0]
t_prcs_DMD_0: PROCESS
BEGIN
	DMD(0) <= 'Z';
WAIT;
END PROCESS t_prcs_DMD_0;
-- sel[6]
t_prcs_sel_6: PROCESS
BEGIN
	sel(6) <= '0';
WAIT;
END PROCESS t_prcs_sel_6;
-- sel[5]
t_prcs_sel_5: PROCESS
BEGIN
	sel(5) <= '0';
WAIT;
END PROCESS t_prcs_sel_5;
-- sel[4]
t_prcs_sel_4: PROCESS
BEGIN
	sel(4) <= '0';
WAIT;
END PROCESS t_prcs_sel_4;
-- sel[3]
t_prcs_sel_3: PROCESS
BEGIN
	sel(3) <= '0';
WAIT;
END PROCESS t_prcs_sel_3;
-- sel[2]
t_prcs_sel_2: PROCESS
BEGIN
	sel(2) <= '0';
WAIT;
END PROCESS t_prcs_sel_2;
-- sel[1]
t_prcs_sel_1: PROCESS
BEGIN
	sel(1) <= '0';
WAIT;
END PROCESS t_prcs_sel_1;
-- sel[0]
t_prcs_sel_0: PROCESS
BEGIN
	sel(0) <= '0';
WAIT;
END PROCESS t_prcs_sel_0;
END DAG_top_arch;
