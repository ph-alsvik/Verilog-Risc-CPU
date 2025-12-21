module multiplexer (
	input [15:0] A,
	input [15:0] B,
	input F,
	output [15:0] Y
);

	assign Y = F ? A : B;	

endmodule
