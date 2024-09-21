library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;



Entity MISR is
port (  clk, reset, stop : in std_logic;
	data_in  : in std_logic_vector(16 downto 1) := "1000000000000011"; -- 16 bit data
	data_out : out std_logic_vector(16 downto 1) := "1000000000000011"
);
End MISR;


Architecture behav of MISR is

-- component declaration
Component Flip_Flop is 
  port ( input, load, clk : in std_logic;
	 output : out std_logic );
End Component;



-- signal declaration
signal feedback : std_logic := '1'; -- set to 1 to affect xor logic
signal enable : std_logic := '0'; -- enable signal used to keep port map input globally static
signal f_in, f_out : std_logic_vector(16 downto 1) := "1000000000000011";

Begin

-- logic for FF inputs

P1 : Process(clk, stop, reset)--clk)
Begin

if(clk'event AND clk = '1') then
	if(reset = '1') then
		f_in <= "1000000000000011"; -- reset to intial value
	elsif(stop = '0') then
		f_in(1) <= feedback XOR data_in(1); -- first in given feedback xor first data bit
		f_in(16 downto 2) <= f_out(15 downto 1) XOR data_in(16 downto 2); -- other ins given previous ff xor corresponding data
	else -- stopped
		f_in <= f_in;
	end if;
end if;
End Process P1;

enable <= NOT stop; -- note if stop = 1, enable bit = 0


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


feedback <= f_out(1) XOR f_out(3) XOR f_out(5) XOR f_out(7);
data_out <= f_out;

End behav;


