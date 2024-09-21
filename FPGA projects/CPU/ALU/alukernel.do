# Compile the ALUKernel entity
vcom -work work your_file.vhd

# Simulate the design
vsim -c work.ALUKernel

# Add signals to the wave window
add wave -r -position insertpoint sim:/ALUKernel/X
add wave -r -position insertpoint sim:/ALUKernel/Y
add wave -r -position insertpoint sim:/ALUKernel/CI
add wave -r -position insertpoint sim:/ALUKernel/AMF
add wave -r -position insertpoint sim:/ALUKernel/R
add wave -r -position insertpoint sim:/ALUKernel/AZ
add wave -r -position insertpoint sim:/ALUKernel/AN
add wave -r -position insertpoint sim:/ALUKernel/AC
add wave -r -position insertpoint sim:/ALUKernel/AV
add wave -r -position insertpoint sim:/ALUKernel/AS
add wave -position end  sim:/alukernel/storage

# Set up the simulation time
run 100 ps

# Test case 1: AMF = "10000", X = "0000000000100000", Y = "0000000000110010", CI = '0'
force sim:/ALUKernel/X 0000000000100000
force sim:/ALUKernel/Y 0000000000110010
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 10000
run 100 ps

# Test case 2: AMF = "10001", X = "0000000000011111", Y = "0000000000100001", CI = '1'
force sim:/ALUKernel/X 0000000000011111
force sim:/ALUKernel/Y 0000000000100001
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 10001
run 100 ps

# Test case 3: AMF = "10010", X = "0000000000101010", Y = "0000000000111101", CI = '0'
force sim:/ALUKernel/X 0000000000101010
force sim:/ALUKernel/Y 0000000000111101
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 10010
run 100 ps

# Test case 4: AMF = "10011", X = "0000000000000011", Y = "0000000000001011", CI = '1'
force sim:/ALUKernel/X 0000000000000011
force sim:/ALUKernel/Y 0000000000001011
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 10011
run 100 ps

# Test case 5: AMF = "10100", X = "0000000000111111", Y = "0000000000000000", CI = '0'
force sim:/ALUKernel/X 0000000000111111
force sim:/ALUKernel/Y 0000000000000000
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 10100
run 100 ps

# Test case 6: AMF = "10101", X = "0000000000110001", Y = "0000000000011111", CI = '1'
force sim:/ALUKernel/X 0000000000110001
force sim:/ALUKernel/Y 0000000000011111
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 10101
run 100 ps

# Test case 7: AMF = "10110", X = "0000000000110101", Y = "0000000000000101", CI = '0'
force sim:/ALUKernel/X 0000000000110101
force sim:/ALUKernel/Y 0000000000000101
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 10110
run 100 ps

# Test case 8: AMF = "10111", X = "0000000000110111", Y = "0000000000110000", CI = '1'
force sim:/ALUKernel/X 0000000000110111
force sim:/ALUKernel/Y 0000000000110000
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 10111
run 100 ps

# Test case 9: AMF = "11000", X = "0000000000110010", Y = "0000000000110001", CI = '0'
force sim:/ALUKernel/X 0000000000110010
force sim:/ALUKernel/Y 0000000000110001
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 11000
run 100 ps

# Test case 10: AMF = "11001", X = "0000000000010101", Y = "0000000000100000", CI = '1'
force sim:/ALUKernel/X 0000000000010101
force sim:/ALUKernel/Y 0000000000100000
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 11001
run 100 ps

# Test case 11 (continued): "0000000000001111", Y = "0000000000011000", CI = '0'
force sim:/ALUKernel/X 0000000000001111
force sim:/ALUKernel/Y 0000000000011000
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 11010
run 100 ps

# Test case 12: AMF = "11011", X = "0000000000111111", Y = "0000000000000111", CI = '1'
force sim:/ALUKernel/X 0000000000111111
force sim:/ALUKernel/Y 0000000000000111
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 11011
run 100 ps

# Test case 13: AMF = "11100", X = "0000000000110000", Y = "0000000000110010", CI = '0'
force sim:/ALUKernel/X 0000000000110000
force sim:/ALUKernel/Y 0000000000110010
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 11100
run 100 ps

# Test case 14: AMF = "11101", X = "0000000000110000", Y = "0000000000110100", CI = '1'
force sim:/ALUKernel/X 0000000000110000
force sim:/ALUKernel/Y 0000000000110100
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 11101
run 100 ps

# Test case 15: AMF = "11110", X = "0000000000111000", Y = "0000000000010011", CI = '0'
force sim:/ALUKernel/X 0000000000111000
force sim:/ALUKernel/Y 0000000000010011
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 11110
run 100 ps

# Test case 16: AMF = "11111", X = "0000000000101000", Y = "0000000000111101", CI = '1'
force sim:/ALUKernel/X 0000000000101000
force sim:/ALUKernel/Y 0000000000111101
force sim:/ALUKernel/CI 1
force sim:/ALUKernel/AMF 11111
run 100 ps

# Test case 16: AMF = "10011", X = "0111111111111111", Y = "0111111111111111", CI = '0'
force sim:/ALUKernel/X 0111111111111111
force sim:/ALUKernel/Y 0111111111111111
force sim:/ALUKernel/CI 0
force sim:/ALUKernel/AMF 10011
run 100 ps

# Exit ModelSim
# quit -sim
