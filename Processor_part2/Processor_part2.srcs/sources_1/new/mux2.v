module mux2(a, b, sel, y);
	input wire [31:0] a, b;
	input wire sel;
	output wire [31:0] y;

	assign y = sel ? b : a;

endmodule
