`timescale 1ns / 1ps

module testing(I1,I2,I3,I4,O1,O2,O3,O4);
input I1;
input I2;
input I3;
input I4;
output O1;
output O2;
output O3;
output O4;

assign O1 = ~I1;
assign O2 = ~I2;
assign O3 = ~I3;
assign O4 = ~I4;

endmodule
