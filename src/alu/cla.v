module fulladder (
	input a,
	input b,
	input c_in,
	output s,
	output c_out
);

	assign s = a ^ b ^ c_in;
	assign c_out = a&b | a&c_in | b&c_in; 

endmodule

module cla_block (
	input [3:0] A,
	input [3:0] B,	
	input C_in,
	output [3:0] S,
	output C_out
);

	wire c_out0, c_out1, c_out2;

	fulladder u0 (
		.a(A[0]),
		.b(B[0]),
		.c_in(C_in),
		.s(S[0]),
		.c_out(c_out0)
	);
	
	fulladder u1 (
		.a(A[1]),
		.b(B[1]),
		.c_in(c_out0),
		.s(S[1]),
		.c_out(c_out1)
	);

	fulladder u2 (
		.a(A[2]),
		.b(B[2]),
		.c_in(c_out1),
		.s(S[2]),
		.c_out(c_out2)
	);
	
	fulladder u3 (
		.a(A[3]),
		.b(B[3]),
		.c_in(c_out2),
		.s(S[3]),
		.c_out(C_out)
	);

	wire P0, P1, P2, P3;
	wire G0, G1, G2, G3;
	wire P, G; 

	assign P0 = A[0] | B[0];
	assign P1 = A[1] | B[1];
	assign P2 = A[2] | B[2];
	assign P3 = A[3] | B[3];

	assign P = P0&P1&P2&P3;

	assign G0 = A[0] & B[0];
	assign G1 = A[1] & B[1];
	assign G2 = A[2] & B[2];
	assign G3 = A[3] & B[3];

	assign G = G3 | P3&(G2 | P2&(G1 | P1&G0));

	assign C_out = G | P&C_in; 

endmodule

module cla (
	input [15:0] A,
	input [15:0] B,
	input C_in,
	output [15:0] S,
	output C_out
);

	wire c_out0, c_out1, c_out2;

	cla_block c0 (
		.A(A[3:0]),
		.B(B[3:0]),
		.C_in(C_in),
		.S(S[3:0]),
		.C_out(c_out0)
	);

	cla_block c1 (
		.A(A[7:4]),
		.B(B[7:4]),
		.C_in(c_out0),
		.S(S[7:4]),
		.C_out(c_out1)
	); 
	
	cla_block c2 (
		.A(A[11:8]),
		.B(B[11:8]),
		.C_in(c_out1),
		.S(S[11:8]),
		.C_out(c_out2)
	);

	cla_block c3 (
		.A(A[15:12]),
		.B(B[15:12]),
		.C_in(c_out2),
		.S(S[15:12]),
		.C_out(C_out)
	);

endmodule
