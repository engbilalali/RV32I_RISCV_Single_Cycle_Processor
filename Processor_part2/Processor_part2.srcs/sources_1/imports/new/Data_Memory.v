module Data_Memory(clk,reset,addr, writedata,readdata,we, mode);
	input wire 			clk, we, reset;
	input wire [2:0]	mode;
	input wire [31:0]	addr, writedata;
	output reg [31:0]	readdata = 0;
	
	reg [7:0] mem [0:255];
	
	integer i;
	initial begin
		for (i = 0; i < 256; i = i + 1) begin
			mem[i] <= 8'h00;
		end		
	end
		
	always @(posedge clk) begin
		if (we) begin
			case (mode)
				3'b000:	{mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]} <= writedata;	// 4 byte mode (32 bit)
				3'b001:	{mem[addr], mem[addr + 1]} <= writedata[15:0];					// 2 byte mode (16 bit)
				3'b101:	{mem[addr], mem[addr + 1]} <= writedata[15:0];					// 2 byte mode (16 bit)
				3'b010: mem[addr] <= writedata[7:0];									// 1 byte mode (8 bit)
				3'b110: mem[addr] <= writedata[7:0];									// 1 byte mode (8 bit)
				default:{mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]} <= writedata;	// 4 byte mode (32 bit)
			endcase
		end
	end
	
	always @(posedge clk, addr, mode) begin
		case (mode)
			3'b000: readdata <= {mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]};	// 4 byte mode (32 bit)
			3'b001: readdata <= {{16{1'b0}}, mem[addr], mem[addr + 1]};				// 2 byte not signextended
			3'b101:	readdata <= {{16{mem[addr][7]}}, mem[addr], mem[addr + 1]};		// 2 byte signextended
			3'b010: readdata <= {{24{1'b0}}, mem[addr]};							// 1 byte not signextended
			3'b110: readdata <= {{24{mem[addr][7]}}, mem[addr]};					// 1 byte signextended
			default:readdata <= {mem[addr], mem[addr + 1], mem[addr + 2], mem[addr + 3]};	// 4 byte mode (32 bit)
		endcase
	end
	
	always @(posedge clk, reset) begin
		if (reset) begin
			for (i = 0; i < 256; i = i + 1) begin
				mem[i] <= 8'h00;
			end	
		end
	end	
	
endmodule
