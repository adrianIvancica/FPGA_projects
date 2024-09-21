library ieee;
use ieee.std_logic_1164.all;

Entity tristate_generic is
  generic(
    N: integer := 16  --default bit width of the tristate buffer
  );
  Port
    (enable : in std_logic;
    datain : in std_logic_vector(N-1 downto 0);
    dataout : out std_logic_vector(N-1 downto 0)
    );
end tristate_generic;

architecture Arch_tristate of tristate_generic is
begin
  process(enable, datain)
  begin
    if (enable = '1') then
      dataout <= datain;
    else
      dataout <= (others => 'Z');
    end if;
  end process;
end Arch_tristate;