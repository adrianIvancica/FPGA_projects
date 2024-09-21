library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity mux2_1 is
	port( in1 , in2: in std_logic_vector (13 downto 0);
	sel : in std_logic;
	output : out std_logic_vector(13 downto 0)
	);
end mux2_1;

Architecture Mux14 of mux2_1 is 
  --Signal storage : std_logic_vector(13 downto 0);
    begin
    process(in1,in2,sel)
	begin
	if sel = '0' then
		output <= in1;
	else
		output <= in2;
	end if;
     end process;
end;




