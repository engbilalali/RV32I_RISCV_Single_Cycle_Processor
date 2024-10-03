module Processor_tb();
reg clk;
reg reset;

Processor_RV32I processor(.clk(clk),.reset(reset));

always #5 clk=~clk;

initial begin
clk=1; reset=1;
#1 reset=0;
#40;
$stop;


end

endmodule
