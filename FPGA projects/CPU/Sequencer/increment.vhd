library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity incrementer is
    port ( clk : in std_logic; -- clk
	   reset: in std_logic;
	   incput : in std_logic_vector (13 downto 0);
	   incr_out: out std_logic_vector (13 downto 0)
	);
end incrementer;

architecture increment of incrementer is
signal storage: std_logic_vector (13 downto 0);
begin
	
	process(incput)
	begin

	storage <= std_logic_vector(unsigned(incput)+1);

	end process;
incr_out <= storage;
end;
