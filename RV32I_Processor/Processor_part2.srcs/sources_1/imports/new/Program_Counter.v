module Program_Counter(
    input wire clk,
    input wire reset,
    input wire [31:0] ExtImmediate,
    input wire [31:0] ALU_result,
    input wire [1:0]  PC_sel,
    output wire [31:0] PC
    );
    
   reg [31:0] PC_now;
   reg [31:0] PC_next; 
    
   assign PC = PC_next; 
    
   always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            PC_next <= 0;
        end
        else
        begin
            PC_next <= PC_now;
        end
    end


    always @(*) begin
        case (PC_sel)
            2'b00:  
            begin
               PC_now <= PC_next + 4; 
            end
            2'b01: 
            begin
               PC_now <= ALU_result;
            end
            2'b10: 
            begin
               PC_now <= PC_next + ExtImmediate; 
            end
            2'b11:  
            begin
               PC_now <= 32'hXXXXXXXX;
            end
        endcase
    end

    
endmodule
