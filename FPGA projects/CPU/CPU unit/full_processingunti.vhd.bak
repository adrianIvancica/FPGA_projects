library ieee;
use ieee.std_logic_1164.all;

entity processing_unit is

	port (
		clk : in std_logic;
		reset : in std_logic;	--global reset
		PMA : inout std_logic_vector(13 downto 0); -- the PMA bus
		DMA : inout std_logic_vector(13 downto 0); -- the DMA bus
		PMD : in std_logic_vector(23 downto 0); -- the PMD bus
		DMD : inout std_logic_vector(15 downto 0); -- the DMD bus
		R : inout std_logic_vector(15 downto 0);	--R bus

		s_program_seq : in std_logic_vector(1 downto 0); -- selection signal for program_control muxes
		s_alu : in std_logic_vector(7 downto 0); -- selection signal for alu muxes
		s_mac : in std_logic_vector(8 downto 0); -- selection signal for mac muxes
		s_shifter : in std_logic_vector(3 downto 0); -- selection signal for shifter muxes

		load_program_seq : in std_logic_vector(2 downto 0); -- load signal for program control registers
		load_alu : in std_logic_vector(5 downto 0); -- load signal for alu registers
		load_mac : in std_logic_vector(7 downto 0); -- load signal for mac registers
		load_shifter : in std_logic_vector(2 downto 0); -- load signal for shifter registers

		bc_program_seq : in std_logic_vector(2 downto 0); -- program_control tristate buffers control signal
		bc_alu : in std_logic_vector(3 downto 0); -- alu tristate buffers control signal
		bc_mac : in std_logic_vector(6 downto 0); -- mac tristate buffers control signal
		bc_shifter : in std_logic_vector(3 downto 0); -- shifter tristate buffers control signal
		control : in std_logic_vector(4 downto 0); -- control code signal for alu and mac
		carry : in std_logic; -- carry signal for alu

		pass : in std_logic; -- control bit for OR/PASS for shifter
		x_in : in std_logic; -- extension bit to be filled in the left part of shifter array
		HI_LO : in std_logic; -- control bit to indicate high/low position in shifter array
		offset : in std_logic_vector(7 downto 0); -- bits to indicate the offset for the shifter
		alu_out : inout std_logic_vector(15 downto 0);
		mac_out : inout std_logic_vector(15 downto 0);
		SR_out : inout std_logic_vector(31 downto 0)
	);
end processing_unit;

