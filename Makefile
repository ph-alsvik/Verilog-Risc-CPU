loc = src/alu/

objects = $(loc)cla.v $(loc)or.v $(loc)and.v $(loc)inverter.v $(loc)multiplexer.v $(loc)zero_extend.v test_benches/alu_tb.v 

alu_wave : $(objects)
	iverilog $(objects) -o $@	
