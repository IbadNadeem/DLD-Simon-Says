`timescale 1ns / 1ps

module top( 
    input CLK,
input RST, 
input BTN0,
input BTN1,
input BTN2,
input BTN3,
output wire LED0,
output wire LED1,
output wire LED2,
output wire LED3,
    output h_sync, // move to next row
    output v_sync, // move to next column
    output [3:0] red, // red in that pixel
    output [3:0] green, // green in that pixel
    output [3:0] blue, // blue in that pixel

//output LED4,
//output LED5,
//output LED6,
//output LED7,

output SND);

wire CLKD; // new clock with freq changed to 25mHz
    wire[9:0] h_count; // from previous modules
    wire[9:0] v_count; // from provious modules
    wire v_trig; // enable for v_counter
    wire video_on; // active area
    wire[9:0] x_loc; // current x
    wire[9:0] y_loc; // cuurent y
    
clock_divider(CLK, CLKD);

simon simon1 (
      .clk   (CLKD),   
      .rst   (RST),
      .ticks_per_milli (25000),
      .btn   ({BTN3, BTN2, BTN1, BTN0}),
      .led   ({LED3, LED2, LED1, LED0}),
      .sound (SND)
  );

h_counter h1(CLKD, h_count, v_trig); // h_counter called
v_counter v1(CLKD, v_trig, v_count); // v_counter called
vga_sync vga1(h_count, v_count, h_sync, v_sync, video_on, x_loc, y_loc); // syncing for VGA output
pixel_gen pix1(CLKD, x_loc, y_loc, LED0, LED1, LED2, LED3, red, green, blue); // adding colors to pixel (x_loc, y_loc)

//testing testing1(LED0,LED1,LED2,LED3,LED4,LED5,LED6,LED7);

endmodule
