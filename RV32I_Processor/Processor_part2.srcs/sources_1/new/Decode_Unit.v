module Decode_Unit(
 input wire clk,
 input wire reset,
 input wire [31:0] Instruction,
 input wire [31:0] reg_write_data,
 
 input wire zero,
 
 output wire [3:0] ALU_control,
 output wire [31:0] ExtImmediate,
 output wire [31:0] operand_b,
 output wire [31:0] rdout1,
 output wire [31:0] rdout2,  
 
 output wire [1:0] writeback_sel,
 output wire [1:0]  PC_sel,
 output wire [2:0] datamemory_mode,
 
 output wire datamemWE,
 output wire reg1sel_flag
 );

  wire regWE;
  wire [2:0] Imm_sel;
  wire reg2sel_flag;

  Register_File register_file(
        .clk(clk),//ok
        .reset(reset),//ok        
        .rs1(Instruction[19:15]),//ok
        .rs2(Instruction[24:20]),//ok
        .rd(Instruction[11:7]),//ok        
        .regWrite(reg_write_data),//ok
        .we(regWE),///ok
        .rdout1(rdout1),//ok
        .rdout2(rdout2));//ok


    Control_Logic control_logic (
            .clk(clk),//ok
            .reset(reset),//ok
            .instruction(Instruction),//ok 
            .jump(zero), //ok
            .ALUControl(ALU_control),//ok 
            .dmemMode(datamemory_mode), //ok 
            .immSEL(Imm_sel), //ok
            .regSEL(writeback_sel), //ok
            .pcSEL(PC_sel),//ok 
            .dmemWE(datamemWE),//ok 
            .regWE(regWE), //ok
            .rs1SEL(reg1sel_flag), //ok
            .rs2SEL(reg2sel_flag));//ok
            
     extend extend_immediate(
            .Instruction(Instruction[31:7]), //ok
            .ImmSrc(Imm_sel), //ok
            .ExtImm(ExtImmediate));   //ok    
            
     mux2 operand_b_selection(
            .a(rdout2), //ok
            .b(ExtImmediate),//ok 
            .sel(reg2sel_flag), //ok
            .y(operand_b));  //ok          

endmodule
