library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity mux2_1_8bit is
	port( x, y : in std_logic_vector (7 downto 0);
	sel : in std_logic;
	xyout : out std_logic_vector(7 downto 0)
	);
end mux2_1_8bit;

Architecture Arch_mux2to1 of mux2_1_8bit is 
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


