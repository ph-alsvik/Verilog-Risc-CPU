module zero_extend (
	input sign_bit,
	output [15:0] extended_sign
);

	assign extended_sign = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, sign_bit};

endmodule
