module inverter (
	input [15:0] A,
	output [15:0] Y 
);

	assign Y = {~A[15], ~A[14], ~A[13], ~A[12], ~A[11], ~A[10], ~A[9], ~A[8], ~A[7], ~A[6], ~A[5], ~A[4], ~A[3], ~A[2], ~A[1], ~A[0]};

endmodule
