loc = src/alu/

objects = $(loc)cla.v $(loc)or.v $(loc)and.v $(loc)inverter.v $(loc)multiplexer.v 

alu_wave : $(objects)
	iverilog $(objects) -o $@	
