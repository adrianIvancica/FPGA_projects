library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

Entity PRPG is
port (  clk, reset, stop : in std_logic;
	data : inout std_logic_vector(32 downto 1) := "10000000000000000000000000000011"-- 32 bit for two 16 bit operands; 32 to 1 ensures bit positions correspond w flip flop
);
End PRPG;


Architecture behav of PRPG is

-- component declaration
Component Flip_Flop is 
  port ( input, load, clk : in std_logic;
	 output : out std_logic );
End Component;



-- signal declaration
signal feedback : std_logic := '1'; -- feedback signal
signal enable : std_logic := '0'; -- enable signal used to keep port map input globally static
signal f_in, f_out : std_logic_vector(32 downto 1) := "10000000000000000000000000000011";--"00000000000000000000000000000000";

Begin

P1 : Process(clk, stop, reset) -- handle FF inputs, stop and reset functionality
Begin

	if(clk'event and clk = '1') then
		if(reset = '1') then
			f_in <= "10000000000000000000000000000011"; -- reset to initial value
		elsif(stop = '0') then
			f_in(1) <= feedback XOR data(1); -- first in given feedback xor first data bit
			f_in(32 downto 2) <= f_out(31 downto 1) XOR data(32 downto 2); -- other ins given previous ff xor corresponding data
		else -- stopped
			f_in <= f_in;
		end if;
	end if;
End Process P1;


	enable <= (NOT stop); -- note if stop = 1, enable bit = 0
				-- outside the process since enable would not update

-- flip flops
FF1 : Flip_Flop port map ( f_in(1), enable, clk, f_out(1) );
FF2 : Flip_Flop port map ( f_in(2), enable, clk, f_out(2) );
FF3 : Flip_Flop port map ( f_in(3), enable, clk, f_out(3) );
FF4 : Flip_Flop port map ( f_in(4), enable, clk, f_out(4) );
FF5 : Flip_Flop port map ( f_in(5), enable, clk, f_out(5) );
FF6 : Flip_Flop port map ( f_in(6), enable, clk, f_out(6) );
FF7 : Flip_Flop port map ( f_in(7), enable, clk, f_out(7) );
FF8 : Flip_Flop port map ( f_in(8), enable, clk, f_out(8) );
FF9 : Flip_Flop port map ( f_in(9), enable, clk, f_out(9) );
FF10 : Flip_Flop port map ( f_in(10), enable, clk, f_out(10) );
FF11 : Flip_Flop port map ( f_in(11), enable, clk, f_out(11) );
FF12 : Flip_Flop port map ( f_in(12), enable, clk, f_out(12) );
FF13 : Flip_Flop port map ( f_in(13), enable, clk, f_out(13) );
FF14 : Flip_Flop port map ( f_in(14), enable, clk, f_out(14) );
FF15 : Flip_Flop port map ( f_in(15), enable, clk, f_out(15) );
FF16 : Flip_Flop port map ( f_in(16), enable, clk, f_out(16) );
FF17 : Flip_Flop port map ( f_in(17), enable, clk, f_out(17) );
FF18 : Flip_Flop port map ( f_in(18), enable, clk, f_out(18) );
FF19 : Flip_Flop port map ( f_in(19), enable, clk, f_out(19) );
FF20 : Flip_Flop port map ( f_in(20), enable, clk, f_out(20) );
FF21 : Flip_Flop port map ( f_in(21), enable, clk, f_out(21) );
FF22 : Flip_Flop port map ( f_in(22), enable, clk, f_out(22) );
FF23 : Flip_Flop port map ( f_in(23), enable, clk, f_out(23) );
FF24 : Flip_Flop port map ( f_in(24), enable, clk, f_out(24) );
FF25 : Flip_Flop port map ( f_in(25), enable, clk, f_out(25) );
FF26 : Flip_Flop port map ( f_in(26), enable, clk, f_out(26) );
FF27 : Flip_Flop port map ( f_in(27), enable, clk, f_out(27) );
FF28 : Flip_Flop port map ( f_in(28), enable, clk, f_out(28) );
FF29 : Flip_Flop port map ( f_in(29), enable, clk, f_out(29) );
FF30 : Flip_Flop port map ( f_in(30), enable, clk, f_out(30) );
FF31 : Flip_Flop port map ( f_in(31), enable, clk, f_out(31) );
FF32 : Flip_Flop port map ( f_in(32), enable, clk, f_out(32) );


feedback <= f_out(1) xor f_out(3) xor f_out(5) xor f_out(7);
data <= f_out;

End behav;
