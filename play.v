`timescale 1ns / 1ps
module play (
    input wire clk,
    input wire rst,
    input wire [15:0] ticks_per_milli,
    input wire [9:0] freq,
    output reg sound
);
  reg [31:0] tick_counter;
  wire [31:0] ticks_per_second = ticks_per_milli * 1000;

  always @(posedge clk) begin
    if (rst) begin
      tick_counter <= 0;
      sound <= 0;
    end else if (freq == 0) begin
      sound <= 0;
    end else begin
      tick_counter <= tick_counter + freq;
      if (tick_counter >= (ticks_per_second >> 1)) begin
        sound <= !sound;
        tick_counter <= tick_counter + freq - (ticks_per_second >> 1);
      end
    end
  end

endmodule