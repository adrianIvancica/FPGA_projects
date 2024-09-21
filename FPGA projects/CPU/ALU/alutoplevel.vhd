library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Entity alutoplevel is
    Port( CLK: in std_logic;
		L: in std_logic_vector(5 downto 0);		--each bit controls a load for a register
		Sel: in std_logic_vector(5 downto 0);		--each bit controls a select for a mux
		DMD, R: inout std_logic_vector(15 downto 0);	--connections to DMD and R bus
		PMD: in std_logic_vector(23 downto 0);		--connection to PMD bus
		AMF: in std_logic_vector(4 downto 0);			--function select for the ALU
		CI: in std_logic;								--carry in bit
		En: in std_logic_vector(3 downto 0);		--each bit controls an enable for a tristate buffer
		AZ, AN, AC, AV, AS: out std_logic;			--ALU flags
        alu_out: inout std_logic_vector(15 downto 0);
		Reset: in std_logic						--global reset for all registers. Active high. Asynchronous
		  --for testing purposes with DE1 SoC board, you can comment this out otherwise
		  --seg0 : out std_logic_vector(6 downto 0);
		  --seg1 : out std_logic_vector(6 downto 0);
		  --seg2 : out std_logic_vector(6 downto 0);
		  --seg3 : out std_logic_vector(6 downto 0)
    );
end alutoplevel;

Architecture Arch_topLevelALU of alutoplevel is

	Component Register_generic is
		generic(
		  N: integer := 16
		);
		Port(datain : in std_logic_vector(N-1 downto 0);
			load, clk, reset : in std_logic;
			dataout : out std_logic_vector(N-1 downto 0)
		);
	  end component;

	  Component mux2to1_Nbit is
		generic(
			N: integer := 16	--default number of bits for each input and outputs
		);
		port( x, y : in std_logic_vector (N-1 downto 0);
		sel : in std_logic;
		xyout : out std_logic_vector(N-1 downto 0)
		);
	end component;

	component tristate_generic is
		generic(
		  N: integer := 16  --default bit width of the tristate buffer
		);
		Port
		  (enable : in std_logic;
		  datain : in std_logic_vector(N-1 downto 0);
		  dataout : out std_logic_vector(N-1 downto 0)
		  );
	end component;

	component ALUKernel
	port( X, Y: in std_logic_vector(15 downto 0);
		CI: in std_logic;
		AMF: in std_logic_vector(4 downto 0);
		--CLK: in std_logic;
		R: out std_logic_vector(15 downto 0); 
		AZ, AN, AC, AV, AS: out std_logic);
	End component;

	component Display
	port( Input: in std_logic_vector(3 downto 0);
		segmentSeven: out std_logic_vector(6 downto 0));
	End component;

	signal S1  : std_logic_vector(15 downto 0);
	signal S2  : std_logic_vector(15 downto 0);
	signal S3  : std_logic_vector(15 downto 0);
	signal S4  : std_logic_vector(15 downto 0);
	signal S5  : std_logic_vector(15 downto 0);
	signal S6  : std_logic_vector(15 downto 0);
	signal S7  : std_logic_vector(15 downto 0);
	signal S8  : std_logic_vector(15 downto 0);
	signal S9  : std_logic_vector(15 downto 0);
	signal S10 : std_logic_vector(15 downto 0);
	signal S11 : std_logic_vector(15 downto 0);
	signal S12 : std_logic_vector(15 downto 0);
	signal S13 : std_logic_vector(15 downto 0);
	signal S14 : std_logic_vector(15 downto 0);

	begin
		--LHS
		AX0 : Register_generic
		generic map(N => 16)
		port map (DMD, L(0), CLK, Reset, S1);
		
		AX1 : Register_generic
		generic map(N => 16)
		port map (DMD, L(1), CLK, Reset, S2);
		
		MUX1: mux2to1_Nbit
		generic map(N => 16)
		port map (S1, S2, Sel(1), S3);
		
		MUX2: mux2to1_Nbit
		generic map(N => 16)
		port map (R, S3, Sel(2), S4);
		TSB0: tristate_generic
		generic map(N => 16)
		port map (En(0), S3, DMD);

		--RHS
		
		MUX0: mux2to1_Nbit
		generic map(N => 16)
		port map (DMD, PMD(23 downto 8), Sel(0), S5);
		AY0 : Register_generic
		generic map(N => 16)
		port map (S5, L(2), CLK, Reset, S6);

		AY1 : Register_generic
		generic map(N => 16)
		port map (S5, L(3), CLK, Reset, S7);
		
		MUX3: mux2to1_Nbit
		generic map(N => 16)
		port map (S6, S7, Sel(3), S8);
		
		MUX4: mux2to1_Nbit
		generic map(N => 16)
		port map (S8, S9, Sel(4), S10);

		TSB1: tristate_generic
		generic map(N => 16)
		port map (En(1), S8, DMD);

		--ALU and below
		ALU: ALUKernel port map (S4, S10, CI, AMF, S12, AZ, AN, AC, AV, AS);
		S11 <= S12;

		AF : Register_generic
		generic map(N => 16)
		port map (S11, L(4), CLK, Reset, S9);
		
		MUX5: mux2to1_Nbit
		generic map(N => 16)
		port map (S12, DMD, Sel(5), S13);

		AR : Register_generic
		generic map(N => 16)
		port map (S13, L(5), CLK, Reset, S14);

		TSB2: tristate_generic
		generic map(N => 16)
		port map (En(2), S14, DMD);

		TSB3: tristate_generic
		generic map(N => 16)
		port map (En(3), S14, R);

		alu_out <= s12;
		
		--Stuff for testing purposes with DE1 SoC board, you can comment this out otherwise
		--ledpass1 : Display port map(S14(3 downto 0), seg0);
		--ledpass2 : Display port map(S14(7 downto 4), seg1);
		--ledpass3 : Display port map(S14(11 downto 8), seg2);
		--ledpass4 : Display port map(S14(15 downto 12), seg3);

