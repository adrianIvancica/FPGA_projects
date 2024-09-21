library ieee;
use ieee.std_logic_1164.all;

Entity tristate_buffer is
  Port
    (datain : in std_logic_vector(13 downto 0);
    enable : in std_logic;
    dataout : out std_logic_vector(13 downto 0)
    );
end tristate_buffer;

architecture Arch_tristate14 of tristate_buffer is
begin
  process(enable, datain)
  begin
    if (enable = '1') then
      dataout <= datain;
    else
      dataout <= (others => 'Z');
    end if;
  end process;
end;


