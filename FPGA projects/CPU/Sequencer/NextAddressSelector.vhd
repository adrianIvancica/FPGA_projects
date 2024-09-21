library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity next_address_Selector is 
	port (Inst		: IN std_logic_vector(23 downto 0);	-- 24 bits instruction
	      cond		: IN std_logic ;	                -- condition code from the condition logic entity
	      LastInst	        : IN std_logic;				-- loop_end condition from the loop comparator
	      rs		: IN std_logic;				-- assuming this is reset
	      add_sel	        : OUT std_logic_vector(1 downto 0);	-- 00 selects interrupt controller, 01 selects PC stack, 10 selects from the PC incrementer, 11 selects immediate value from instruction
	      Clk 		: IN std_logic
);
end next_address_Selector ;


architecture behav of next_address_Selector is 
begin
	process (rs, Inst, cond, LastInst, Clk)		
		variable s : std_logic_vector(1 downto 0) ;		
		begin
		--on rising edge of the clock, if reset it high, reset the output to 00 ()
		if (Clk'event and Clk = '1' and rs = '1') then
			s := "00"; 
		--on rising edge of the clock, if the instruction being executed is a conditional jump (opcode 00011 is for conditional jump)
	    elsif (Clk'event and Clk = '1' and Inst(23 downto 19) = "00011") then -- Conditional Jump
			if (cond = '1') then
				s := "11" ; 	-- select the address from the IR	--jump to the immediate value given in the instruction if condition is met
			else
				s := "10" ;	-- select from the pc incrementer	--if condition not met, business as usual, increment the pc
			end if;

		-- if the instruction is a conditional return			
		elsif (Clk'event and Clk = '1' and LastInst = '1') then

				if (cond = '1') then
					s := "10" ; -- select from the pc incrementer, end the loop
				else
					s := "01" ; -- select from the pc stack, start the loop again						
				end if;
				-- other 
                   --end if;
		elsif (Clk'event and Clk = '1') then
			s := "10" ; -- select from the pc incrementer
		end if;
		add_sel <= s; -- output the result
	end process;
end behav;