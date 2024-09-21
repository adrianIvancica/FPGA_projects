--VHDL Stack
--outputs all 0's when the stack is empty
--the item at the top of the stack is sent to the output
--pushes or pops or resets on the falling edge of the clock depending on which signal is being sent in

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity stack is
    generic (
        N : integer := 14;	--number of bits per item in the stack
        M : integer := 4	--number of items the stack can hold
    );
    port (
        push, pop, reset : in std_logic;
        data_in : in std_logic_vector(N-1 downto 0);
        clk : in std_logic;
        data_out : out std_logic_vector(N-1 downto 0);
        --index : out std_logic_vector(15 downto 0);
        overflow, underflow : out std_logic
    );
end stack;

architecture behav of stack is
    type arr is array (0 to M) of std_logic_vector(N-1 downto 0); -- Array of M rows and N columns
begin
    process(clk)
        -- variables can hold values
        variable data_stack : arr;
        variable pointer : integer range 0 to M := 0;
    begin
        -- synchronize the stack with a clock rising (or falling) edge
        if (clk = '0') then
            data_stack(0) := (others => '0');
            -- reset the stack
            if (reset = '1') then
                pointer := 0;
            -- handle the push operation
            elsif (push = '1') then
                if (pointer < M) then
                    pointer := pointer + 1;
                    data_stack(pointer) := data_in;
                    overflow <= '0';
                else
                    overflow <= '1';
                end if;
            -- handle the pop operation
            elsif (pop = '1') then
                if (pointer > 0) then
                    pointer := pointer - 1;
                    underflow <= '0';
                else
                    underflow <= '1';
                end if;
            end if;
            -- output data
            data_out <= data_stack(pointer);
        end if; -- end of sync
    end process;
end behav;

