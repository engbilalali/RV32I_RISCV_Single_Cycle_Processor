module extend(Instruction, ImmSrc, ExtImm);
	input wire [2:0]	ImmSrc;
	input wire [24:0]	Instruction;
	output reg [31:0]	ExtImm;
	
	
	always @(ImmSrc, Instruction) begin
		case (ImmSrc)
			3'b000:	ExtImm <= {Instruction[24:5], {12{1'b0}}};									// U-Type
			3'b001:	ExtImm <= {{21{Instruction[24]}}, Instruction[23:18], Instruction[4:0]};					// S-Type
			3'b010:	ExtImm <= {{20{Instruction[24]}}, Instruction[0], Instruction[23:18], Instruction[4:1], 1'b0};	// B-Type
			3'b011:	ExtImm <= {{21{Instruction[24]}}, Instruction[23:13]};								// I-Type
			3'b100:	ExtImm <= {{13{Instruction[24]}}, Instruction[12:5], Instruction[13], Instruction[23:14], 1'b0};// J-Type
			default:ExtImm <= {32{1'b0}};
		endcase
	end

endmodule
