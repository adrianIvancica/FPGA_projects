library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entity takes two 32 bit inputs

--when sROR is 0, input1 gets passed to output
--when sROR is 1, input1 and input2 are bitwise OR'd, result is sent to output

--the output is 32 bits, where the top 16 go to ouput1, and bottom 16 go to output2
-- 000000000000 000000000000
--       V           V
--   output1       output2

Entity orPass is
	port( input1 : in std_logic_vector(31 downto 0);
	      input2 : in std_logic_vector(31 downto 0);
	      sROR : in std_logic;
	      output1 : out std_logic_vector(15 downto 0);
	      output2 : out std_logic_vector(15 downto 0)
	);
end orPass;

architecture Arch_orPass of orPass is
begin
	process(input1, input2, sROR)
	begin
		if (SROR = '1') then
			output1 <= input1(31 downto 16) or input2(31 downto 16);
			output2 <= input1(15 downto 0) or input2(15 downto 0);
		else
			output1 <= input1(31 downto 16);
			output2 <= input1(15 downto 0);
		end if;
	end process;
end Arch_orPass;