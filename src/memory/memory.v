module memory #(parameter ADDR_WIDTH = 8)
	 (
	input [ADDR_WIDTH-1:0] address,
	input [15:0] write_data,
	input write_enable,
	input clk,
	output [15:0] read_data 
);

	reg [15:0] data_out;  
	reg [15:0] ram [3:0];

	assign read_data = data_out;

	always @ (posedge clk) begin
		if (write_enable) begin
			ram[address] <= write_data;
		end else begin
			data_out <= ram[address];	
		end
	end

endmodule
