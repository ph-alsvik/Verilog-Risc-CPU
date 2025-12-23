module mem_tb;

	integer i;

	reg [1:0] address;
	reg [15:0] write_data; 
	reg write_enable;
	reg clk;
	wire [15:0] read_data;	

	reg [15:0] mem_file [3:0]; 

	memory #(2) mem (
		.address(address),
		.write_data(write_data),
		.write_enable(write_enable),
		.clk(clk),
		.read_data(read_data)
	);

	always #1 clk =~clk;

	initial begin
		$monitor("address=%x, write_data=%x", address, write_data);
		$display("Loading rom...");
		$readmemh("rom_image.mem", mem_file);
		clk = 0;
		write_enable = 1;	
		for (i = 0; i < 4; i = i + 1) begin
			address = i;
			write_data = mem_file[i];
			#2;	
		end			
		$finish;
	end			
endmodule
