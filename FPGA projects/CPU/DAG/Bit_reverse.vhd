library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;

Entity bit_rvs is

	port ( input: in std_logic_vector( 13 downto 0);
		en: in std_logic;
		output: out std_logic_vector (13 downto 0)
	);
end bit_rvs;
	
Architecture reverse of bit_rvs is
	
begin 
	process(input, en)
	begin
	if (en = '1') then
		for i in 0 to 13 loop
		output(13-i) <= input(i);
	end loop;
	else
	output <= input;
end if;
end process;

end;