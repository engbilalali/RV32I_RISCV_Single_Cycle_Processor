module Execute_Unit(
   input wire clk,
   input wire reset,
   input wire [31:0] PC,
   input wire [31:0] rdout1,
   input wire [31:0] rdout2,
   input wire [31:0] operand_b,
   input wire [31:0] ExtImmediate,
   
   input wire [3:0] ALU_control,
   
   input wire reg1sel_flag,
   
   input wire [31:0] ALU_result,
   
   output wire zero 
    );
    
   wire [31:0] operand_a; 
   
   
   assign zero =  ALU_result[0]; //ok
    
     mux2 operand_b_selection(
           .a(rdout1), //ok
           .b((PC-4)),//ok 
           .sel(reg1sel_flag), //ok
           .y(operand_a));  //ok   
           
           
    ALU alu(
           .a(operand_a), //ok
           .b(operand_b), //ok
           .ALUControl(ALU_control), //ok
           .result(ALU_result));       //ok     
    
endmodule
