module Fetch_Unit(
input wire clk,
input wire reset,
input wire [31:0] ExtImmediate,
input wire [31:0] ALU_result,
input wire [1:0]  PC_sel,
output wire [31:0] PC,
output wire [31:0] Instruction
    );
    
    Instruction_Memory memory(.addr(PC),.rd(Instruction));
    
    
    Program_Counter counter(.clk(clk),.reset(reset),.ExtImmediate(ExtImmediate),.ALU_result(ALU_result),.PC_sel(PC_sel),.PC(PC));
    
    
    
endmodule
