library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity next_address_mux is
	port( inp1, inp2, inp3, inp4 : in std_logic_vector (13 downto 0);
	sel : in std_logic_vector (1 downto 0);
	outp : out std_logic_vector(13 downto 0)
	);
end next_address_mux;

Architecture nextaddress of next_address_mux is 
  --Signal storage : std_logic_vector(13 downto 0);
    begin
    process(inp1,inp2,inp3,inp4,sel)
	begin
	if (sel = "00") then
		outp <= inp1;
	elsif (sel = "01") then
		outp <= inp2;
	elsif (sel ="10") then
		outp <= inp3;
	else
		outp <= inp4;
	end if;
     end process;
end;




