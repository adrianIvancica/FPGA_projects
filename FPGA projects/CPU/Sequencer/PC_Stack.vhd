library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity stack_loop is
    port (
        clk: in std_logic;
        data_in: in std_logic_vector (14 downto 0); -- data pushed in
        data_out: out std_logic_vector (14 downto 0); -- data pushed out
        push, pop, reset : in std_logic;
        overflow: out std_logic;  -- 1 when stack full
        underflow: out std_logic -- 1 when stack is empty
    );
end stack_loop;

architecture Behavioral of stack_loop is
    type stack_type is array (0 to 15) of std_logic_vector(14 downto 0);
    signal stack: stack_type;
    signal top: integer range 0 to 15 := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                top <= 0;
            elsif push = '1' then
                if top = 15 then
                    overflow <= '1';
                else
                    stack(top) <= data_in;
                    top <= top + 1;
                    overflow <= '0';
                end if;
            elsif pop = '1' then
                if top = 0 then
                    underflow <= '1';
                else
                    top <= top - 1;
                    data_out <= stack(top);
                    underflow <= '0';
                end if;
            end if;
        end if;
    end process;
end Behavioral;

