`timescale 1ns / 1ps
module h_counter(clk, h_count, trig_v);
input clk; // initializing clock an input
// outputs
//output[9:0] h_count;
output h_count;
output trig_v;
reg[9:0] h_count;
reg trig_v;
// initialized the outputs as 0
initial h_count = 0;
initial trig_v = 0;
always @ (posedge clk)
    begin
    if (h_count < 799) // if h_count less than 800
        begin
            h_count <= h_count + 1; // increment
            trig_v <= 1'b0;
        end
    else
        begin
            trig_v <= 1'b1; // when h_count = 800, trig_v = 1
            h_count <= 1'b0;
        end        
    end
endmodule
