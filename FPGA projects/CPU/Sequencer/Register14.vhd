library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


--all inputs are active high

Entity Register14 is
  Port(
      clk, load : in std_logic;
	input : in std_logic_vector(13 downto 0);
      output : out std_logic_vector(13 downto 0)
  );
end Register14;

architecture reg14 of Register14 is
  signal storage : std_logic_vector(13 downto 0);
begin
  process(clk)
  begin
    --if the clock just went high and load is high, then save datain to storage
    if (clk'event and clk = '1' and load = '1') then
      storage <= input;
    end if;
  end process;

output <= storage;
end;
