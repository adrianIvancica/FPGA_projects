library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

Entity ALUKernel is
	port( X, Y: in std_logic_vector(15 downto 0);
	CI: in std_logic;
	AMF: in std_logic_vector(4 downto 0); -- indicates the operation that will be done
	R: out std_logic_vector(15 downto 0); 
	AZ, AN, AC, AV, AS: out std_logic
	-- AZ = result 0, AN = result negative, AV = result overflow, AC = carry (we hardcoded this to always be 0, ignore this output), AS = x is negative
	);
end ALUKernel;

architecture kernelalu of ALUKernel is
	--signal amfupdt : in std_logic_vector(4 downto 0);
	signal storage : std_logic_vector(15 downto 0);

	begin
	process (AMF, X, Y, CI, storage)
	begin
	
	case AMF is
		
			-- if AMF is 10000 push y through
		when "10000" =>
			storage <= Y;
			-- if AMF is 10001 do y+1
		when "10001" =>
			storage <= std_logic_vector((Y) + (CI));
			-- if AMF is 10010 do x+y+c (C is carry?)
		when "10010" =>
			storage <= std_logic_vector((X) + (Y) + (CI));
			-- if AMF is 10011 do x+y
		when "10011" =>
			storage <=std_logic_vector((X) + (Y));
			-- if AMF is 10100 do NOT y
		when "10100" =>
			storage <= not Y;
			-- if AMF is 10101 do -y
		when "10101" =>
			storage <= std_logic_vector((not Y) + '1');
			-- if AMF is 10110 do X-Y+C-1
		when "10110" =>
			storage <= std_logic_vector((X) - (Y) + (CI) - '1');
			-- if AMF is 10111 do X-Y
		when "10111" =>
			storage <= std_logic_vector((X) - (Y));
			-- if AMF is 11000 do Y-1
		when "11000" =>
			storage <= std_logic_vector((Y) - '1');
			-- if AMF is 11001 do Y-X
		when "11001" =>
			storage <= std_logic_vector((Y) - (X));
			-- if AMF is 11010 do Y-X+C-1
		when "11010" =>
			storage <= std_logic_vector((Y) - (X) + (CI) - '1');
			-- if AMF is 11011 do NOT X
		when "11011" =>
			storage <= not X;
			-- if AMF is 11100 do X AND Y
		when "11100" =>
			storage <= X and Y;
			-- if AMF is 11101 do X Ostorage Y
		when "11101" =>
			storage <= X or Y;
			-- if AMF is 11110 do X XOstorage Y
		when "11110" =>
			storage <= X xor Y;
			-- if AMF is 11111 do ABS X
		when "11111" =>
		if (X(15) = '1') then
			storage <= (not X) + '1';
		else
			storage <= X;
		end if;
		when others =>
			storage <= (others => '0');
	end case;

	-- AZ flag is 1 when the output is 0
	if (storage = "0000000000000000") then
		AZ <= '1';
	else
		AZ <= '0';
	end if;

	-- AN flag is 1 when the output is negative (since output is a signed 2's complement number, we just check the most significant bit)
	AN <= storage(15);

	-- AV flag is 1 when there's an overflow detected after an addition/subtraction
	-- set flag to 0 if we do some other operation like ORing or ANDing
	if (AMF = "10000" or AMF = "10100" or AMF = "10101" or AMF = "11011" or AMF = "11100" or AMF = "11101" or AMF = "11110" or AMF = "11111") then
		AV <= '0';
	elsif ((X(15) = '1' and Y(15) = '1' and storage(15) = '0') or (X(15) = '0' and Y(15) = '0' and storage(15) = '1')) then
		AV <= '1';
	else
		AV <= '0';
	end if;

	-- AS flag is 1 when the X input is negative (since input x is a signed 2's complement number, we just check the most significant bit)
	AS <= X(15);

	-- AC Flag should be ignored. It's suppoed to be the carry bit, but we don't really have a carry bit since we're dealing with signed 2's complement numbers
	AC <= '0';

end process;

R <= storage;

end;

