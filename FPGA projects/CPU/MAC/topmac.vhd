library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity topmac is
    port(
        clk, reset: in std_logic;
        L: in std_logic_vector(7 downto 0);      -- not needed
	en: in std_logic_vector(6 downto 0);	--enable signals for tristate buffers, 0 is high impedence, 1 passes value through
        Sel: in std_logic_vector(8 downto 0);    -- need selects for mux1, mux3
        DMD: inout std_logic_vector(15 downto 0);  -- dont need for demo
        PMD: in std_logic_vector(23 downto 0);   -- not needed for demo
        AMF: in std_logic_vector(4 downto 0);   -- need for demo
        R: inout std_logic_vector(15 downto 0);  -- dont need for demo
        MV : out std_logic;    -- dont need for demo
        mac_out : out std_logic_vector(15 downto 0)		--exposing the bottom 16 bits of the mac for testing purposes
		  --seg0 : out std_logic_vector(6 downto 0);
		  --seg1 : out std_logic_vector(6 downto 0);
		  --seg2 : out std_logic_vector(6 downto 0);
		  --seg3 : out std_logic_vector(6 downto 0)   -- display least signficant 16 bits for the demo
    );
end topmac;

architecture struct of topmac is

	Component Register_generic is
		generic(
			N: integer := 16
		);
		Port(datain : in std_logic_vector(N-1 downto 0);
			load, clk, reset : in std_logic;
			dataout : out std_logic_vector(N-1 downto 0)
		);
	end component;

    component multiplier is
        port(x, y: in std_logic_vector(15 downto 0);
             p: out std_logic_vector(31 downto 0));
    end component;

	component addsub is
		port(AMF : in std_logic_vector(4 downto 0);
			P: in std_logic_vector(31 downto 0);
			MR: in std_logic_vector(39 downto 0);
			MV: out std_logic;
			R2: out std_logic_vector(7 downto 0);
			R1, R0: out std_logic_vector(15 downto 0)
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

	Component mux2to1_Nbit is
		generic(
			N: integer := 16	--default number of bits for each input and outputs
		);
		port( x, y : in std_logic_vector (N-1 downto 0);
		sel : in std_logic;
		xyout : out std_logic_vector(N-1 downto 0)
		);
	end component;

     COMPONENT tristate_buffer IS 
         PORT (datain : IN STD_LOGIC_VECTOR (15 downto 0 );
               enable : IN STD_LOGIC ;
               dataout : OUT STD_LOGIC_VECTOR (15 downto 0 ));
     END COMPONENT ;

     COMPONENT tristate_buffer8 IS 
         PORT (datain : IN STD_LOGIC_VECTOR (7 downto 0 );
               enable : IN STD_LOGIC ;
               dataout : OUT STD_LOGIC_VECTOR (15 downto 0 ));
     END COMPONENT ;
	
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
	signal S11 : std_logic_vector(31 downto 0); --32 bit output from multiplier
	signal S12 : std_logic_vector(7 downto 0);  -- most significant 8 bits
	signal S13 : std_logic_vector(15 downto 0); -- middle 16 bits
	signal S14 : std_logic_vector(15 downto 0); -- last 16 bits   these go into mu
	signal S17 : std_logic_vector(39 downto 0);  -- top 8 mr2, middle 16 mr1, last 16 mr0 also use from
	signal S18 : std_logic_vector(7 downto 0);   -- going from mux5
	signal S19 : std_logic_vector(15 downto 0);  -- output  from mux6
	signal S20 : std_logic_vector(15 downto 0);  -- output from mux7
	signal S21 : std_logic_vector(7 downto 0);  --MR2
	signal S22 : std_logic_vector(15 downto 0); --MR1
	signal S23 : std_logic_vector(15 downto 0); --MR0
	signal S25 : std_logic_vector(15 downto 0); --s21 concatenated with 0's at the front
	signal S26 : std_logic_vector(15 downto 0); -- last two buffers
	
begin

-- You need to fill in this part -----
		-- all tristate enables will be set to 0 for the purpose of the demo
		--LHS
		MX0 : Register_generic
		generic map(N => 16)
		port map (DMD, L(0), clk, reset, S1); --16 bit

		MX1 : Register_generic
		generic map(N => 16)
		port map (DMD, L(1), clk, reset, S2);  
		--MX0 : reg16 port map (clk, '1', "0000000000000011", S1); -- input 3
		--MX1 : reg16 port map (clk, '1', "0000000000000100", S2); -- input 4
		MUX1: mux2to1_Nbit
		generic map(N => 16)
		port map (S1, S2, Sel(1), S3);

		MUX2: mux2to1_Nbit
		generic map(N => 16)
		port map (R, S3, Sel(2), S4);
		--MUX2: Multiplexer port map (R, S3, '1', S4); -- hard code sel = 1 for this
		TSB0: tristate_generic
		generic map(N => 16)
		port map (en(0), S3, DMD);  

		--RHS
		MUX0: mux2to1_Nbit
		generic map(N => 16)
		port map (DMD, PMD(23 downto 8), Sel(0), S5); -- not really needed
		MY0 : Register_generic
		generic map(N => 16)
		port map (s5, L(2), clk, reset, S6);
		MY1 : Register_generic
		generic map(N => 16)
		port map (s5, L(3), clk, reset, S7);
		--MY0 : reg16 port map (clk, '1', "0000000000000101", S6); -- input 5
		--MY1 : reg16 port map (clk, '1', "0000000000000110", S7);
		MUX3: mux2to1_Nbit
		generic map(N => 16)
		port map (S6, S7, Sel(3), S8);
		MUX4: mux2to1_Nbit
		generic map(N => 16)
		port map (S8, S9, Sel(4), S10);
		--MUX4: Multiplexer port map (S8, S9, '0', S10);   -- hard code sel = 1 for demo
		TSB1: tristate_generic
		generic map(N => 16)
		port map (en(1), S8, DMD);
    
		--Multi, add/sub, and MF
		Mult: multiplier port map (s4,s10,s11);
		addsubber: addsub port map (AMF, s11, s17, MV, s12, s13, s14);
		MF : Register_generic
		generic map(N => 16)
		port map (s13, L(7), clk, reset, s9);
		--MF : reg16 port map ( clk, '0', s13, s9);
		-- Lower Muxs and Register MR2, MR1, MR0
		MUX5: mux2to1_Nbit 
		generic map(N => 8)
		port map (s12, DMD(7 downto 0), Sel(5), s18);

		MUX6: mux2to1_Nbit
		generic map(N => 16)
		port map (s13, DMD, Sel(6),s19);

		MUX7: mux2to1_Nbit
		generic map(N => 16)
		port map (s14, DMD, Sel(7),s20);
		--MUX5:mux2_1_8bit port map (s12, DMD(15 downto 8), '0', s18);
		--MUX6: Multiplexer port map (s13, DMD, '0',s19);
		--MUX7: Multiplexer port map (s14, DMD, '0',s20);
		MR2: Register_generic
		generic map(N => 8)
		port map(s18, L(4), clk, reset, s21);

		MR1: Register_generic
		generic map(N => 16)
		port map (s19, L(5), clk, reset, s22);
		
		MR0: Register_generic
		generic map(N => 16)
		port map (s20, L(6), clk, reset, s23);
		--MR2: outreg8 port map( clk, '1', s18, s21);
		--MR1: outreg16 port map ( clk, '1', s19, s22);
		--MR0: outreg16 port map ( clk, '1', s20, s23);
		s17(39 downto 32) <= s21;
		s17(31 downto 16) <= s22;
		s17(15 downto 0) <= s23;

		s25(7 downto 0) <= s21;
		s25(15 downto 8) <= (others => '0');

		TSB2: tristate_generic
		generic map(N => 16)
		port map (en(2), s25, R);

		TSB3: tristate_generic
		generic map(N => 16)
		port map (en(3), s22, R);

		TSB4: tristate_generic
		generic map(N => 16)
		port map (en(4), s23, R);
		
		MUX8: mux2to1_Nbit
		generic map(N => 16)
		port map (s22, s23, Sel(8),s26);

		TSB5: tristate_generic
		generic map(N => 16)
		port map (en(5), s26, DMD);

		TSB6: tristate_generic
		generic map(N => 16)
		port map (en(6), s25, DMD);

		mac_out <= s14;

		-- display onto the baord for demo purposes
		--ledpass1 : Display port map(S14(3 downto 0), seg0);
		--ledpass2 : Display port map(S14(7 downto 4), seg1);
		--ledpass3 : Display port map(S14(11 downto 8), seg2);
		--ledpass4 : Display port map(S14(15 downto 12), seg3);

end struct;

