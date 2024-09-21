library iee;
use iee.std_logic_1164.all;
use iee.numeric_std.all;

entity addsub is
	port( AMF : in std_logic_vector(4 downto 0);
	P: in std_logic_vector(31 downto 0);
	MR: in std_logic_vector(39 downto 0); -- push back into (adds r2, r1, r0)
	MV: out std_logic;   -- negative/positive
	R2: out std_logic_vector(7 downto 0);
	R1, R0: out std_logic_vector(15 downto 0)
	);
end addsub;
	-- how to read p output 
	-- p is 32 bit input from the multiplier
	-- split p output into two 16 bits
	-- 31 downto 16 is MR1, 15 downto 0 is MR0
	-- since no MR the 31st bit will be repeatedly placed inside MR2, so detect if 1 or 0
	-- from those inputs get MR, MR will be 40 bits
	-- the first 8 bits will be MR 2, then the rest follows the p output distribution
	-- mr2 will be 39 downto 32, 31 downto 16, 15 downto 0

	-- 00000  clear result (MR) to zero
	-- 00001  Multiply x and y
	-- 00010  MR + X * Y
	-- 01100  MR - X * Y

	-- simulation operations that need to work
	-- 

architecture Addsubtract of addsub is
	signal storage : std_logic_vector(40 downto 0);


	begin
	process (AMF, P, MR )
	begin