library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity mux2to1_Nbit is
	generic(
		N: integer := 16	--default number of bits for each input and outputs
	);
	port( x, y : in std_logic_vector (N-1 downto 0);
	sel : in std_logic;
	xyout : out std_logic_vector(N-1 downto 0)
	);
end mux2to1_Nbit;

Architecture Arch_mux of mux2to1_Nbit is 
  --Signal storage : std_logic_vector(15 downto 0);
    begin
    process(x,y,sel)
	begin
	if sel = '0' then
		xyout <= x;
	else
		xyout <= y;
	end if;
     end process;
end;
