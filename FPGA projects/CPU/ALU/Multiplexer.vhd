library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity Multiplexer is
	port( x, y : in std_logic_vector (15 downto 0);
	sel : in std_logic;
	xyout : out std_logic_vector(15 downto 0)
	);
end Multiplexer;

Architecture Arch_mux2to1 of Multiplexer is 
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

