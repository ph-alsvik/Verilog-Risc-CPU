
module alu (
	input [15:0] A,
	input [15:0] B,
	input [2:0] F,
	output [15:0] Y,
	output C_out
);

	wire [15:0] B_inv;
	wire [15:0] Y_multiplex;
	wire [15:0] cla_res;
	wire [15:0] or_res;
	wire [15:0] and_res;
	wire [15:0] ze_res; 

	inverter i0 (
		.A(B),
		.Y(B_inv)
	);

	multiplexer m0 (
		.A(B_inv),
		.B(B),
		.F(F[2]),
		.Y(Y_multiplex)
	);

	cla c0 (
		.A(A),
		.B(Y_multiplex),	
		.C_in(F[2]),
		.S(cla_res),
		.C_out(C_out)
	);

	or_ or0 (
		.A(A),
		.B(Y_multiplex),
		.Y(or_res)	
	);

	and_ a0 (
		.A(A),
		.B(Y_multiplex),
		.Y(and_res)
	);

	zero_extend ze0 (
		.sign_bit(cla_res[15]),
		.extended_sign(ze_res)
	);

	op_select os (
		.ze_res(ze_res),
		.cla_res(cla_res),
		.or_res(or_res),
		.and_res(and_res),
		.sel(F[1:0]),
		.Y(Y)
	);

endmodule
