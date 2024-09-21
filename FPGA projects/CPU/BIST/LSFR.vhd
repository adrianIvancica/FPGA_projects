library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LFSR is
    Port (
        clk, reset, stop   : in  STD_LOGIC;
        data  : inout  STD_LOGIC_VECTOR (15 downto 0)
    );
end LFSR;

architecture Behavioral of LFSR is
signal lfsr_reg   : std_logic_vector(15 downto 0); -- LFSR register
    signal stop_flag  : std_logic := '0';             -- Stop flag
    
    -- LFSR taps (chosen for maximal sequence length)
    constant taps : std_logic_vector(15 downto 0) := "0010000000000000";
begin
-- LFSR process
 process(clk, reset, stop)
    begin
        if reset = '1' then
            lfsr_reg <= (others => '1'); -- Reset LFSR register
            stop_flag <= '0';            -- Clear stop flag
        elsif (clk'event and clk = '1') then
            if stop = '1' then
                stop_flag <= '1';        -- Set stop flag when stop signal is high
            elsif stop_flag = '0' then
                -- Shift the LFSR
                lfsr_reg <= lfsr_reg(14 downto 0) & 
                            (lfsr_reg(15) xor lfsr_reg(5) xor lfsr_reg(3) xor lfsr_reg(2));
		lfsr_reg <= lfsr_reg;
            end if;
        end if;
    end process;

    -- Connect LFSR output to data inout
    --data <= lfsr_reg when stop_flag = '0' else (others => 'Z');
	data <= lfsr_reg;

end Behavioral;

