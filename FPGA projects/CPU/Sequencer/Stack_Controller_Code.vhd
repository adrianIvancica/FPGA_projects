library ieee;
use ieee.std_logic_1164.all;

entity Stack_Controller is

port( clk,reset: IN std_logic;
       PMD: IN std_logic_vector(23 downto 0);	--assuming this is the current instruction in the instruction register
       CE, cond: IN std_logic;         -- counter expired and loop condition tested
       add_sel: IN std_logic_vector(1 downto 0); -- next address selector
       push, pop: OUT std_logic_vector(2 downto 0); -- Push or pop signals for stacks: Count, Status, PC and Loop 
							--BIT 2 of push and pop goes to PC stack
       rs: OUT std_logic_vector(2 downto 0); -- Reset signals for stacks: Count, Status, PC and Loop
       overflow: IN std_logic_vector(2 downto 0);
       underflow: IN std_logic_vector(2 downto 0)
   );

end Stack_Controller;

architecture behav of Stack_Controller is
    begin
        process (clk, reset, PMD, CE, cond, add_sel, overflow, underflow)
            begin
		--start by resetting all outputs to 0. fresh start
                push <= "000";
                pop <= "000";
                rs <= "000";
		--if the controller receives a reset signal, send a reset signal to every stack
                if (reset = '1') then
                    rs <= "111";
		--if the current instruction in the instruction register is a "do until" instruction (the opcode for do until is 000101)
		--and there is room in stacks 1 and 2
		--then push into stacks 1 and 2
                elsif (PMD(23 downto 18) = "000101") and (overflow(2) /= '1') and (overflow(1) /= '1') then
                    push(2) <= '1';
                    push(1) <= '1';
		--if the condtion code of the current instruction in the instruction register is "not counter expired"
		--then push into stack 0
                elsif (PMD(3 downto 0) = "1110") and (overflow(0) /= '1') then
                    push(0)<='1'; 
		--if the current instruction is a "unconditional call" instruction
		--OR if its a conditional jump (bits 23 to 8 = 0000101100000000, bits 5 to 4 = "01") and the condition is met (cond input is true)
		--push the incremented PC into the PC stack to save it for later
                elsif ((PMD(23 downto 18) = "000111") or ((PMD(23 downto 8) = "0000101100000000") and (PMD(5 downto 4) = "01"))) and (cond = '1') then
                   push(2) <= '1';
		--if the current instruction is a "Call on flag in pin"
		--push into the PC stack
                elsif (PMD(23 downto 16) = "00000011") and (PMD(0) = '1') then
                   push(2) <= '1';
		--if the current instruction is a conditional return, and the condition is met (cond = '1')
		--pop the address at the top of the PC stack
                elsif (PMD(23 downto 4) = "00001010000000000000") and (cond = '1') then
                    pop(2) <= '1';
                elsif (add_sel = "10") and (cond = '1') then
                    pop(2) <= '1';
                    pop(1) <= '1';
		--if the counter expires
		--then pop from stack 0
                elsif (CE = '1') then
                    pop(0) <= '1';
               end if;
        end process;
    end behav;
 
