`timescale 1ns / 1ps

module vga_sync(
    input[9:0] h_count, // from h_counter module
    input[9:0] v_count, // from v_counter module
    output h_sync, // when to move to next row
    output v_sync, // when to move back to top of screen
    output video_on, // active area
    output[9:0] x_loc, // current x location of the pixel
    output[9:0] y_loc // current y location of the pixel
    );

// Horizontal
localparam HD = 640; // Horizontal Display Area
localparam HF = 16; // Horizontal (Front Porch) Right Border
localparam HB = 48; // Horizontal (Back Porch) Left Border
localparam HR = 96; // Horizontal Retrace

// Vertical
localparam VD = 480; // Vertical Display Area
localparam VF = 33; // Vertical (Front Porch) Bottom Border 
localparam VB =  10; // Vertical (Back Porch) Top Border
localparam VR =  2; // Vertical Retrace

// Logics
assign video_on = h_count < HD && v_count < VD; // if in the displayable region then 1 else 0
assign x_loc = h_count; // x location same as h_count from prev module
assign y_loc = v_count; // y location same as v_count from prev module
assign h_sync = h_count < HD + HF | h_count >= HD + HF + HR; // stays 1 for left to right then 0 resets back to left
assign v_sync = v_count < VD + VF | v_count >= VD + VF + VR; // stays 1 for up to down then 0 resets back to up

endmodule
