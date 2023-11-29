`timescale 1ns / 1ps

module clock_divider(clk, clk_d);
parameter div_value = 1;
/*
    div_value = (100 / 2*5) - 1
              =        9
*/ 
// input outputs
input clk;
output clk_d;
reg clk_d;
reg count;
// initializing clkd and count as 0
initial 
begin
    clk_d = 0;
    count = 0;
end
// count incrementing
always @(posedge clk)
    begin
        if (count == div_value)
        begin
            count <= 0;
            clk_d <= ~clk_d;
        end
        else
            count <= count + 1;
    end

endmodule