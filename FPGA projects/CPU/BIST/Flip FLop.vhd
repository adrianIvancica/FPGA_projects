library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

Entity Flip_Flop is 
  port ( input, load, clk : in std_logic;
	 output : out std_logic );
End Flip_Flop;


Architecture behav of Flip_Flop is
Begin
	output <= input when (load = '1' and clk = '1');
End behav;
