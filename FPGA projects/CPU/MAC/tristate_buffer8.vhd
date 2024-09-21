library ieee;
use ieee.std_logic_1164.all;

Entity TriStateBuffer8 is
  Port
    (datain : in std_logic_vector(15 downto 0);
    enable : in std_logic;
    dataout : out std_logic_vector(15 downto 0)
    );
end TriStateBuffer8;

architecture Arch_tristate16 of TriStateBuffer8 is
begin
  process(enable, datain)
  begin
    if (enable = '1') then
      dataout <= datain;
    else
      dataout <= (others => 'Z');
    end if;
  end process;
end Arch_tristate16;
