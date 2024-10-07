module Memory_Unit(
  input wire clk,
  input wire reset,
  input wire [31:0] ALU_result,
  input wire [31:0] rdout2,
  
  input wire datamemWE,
  input wire [2:0] datamemory_mode,
  
  output wire [31:0] datamemory_out
    );
    
    
    Data_Memory data_memory(
         .clk(clk),  //ok
         .reset(reset),  //ok
        .addr(ALU_result), //ok
        .writedata(rdout2), //ok
        .readdata(datamemory_out),  //ok
        .we(datamemWE),                // Control Logic  //ok
        .mode(datamemory_mode)            // Control Logic  //ok
        );    
    
endmodule
