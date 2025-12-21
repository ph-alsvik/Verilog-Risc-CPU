module inverter (
	input [15:0] A,
	output [15:0] Y 
);

	assign Y = ~A;

endmodule
