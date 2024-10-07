module WriteBack_Unit(
  input wire clk,
  input wire reset,
  input wire [31:0] datamemory_out,
  input wire [31:0] ALU_result,
  input wire [31:0] ExtImmediate,
  input wire [31:0] PC,
  input wire [1:0] writeback_sel,
  
  output wire [31:0] reg_write_data
    );
    
    mux4 writeBack_select (
        .a(datamemory_out),
        .b(ALU_result),
        .c(ExtImmediate),
        .d(PC),
        .sel(writeback_sel), 
        .y(reg_write_data));
        
endmodule
