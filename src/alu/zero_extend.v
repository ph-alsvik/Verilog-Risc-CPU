module zero_extend (
	input sign_bit,
	output [15:0] extended_sign
);

	extended_sign = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, sign_bit}

endmodule
