module alu_tb;

	reg [15:0] A, B;
	reg [2:0] F;
	wire [15:0] Y;
	wire C_out;

	alu a0 (
		.A(A),
		.B(B),
		.F(F),
		.Y(Y),
		.C_out(C_out)	
	);

	initial begin
		$monitor("A = %d, B = %d, F=%b, Y=%d, C_out=%b", A, B, F, Y, C_out);
		A = 'b100;
		B = 'b111;
		F = 'b000;
		#1;
		F = 'b010;	
		#1;
		F = 'b001;
		#1;
		F = 'b110;
	end

endmodule
