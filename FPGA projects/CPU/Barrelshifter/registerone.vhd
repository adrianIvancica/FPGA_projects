library ieee;
use ieee.std_logic_1164.all;

Entity Register_generic is
  generic(
    N: integer := 16  --default number of bits the register stores
  );

  Port(datain : in std_logic_vector(N-1 downto 0);
      load, clk, reset : in std_logic;
      dataout : out std_logic_vector(N-1 downto 0)
  );
end Register_generic;

architecture Arch_Register of Register_generic is
  signal storage : std_logic_vector(N-1 downto 0);
begin
  process(clk, reset)
  begin
    --if the clock just went high and load is high, then save datain to storage

    if (reset = '1') then
      storage <= (others => '0');
    elsif (clk'event and clk = '1' and load = '1') then
      storage <= datain;
    end if;
  end process;

dataout <= storage;
end Arch_Register;