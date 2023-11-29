`timescale 1ns / 1ps

module pixel_gen(
    input clk_d,         // Pixel clock, ranging from 100mHz to 25mHz
    input [9:0] pixel_x, // Current x location for generating pixel color
    input [9:0] pixel_y, // Current y location for generating pixel color
    input LED0, 
    input LED1, 
    input LED2, 
    input LED3,
    output reg [3:0] red = 0,    // Output for the amount of red in the pixel
    output reg [3:0] green = 0, // Output for the amount of green in the pixel
    output reg [3:0] blue = 0    // Output for the amount of blue in the pixel
);

reg [2:0] color_select; // 2-bit signal to select color

// New logic for drawing colored boxes in a straight line
always @(posedge clk_d) begin
    if ((pixel_x >= 116 && pixel_x <= 174) && (pixel_y >= 192 && pixel_y <= 288)) begin
        // Blue rectangle
        color_select <= 3'b000;
    end else if ((pixel_x >= 232 && pixel_x <= 290) && (pixel_y >= 192 && pixel_y <= 288)) begin
        // Green rectangle
        color_select <= 3'b001;
    end else if ((pixel_x >= 348 && pixel_x <= 406) && (pixel_y >= 192 && pixel_y <= 288)) begin
        // Yellow rectangle
        color_select <= 3'b010;
    end else if ((pixel_x >= 464 && pixel_x <= 522) && (pixel_y >= 192 && pixel_y <= 288)) begin
        // Red rectangle
        color_select <= 3'b011;
    end
    else begin
        // Default: White outside rectangles
        color_select <= 3'b100;
    end

    // Assign colors based on color_select
    case (color_select)
        3'b000: begin // Blue
            case (LED0)
                1'b0: begin
                    red <= 4'h0;
                    green <= 4'h0;
                    blue <= 4'h2;
                end
                1'b1: begin
                    red <= 4'h0;
                    green <= 4'h0;
                    blue <= 4'hF;
                end
            endcase                
        end
        3'b001: begin // Green
            case (LED1)
                1'b0: begin
                    red <= 4'h0;
                    green <= 4'h2;
                    blue <= 4'h0;
                end
                1'b1: begin
                    red <= 4'h0;
                    green <= 4'hF;
                    blue <= 4'h0;
                end
            endcase
        end
        3'b010: begin // Yellow
            case (LED2)
                1'b0: begin
                    red <= 4'h2;
                    green <= 4'h2;
                    blue <= 4'h0;
                end
                1'b1: begin
                    red <= 4'hF;
                    green <= 4'hF;
                    blue <= 4'h0;
                end
            endcase
        end
        3'b011: begin // Red
            case (LED3)
                1'b0: begin
                    red <= 4'h2;
                    green <= 4'h0;
                    blue <= 4'h0;
                end
                1'b1: begin
                    red <= 4'hF;
                    green <= 4'h0;
                    blue <= 4'h0;
                end
            endcase
        end
        3'b100: begin // Black (default)
            red <= 4'h0;
            green <= 4'h0;
            blue <= 4'h0;
        end
    endcase
end

endmodule
