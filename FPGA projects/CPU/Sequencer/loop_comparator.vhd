library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity loop_compare is
    port (  next_inst, last_inst: in std_logic_vector (13 downto 0);
	    clk: in std_logic;
	    isLast: out std_logic
	  );
end loop_compare;

architecture comparator of loop_compare is 
begin
	process (clk, next_inst, last_inst)		
	begin
	if (Clk'event and Clk = '1') then
		if ( next_inst = last_inst) then
			isLast <= '1';
		else
			isLast <= '0';
		end if;
	end if;
end process;
end;