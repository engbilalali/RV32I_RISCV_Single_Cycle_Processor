module Processor_RV32I(
    input wire clk,//ok
    input wire reset //ok
    );
    
    wire [31:0] pc;    //ok
    wire [31:0] instruction;    //ok
    wire [31:0] extended_immediate;  //ok
    wire [31:0] alu_result;
    wire [31:0] reg_write_data; //ok
    wire [31:0] operand_b; //ok
    wire [31:0] reg1out;//ok
    wire [31:0] reg2out;//ok
    wire [31:0] datamemory_out;//ok
    
    wire zero;//ok
    
    wire [3:0] alu_control;//ok
    wire [2:0] datamemory_mode;//ok
    wire [1:0] pc_sel; //ok
    wire [1:0] writeback_sel;//ok
    
    wire datamemWE;//ok
    wire reg1sel_flag;//ok
    
    
    Fetch_Unit fetch_unit(
        .clk(clk),
        .reset(reset),
        .ExtImmediate(extended_immediate), //ok
        .ALU_result(alu_result), //ok
        .PC_sel(pc_sel),
        .PC(pc),//ok
        .Instruction(instruction)//ok
        );
        
        
        
        
    Decode_Unit decode_unit(
        .clk(clk),
        .reset(reset),
        .Instruction(instruction),//ok
        .reg_write_data(reg_write_data), //ok
        .zero(zero),//ok
        .ALU_control(alu_control),//ok
        .ExtImmediate(extended_immediate), //ok
        .operand_b(operand_b),//ok
        .rdout1(reg1out),//ok
        .rdout2(reg2out), //ok  
        .writeback_sel(writeback_sel),//ok
        .PC_sel(pc_sel), //ok
        .datamemory_mode(datamemory_mode),//ok
        .datamemWE(datamemWE), //ok
        .reg1sel_flag(reg1sel_flag) //ok
        );
        
        
    Execute_Unit execute_unit(
        .clk(clk),
        .reset(reset),
        .PC(pc),//ok
        .rdout1(reg1out),//ok
        .rdout2(reg2out),//ok
        .operand_b(operand_b),//ok
        .ExtImmediate(extended_immediate),  //ok
        .ALU_control(alu_control),//ok
        .reg1sel_flag(reg1sel_flag),//ok
        .ALU_result(alu_result),  //ok
        .zero(zero)//ok 
        );
        
        
        
    Memory_Unit memory_unit(
        .clk(clk),
        .reset(reset),
        .ALU_result(alu_result),//ok
        .rdout2(reg2out),//ok
        .datamemWE(datamemWE), //ok
        .datamemory_mode(datamemory_mode),//ok
        .datamemory_out(datamemory_out)//ok
        );
        
        
        
    WriteBack_Unit writeback_unit(
        .clk(clk),
        .reset(reset),
        .datamemory_out(datamemory_out),//ok
        .ALU_result(alu_result), //ok
        .ExtImmediate(extended_immediate),  //ok
        .PC(pc),
        .writeback_sel(writeback_sel),//ok
        .reg_write_data(reg_write_data)
        );
        

endmodule
