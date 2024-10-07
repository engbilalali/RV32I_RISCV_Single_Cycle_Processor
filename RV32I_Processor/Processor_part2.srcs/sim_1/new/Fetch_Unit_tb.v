module Fetch_Unit_tb();
reg clk;
reg reset;
reg [1:0] PC_sel;
wire [31:0] PC;
wire [31:0] Instruction;

Fetch_Unit fetch_unit(
.clk(clk),
.reset(reset),
.ExtImmediate(),
.ALU_result(),
.PC_sel(PC_sel),
.PC(PC),
.Instruction(Instruction));

always #5 clk= ~clk;

initial begin
clk=1; reset=1;
#10 reset=0;
#10 PC_sel=0;
#100;
$finish;

end

endmodule
