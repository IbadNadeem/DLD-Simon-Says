`timescale 1ns / 1ps
module v_counter(clk, enable_v, v_count);
// inputs
input clk;
input enable_v;
// outputs
//output[9:0] v_count;
output v_count;
reg[9:0] v_count;
// initialized the outputs as 0
initial v_count = 0;
always @ (posedge enable_v)
    begin
    if (v_count < 524 && enable_v == 1) // if V_count less than 524
        begin
            v_count <= v_count + 1; // increment
        end
        else
        begin
           v_count <= 0;
        end
    end
endmodule