architecture struct of processing_unit is
	component alutoplevel  is
		port (
			CLK : in std_logic;
			L: in std_logic_vector(5 downto 0);
			Sel : in std_logic_vector(5 downto 0);
			DMD : inout std_logic_vector (15 downto 0);
			R : inout std_logic_vector(15 downto 0);
			PMD : in std_logic_vector(23 downto 0);
			AMF : in std_logic_vector(4 downto 0);
			CI : in std_logic;
			En : in std_logic_vector(3 downto 0);
			AZ, AN, AC, AV, AS : out std_logic;
			alu_out : inout std_logic_vector(15 downto 0);
			Reset: in std_logic);
	end component;

	component topmac is
		port (
			clk, reset: in std_logic;
        		L: in std_logic_vector(7 downto 0);      -- not needed
			en: in std_logic_vector(6 downto 0);	--enable signals for tristate buffers, 0 is high impedence, 1 passes value through
        		Sel: in std_logic_vector(8 downto 0);    -- need selects for mux1, mux3
        		DMD: inout std_logic_vector(15 downto 0);  -- dont need for demo
        		PMD: in std_logic_vector(23 downto 0);   -- not needed for demo
        		AMF: in std_logic_vector(4 downto 0);   -- need for demo
        		R: inout std_logic_vector(15 downto 0);  -- dont need for demo
        		MV : out std_logic;    -- dont need for demo
        		mac_out : out std_logic_vector(15 downto 0)
		);
	end component;

	component topLevelBarrelShifter  is
		port (
		clk : in std_logic;						 -- clock
		reset : in std_logic;  						-- reset for all registers. Active high. Asynchronous
		DMD : inout std_logic_vector(15 downto 0); --in/output to DMD bus
		R : inout std_logic_vector(15 downto 0);--in/out to R bus
		C: in std_logic_vector(7 downto 0);--number of bits to shift by. 2's complement interpretation. Negative numbers shif tright, positive shift left.
		highlow : in std_logic;			--0 for putting data in the bottom 16 bits, 1 for putting data in the top 16 bits
		load : in std_logic_vector(2 downto 0);		--load signal to registers. 
		sel : in std_logic_vector(3 downto 0);		--select bit for muxes
		en : in std_logic_vector(3 downto 0);		--enable for tristate buffers
		SROR : in std_logic;	--0 to OR two values, 1 to PASS the original value (see the orpass to understand)
		logarith : in std_logic   
		--SR_out : inout std_logic_vector(31 downto 0); ???
		);
	end component;
	
	component programsequencer is
		port (
		clk, reset: in std_logic; 
		L : in std_logic_vector (2 downto 0);	--load signal for PC register
		ASTAT: in std_logic_vector (7 downto 0); -- connect to arithmetic status bits coming from the ALU
		Sel : in std_logic_vector (1 downto 0); -- goes to mux select
		tsb_control: in std_logic_vector(2 downto 0); -- controls the tristate buffer
		PMD: in std_logic_vector (23 downto 0); -- connect to the instruction register
		PMA: inout std_logic_vector (13 downto 0) -- connect to the PMA, final output of program sequencer goes here
			--DMD : inout std_logic_vector(15 downto 0);
			--Inst : in std_logic_vector(23 downto 0);
			--ASTAT : in std_logic_vector(7 downto 0);
			--Sel : in std_logic_vector(1 downto 0);
			--CLK : in std_logic;
			--Load : in std_logic_vector(2 downto 0);
			----En : in std_logic;
			--TSB_Ctr : in std_logic_vector(2 downto 0);
			--PMA : inout std_logic_vector(13 downto 0);
			--PMD : in std_logic_vector(23 downto 0);
			--CC : in std_logic_vector(3 downto 0);
			--AddJump : in std_logic_vector(13 downto 0);
			--AddTC : in std_logic_vector(17 downto 0);
			--IRAddress : in std_logic_vector(13 downto 0)
		);
	end component;

	signal SS, MV, AQ, AS, AC, AV, AN, AZ : std_logic;
	signal Inst : std_logic_vector(23 downto 0);
	signal astat : std_logic_vector(7 downto 0);
	signal alutemp : std_logic_vector(5 downto 0);
begin
	astat(0) <= AZ;
	astat(1) <= AN;
	astat(2) <= AV;
	astat(3) <= AC;
	astat(4) <= AS;
	astat(5) <= AQ;
	astat(6) <= MV;
	astat(7) <= SS;

	Inst <= PMD;
	alutemp <= s_alu(5 downto 0);


	--P1 : ProgramSequencer port map(
	--	  DMD  Inst  astat   sel           clk   load             en tsb  
		--DMD, Inst, astat, s_program_seq, clk, load_program_seq, rs, En, bc_program_seq, PMA, PMD, CC, AddJump, AddTC, IRAddress);
	--A1 : ALU port map(clk, load_alu, s_alu, DMD, R, PMD, control, carry, bc_alu, AZ, AN, AV, AC, AS, alu_out);
	--M1 : MAC port map(DMD, R, PMD, load_mac, s_mac, s2_mac, bc_mac, control, clk, MV, mac_out);
	--S1 : shifter port map(clk, pass, x_in, HI_LO, load_shifter, s_shifter, offset, bc_shifter, SR_out, DMD, R);
				
	P1 : programsequencer port map(clk, reset, load_program_seq, astat, s_program_seq, bc_program_seq, inst, PMA);
	A1 : alutoplevel port map(clk, load_alu, alutemp, DMD, R, PMD, control, carry, bc_alu, AZ, AN, AC, AV, AS, alu_out, reset);
	M1 : topmac port map( clk, reset, load_mac, bc_mac, s_mac, DMD, PMD, control, R, MV, mac_out);
	S1 : topLevelBarrelShifter port map(clk, reset, DMD, R, offset, HI_LO, load_shifter, s_shifter, bc_shifter, pass, x_in);

end struct;
	   
	   
