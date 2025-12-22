module op_select(
	input [15:0] ze_res,
	input [15:0] cla_res,
	input [15:0] or_res,
	input [15:0] and_res,
	input [1:0] sel,
	output reg [15:0] Y 
);

	always @ (ze_res, cla_res, or_res, and_res, sel) begin
		case(sel)
			2'b00 	: Y = and_res;
			2'b01 	: Y = or_res;
			2'b10 	: Y = cla_res;
			default : Y = ze_res;
		endcase	
	end	

endmodule