end architecture;


--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
--
--Entity alutoplevel is
--    Port( CLK: in std_logic;
--          L: in std_logic_vector(5 downto 0);	--each bit controls a load for a register
--          Sel: in std_logic_vector(5 downto 0);		--each bit controls a select for a mux
--          DMD, R: inout std_logic_vector(15 downto 0);
--          PMD: in std_logic_vector(23 downto 0);
--          AMF: in std_logic_vector(4 downto 0);
--          CI: in std_logic;
--          En: in std_logic_vector(3 downto 0);		--each bit controls an enable for a tristate buffer
--          AZ, AN, AC, AV, AS: out std_logic;
--         -- alu_out: inout std_logic_vector(15 downto 0);
--	  Reset: in std_logic;	--global reset for all registers
--		  --for testing purposes with DE1 SoC board, you can comment this out otherwise
--		  seg0 : out std_logic_vector(6 downto 0);
--		  seg1 : out std_logic_vector(6 downto 0);
--		  seg2 : out std_logic_vector(6 downto 0);
--		  seg3 : out std_logic_vector(6 downto 0)
--    );
--end alutoplevel;

--Architecture Arch_topLevelALU of alutoplevel is
--
--	component ALURegister
--		port( DMD: in std_logic_vector(15 downto 0);
--		load: in std_logic;
--		clk: in std_logic;
--		reset: in std_logic;
--		R: out std_logic_vector(15 downto 0));
--	End component;
--
--	component Multiplexer
--		port( x, y: in std_logic_vector(15 downto 0);
--		Sel: in std_logic;
--		xyout: out std_logic_vector(15 downto 0));
--	End component;
--
--	component TriStateBuffer
--		port(datain: in std_logic_vector(15 downto 0);
--		enable: in std_logic;
--		dataout: out std_logic_vector(15 downto 0));
--	End component;
--
--	component ALUKernel
--	port( X, Y: in std_logic_vector(15 downto 0);
--		CI: in std_logic;
--		AMF: in std_logic_vector(4 downto 0);
--		--CLK: in std_logic;
--		R: out std_logic_vector(15 downto 0); 
--		AZ, AN, AC, AV, AS: out std_logic);
--	End component;
--
--	component Display
--	port( Input: in std_logic_vector(3 downto 0);
--		segmentSeven: out std_logic_vector(6 downto 0));
--	End component;
--
--	signal S1  : std_logic_vector(15 downto 0);
--	signal S2  : std_logic_vector(15 downto 0);
--	signal S3  : std_logic_vector(15 downto 0);
--	signal S4  : std_logic_vector(15 downto 0);
--	signal S5  : std_logic_vector(15 downto 0);
--	signal S6  : std_logic_vector(15 downto 0);
--	signal S7  : std_logic_vector(15 downto 0);
--	signal S8  : std_logic_vector(15 downto 0);
--	signal S9  : std_logic_vector(15 downto 0);
--	signal S10 : std_logic_vector(15 downto 0);
--	signal S11 : std_logic_vector(15 downto 0);
--	signal S12 : std_logic_vector(15 downto 0);
--	signal S13 : std_logic_vector(15 downto 0);
--	signal S14 : std_logic_vector(15 downto 0);
--
--	begin
--		--LHS
--		AX0 : ALURegister port map ("0000000000001011", '1', CLK, Reset, S1);
--		AX1 : ALURegister port map ("0000000000000101", '1', CLK, Reset, S2);
--		MUX1: Multiplexer port map (S1, S2, Sel(1), S3);
--		MUX2: Multiplexer port map (R, S3, Sel(2), S4);
--		TSB0: TriStateBuffer port map (S3, '0', DMD);
--
--		--RHS
--		MUX0: Multiplexer port map (DMD, PMD(23 downto 8), Sel(0), S5);
--		AY0 : ALURegister port map ("0000000000000111", '1', CLK, Reset, S6);
--		AY1 : ALURegister port map ("0000000000001101", '1', CLK, Reset, S7);
--		MUX3: Multiplexer port map (S6, S7, Sel(3), S8);
--		MUX4: Multiplexer port map (S8, S9, Sel(4), S10);
--		TSB1: TriStateBuffer port map (S8, '0', DMD);
--
--		--ALU and below
--		ALU: ALUKernel port map (S4, S10, '0', "10011", S12, AZ, AN, AC, AV, AS);
--		S11 <= S12;
--		AF : ALURegister port map (S11, L(4), CLK, Reset, S9);
--		MUX5: Multiplexer port map (S12, DMD, Sel(5), S13);
--		AR : ALURegister port map (S13, L(5), CLK, Reset, S14);
--		TSB2: TriStateBuffer port map (S14, '0', DMD);
--		TSB3: TriStateBuffer port map (S14, En(3), R);
--		
--		--Stuff for testing purposes with DE1 SoC board, you can comment this out otherwise
--		ledpass1 : Display port map(S13(3 downto 0), seg0);
--		ledpass2 : Display port map(S13(7 downto 4), seg1);
--		ledpass3 : Display port map(S13(11 downto 8), seg2);
--		ledpass4 : Display port map(S13(15 downto 12), seg3);
--
--end architecture;



--the above is for testing with hardcoded values. The below is for actual usage in a larger system
