library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

Entity modulus is

	port ( input, L_reg: in std_logic_vector( 13 downto 0); -- current address, length
		output: out std_logic_vector (13 downto 0)-- next address
	);
end modulus;

Architecture math of modulus is
begin 
	process (input, L_reg)
	variable i : integer ;
	variable L : integer ;
	variable o : integer ;

	begin
	i := to_integer (unsigned(input));
	L := to_integer (unsigned(L_reg));
	
	if (L = 0) then
		output <= input; -- linear addressing
	else
		o:= i mod L;
		output <= std_logic_vector(to_unsigned(o,14));
	end if;
	
end process;
end;
	