library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

Entity BIST_Top is
port (  clk, stop, c_stop, reset : in std_logic := '0'; -- two stops allow PRPG and MISR to sync
	flag : out std_logic; -- flag indicates if signature matches
	opcode : in std_logic_vector (4 downto 0)
);
end BIST_Top;


Architecture behav of BIST_Top is

-- component declarations

Component PRPG is
port (  clk, reset, stop : in std_logic;
	data : inout std_logic_vector(32 downto 1) := "10000000000000000000000000000011"-- 32 bit for two 16 bit operands; 32 to 1 ensures bit positions correspond w flip flop
);
End Component;

Component ALUKernel is
 port(  X, Y: in std_logic_vector(15 downto 0);
	CI: in std_logic;
	AMF: in std_logic_vector(4 downto 0); -- indicates the operation that will be done
	R: out std_logic_vector(15 downto 0); 
	AZ, AN, AC, AV, AS: out std_logic ); -- FLAGS
End Component;

Component MISR is
port (  clk, reset, stop : in std_logic;
	data_in  : in std_logic_vector(16 downto 1) := "1000000000000011"; -- 16 bit data
	data_out : out std_logic_vector(16 downto 1) := "1000000000000011"
);
End Component;


signal gen : std_logic_vector(32 downto 1) := "10000000000000000000000000000011"; 
signal inx, iny, alu_out, compare_in, compare_out : std_logic_vector(16 downto 1) := "0000000000000000";
signal fl_1, fl_2, fl_3, fl_4, fl_5 : std_logic := '0'; -- signals for alu flags
signal operational : std_logic_vector (4 downto 0) := "10011";
signal compareval : std_logic_vector (15 downto 0);

Begin

Generator : PRPG port map ( clk, reset, stop, gen );

-- data_32 split into two 16 bit operands
inx <= gen(16 downto 1);
iny <= gen(32 downto 17);
-- opcode for addition "10011" opcode for subtraction 10111
CUT : ALUKernel port map ( "0000000000000101", inx, '0', opcode, alu_out, fl_1, fl_2, fl_3, fl_4, fl_5 ); -- testing w/ 5 + x1
-- opcode hard coded to produce addition

compare_in <= alu_out; -- this is to ensure compressor and CUT dont compete for alu_out (irrelevant since omitting bus element)
Compressor : MISR port map ( clk, reset, c_stop, compare_in, compare_out );

process (compare_out)
begin
if (compare_out = "0000000001100111") then
	flag <= '1';
else
	flag <= '0';
end if;
end process;
End behav;
