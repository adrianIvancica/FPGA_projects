library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

Entity top_level is
	port(  DMD: inout std_logic_vector (15 downto 0); -- DMD storage
			 DMA: inout std_logic_vector (13 downto 0);
			 Data: in std_logic_vector (15 downto 0);
	   clk: in std_logic;
		--reverse_bit, wren: in std_logic;  -- clk and bit reverse select
	   sel: in std_logic_vector (6 downto 0); -- selection for we will not be using bits 0-1
	   load: in std_logic_vector (11 downto 0); -- load registers 1-12 we will not be using registers L1-L3 load(0) and load(4)-Load(11)
	  -- bc: in std_logic_vector (2 downto 0); -- tristate buffer
	   address: out std_logic_vector (13 downto 0) -- spits out the addresss
	);
end top_level;

architecture combine_both of top_level is

component DAG_top is
	port(  DMD: inout std_logic_vector (15 downto 0); -- DMD storage
	   clk, reverse_bit: in std_logic;  -- clk and bit reverse select
	   sel: in std_logic_vector (6 downto 0); -- selection for we will not be using bits 0-1
	   load: in std_logic_vector (11 downto 0); -- load registers 1-12 we will not be using registers L1-L3
	  -- bc: in std_logic_vector (2 downto 0); -- tristate buffer
	   address: out std_logic_vector (13 downto 0) -- spits out the addresss
	);
end component;

component testMEM IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (13 DOWNTO 0);-- feed in the address (DMA)
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (15 DOWNTO 0); -- from DMD bus 
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0) -- output to the DAG
	);
END component;

signal S0: std_logic_vector (15 downto 0);
begin

--memoryunit: testMEM port map ( DMA, clk, DMD, wren, DMD);
memoryunit: testMEM port map ( DMA, clk, , '0', DMD);

--DAG1component: DAG_top port map ( DMD, clk, reverse_bit, sel, load,  DMA);
DAG1component: DAG_top port map ( DMD, clk, '0', sel, load, DMA); -- address will be used as an output for demo purposes (to show that this memory unit works)

end;