library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


Entity shiftArray is
	port( C : in std_logic_vector(7 downto 0);
		input : in std_logic_vector(15 downto 0);
		output : out std_logic_vector(31 downto 0);
		highlow : in std_logic;
		x : in std_logic	--0 for logical shift, 1 for arithmetic shift
	);
end shiftArray;

architecture Arch_shiftArray of shiftArray is
signal storage : std_logic_vector(31 downto 0);
signal leftOrRight : std_logic;	--1 for shift right, 0 for shift left
signal shift : integer;

  begin
	process(C, input, highlow, x, leftOrRight)
	begin
		--check for shift left or shift right by checking if c is a negative value or not. interpret c as a 2's complement number
		if (C(7) = '1') then
		-- sum <= std_logic_vector(unsigned(a) + unsigned(b));
			leftOrRight <= '1';

			--shift <= std_logic_vector(signed(C) + 1); --((not C) + "00000001");
		else
			leftOrRight <= '0';
			--shift <= C;
		end if;

		storage <= (others => '0');
		shift <= to_integer(unsigned(abs(signed(C))));
		if (highlow = '1' and leftOrRight = '0') then
			storage(31 downto 16) <= input;

			if (x = '0') then -- when high start from 31 to 16
						--logical shift, places zeros in the shift
					output <= std_logic_vector(shift_left(unsigned(storage), shift));
			else
					--arithmetic shift, places ones in the shift
					output <= std_logic_vector(shift_left(signed(storage), shift));
			end if;

		elsif (highlow = '1' and leftOrRight = '1') then
			storage(31 downto 16) <= input;

			if (x = '0') then -- when high start from 31 to 16
						--logical shift, places zeros in the shift
					output <= std_logic_vector(shift_right(unsigned(storage), shift));
			else
						--arithmetic shift, places ones in the shift
					output <= std_logic_vector(shift_right(signed(storage), shift));
			end if;

		elsif (highlow = '0' and leftOrRight = '0') then
			--storage(15 downto 0) <= input;
			if (x = '0'and highlow ='0') then  -- when low start from 16 to 0
					--logical shift
				storage(15 downto 0) <= input;
				output <= std_logic_vector(shift_left(unsigned(storage), (shift)));
			else
					--arithmetic shift
				storage(31 downto 16) <= input;
				--storage(15 downto 0) <= input;
				output <= std_logic_vector(shift_right(signed(storage), 16-shift));
			end if;

		else
			--storage(15 downto 0) <= input;

			if (x = '0' and highlow ='0') then  -- when low start from 16 to 0
					--logical shift
				storage(15 downto 0) <= input;
				output <= std_logic_vector(shift_right(unsigned(storage), shift));
			else
					--arithmetic shift
				storage(31 downto 16) <= input;
				--storage(15 downto 0) <= input;
				output <= std_logic_vector(shift_right(signed(storage), 16+shift));
			end if;
		end if;
	end process;
  --output <= storage;
  end Arch_shiftArray;
