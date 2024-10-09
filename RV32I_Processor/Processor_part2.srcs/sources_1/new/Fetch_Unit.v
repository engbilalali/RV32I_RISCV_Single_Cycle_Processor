module Fetch_Unit(
input wire clk,
input wire reset,
input wire [31:0] ExtImmediate,
input wire [31:0] ALU_result,
input wire [1:0]  PC_sel,
output wire [31:0] PC,
output wire [31:0] Instruction
    );
    
    reg [31:0] PC_next;
    
    Instruction_Memory memory(.addr(PC),.rd(Instruction));
    
    
    Program_Counter counter(.clk(clk),.reset(reset),.PC_next(PC_next),.PC(PC));
    
    
    always @(*) begin
        case (PC_sel)
            2'b00:  
            begin
               PC_next = PC + 4; 
            end
            2'b01: 
            begin
               PC_next = ALU_result;
            end
            2'b10: 
            begin
               PC_next = PC + ExtImmediate; 
            end
            2'b11:  
            begin
               PC_next = 32'hXXXXXXXX;
            end
        endcase
    end    
    
    
    
endmodule
