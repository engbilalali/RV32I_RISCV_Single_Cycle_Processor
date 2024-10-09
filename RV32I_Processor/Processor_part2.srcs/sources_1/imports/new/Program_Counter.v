module Program_Counter(
    input wire clk,
    input wire reset,
    input wire [31:0] PC_next,
    output reg [31:0] PC
    );
    
    
   always @(posedge clk or posedge reset)
    begin
        if (reset)
        begin
            PC <= 0;
        end
        else
        begin
            PC <= PC_next;
        end
    end

endmodule
