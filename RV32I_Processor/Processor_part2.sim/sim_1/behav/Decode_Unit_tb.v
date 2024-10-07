module Decode_Unit_tb();

  reg clk;
  reg reset;
  reg [31:0] Instruction;
  reg [31:0] reg_write_data;
  reg zero;
  wire [31:0] ALU_control;
  wire [31:0] ExtImmediate;
  wire [31:0] operand_b;
  wire [31:0] rdout1;
  wire [31:0] rdout2;  
  wire [1:0] writeback_sel;
  wire [1:0]  PC_sel;
  wire [1:0] datamemory_mode;
  wire datamemWE;
  wire reg1sel_flag;


    Decode_Unit DUT(
        .clk(clk),
        .reset(reset),
        .Instruction(Instruction),
        .reg_write_data(data),
        .zero(zero_flag),
        .ALU_control(),
        .ExtImmediate(ExtImmediate),
        .operand_b(operand_b),
        .rdout1(reg1out),
        .rdout2(reg2out),  
        .writeback_sel(wb_sel),
        .PC_sel(PC_sel),
        .datamemory_mode(datamemory_mode),
        .datamemWE(datamemWE),
        .reg1sel_flag(reg1sel_flag)
    );

always #5 clk=~clk;

initial begin
  // Test Reset Condition
  clk = 1;
  reset = 1;
  Instruction = 32'b0;
  zero = 0;
  reg_write_data = 32'b0;
  #10 reset = 0;
  
//    // Test Basic Instruction Decoding
//  Instruction = 32'h00A08093; // Example instruction (replace with actual)
//  #10;

//  // Test Basic Instruction Decoding
//  Instruction = 32'hA0000000; // Example instruction (replace with actual)
//  #10;

  // Test Writeback Data Path
//  reg_write_data = 32'hDEADBEEF;
  Instruction = 32'h55312023; // Example load/store instruction
  #10;

//  // Test Zero Flag Operation
//  zero = 1;
//  Instruction = 32'hC0000000; // Example branch instruction
//  #10;

//  // Test ALU Control
//  Instruction = 32'hD0000000; // Example ALU instruction (ADD)
//  #10;

//  // Test Operand B Selection
//  Instruction = 32'hE0000000; // Example instruction with immediate value
//  #10;

  // Complete simulation
  $stop;
end


endmodule
