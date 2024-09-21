library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity loop_counter is
    port ( cntr_in: IN std_logic_vector (13 downto 0);
	   clk, load: in std_logic;
	   CE: out std_logic;
	   cntr_out: out std_logic
	);
end loop_counter;

architecture count of loop_counter is
		
begin
	process(clk, load, cntr_in)
	
