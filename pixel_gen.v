`timescale 1ns / 1ps

module pixel_gen(
    input clk_d,         // Pixel clock, ranging from 100mHz to 25mHz
    input [9:0] pixel_x, // Current x location for generating pixel color
    input [9:0] pixel_y, // Current y location for generating pixel color
    input LED0, 
    input LED1, 
    input LED2, 
    input LED3,
    input [2:0] state,
    output reg [3:0] red = 0,    // Output for the amount of red in the pixel
    output reg [3:0] green = 0, // Output for the amount of green in the pixel
    output reg [3:0] blue = 0  // Output for the amount of blue in the pixel
);

// states: 0, 2 and 7
//reg [2:0] color_select; // 2-bit signal to select color

always @(posedge clk_d) begin

    case (state)
        // game start screen
        3'b000: begin
            if ((pixel_x > 640)|| (pixel_x < 0) || (pixel_y > 480) || (pixel_y <0))
                begin
                red <= 4'h0;    
                green <= 4'h0;    
                blue <= 4'h0;    
                end
           else if (
                // G
               ( pixel_x>=119 && pixel_x<=210 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=119 && pixel_x<=139 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=119 && pixel_x<=210 && pixel_y>=210 && pixel_y<=230 )||
               ( pixel_x>=190 && pixel_x<=210 && pixel_y>=160 && pixel_y<=230 )||
               ( pixel_x>=169 && pixel_x<=210 && pixel_y>=160 && pixel_y<=180 )|| 
                // A
               ( pixel_x>=219 && pixel_x<=310 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=219 && pixel_x<=239 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=290 && pixel_x<=310 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=219 && pixel_x<=310 && pixel_y>=170 && pixel_y<=190 )||
               // M
               ( pixel_x>=319 && pixel_x<=410 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=319 && pixel_x<=339 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=354 && pixel_x<=374 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=390 && pixel_x<=410 && pixel_y>=130 && pixel_y<=230 )||
               // E
               ( pixel_x>=419 && pixel_x<=510 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=419 && pixel_x<=439 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=419 && pixel_x<=469 && pixel_y>=170 && pixel_y<=190 )||
               ( pixel_x>=419 && pixel_x<=510 && pixel_y>=210 && pixel_y<=230 )||
               // B
               ( pixel_x>=109 && pixel_x<=200 && pixel_y>=250 && pixel_y<=270 )||
               ( pixel_x>=109 && pixel_x<=200 && pixel_y>=290 && pixel_y<=310 )||
               ( pixel_x>=109 && pixel_x<=129 && pixel_y>=250 && pixel_y<=350 )||
               ( pixel_x>=109 && pixel_x<=200 && pixel_y>=330 && pixel_y<=350 )||
               ( pixel_x>=190 && pixel_x<=200 && pixel_y>=250 && pixel_y<=350 )||
               // E
               ( pixel_x>=209 && pixel_x<=300 && pixel_y>=250 && pixel_y<=270 )||
               ( pixel_x>=209 && pixel_x<=259 && pixel_y>=290 && pixel_y<=310 )||
               ( pixel_x>=209 && pixel_x<=300 && pixel_y>=330 && pixel_y<=350 )||
               ( pixel_x>=209 && pixel_x<=219 && pixel_y>=250 && pixel_y<=350 )||
               // G
               ( pixel_x>=309 && pixel_x<=400 && pixel_y>=250 && pixel_y<=270 )||
               ( pixel_x>=309 && pixel_x<=329 && pixel_y>=250 && pixel_y<=350 )||
               ( pixel_x>=309 && pixel_x<=400 && pixel_y>=330 && pixel_y<=350 )||
               ( pixel_x>=380 && pixel_x<=400 && pixel_y>=280 && pixel_y<=350 )||  
               ( pixel_x>=359 && pixel_x<=400 && pixel_y>=280 && pixel_y<=300 )||
               // I
               ( pixel_x>=409 && pixel_x<=429 && pixel_y>=250 && pixel_y<=350 )||
               // N
               ( pixel_x>=439 && pixel_x<=459 && pixel_y>=250 && pixel_y<=350 )||
               ( pixel_x>=439 && pixel_x<=530 && pixel_y>=250 && pixel_y<=270 )||
               ( pixel_x>=510 && pixel_x<=530 && pixel_y>=250 && pixel_y<=350 )
           )
           begin 
            red <= 4'h0;    
            green <= 4'hF;    
            blue <= 4'hF; 
           end
           else
            begin            
                red <= 4'hF; 
                blue <= 4'hF; 
                green <= 4'hF; 
            end   
         end
         
         
        // game end screen
        3'b111: begin 
            if ((pixel_x > 640)|| (pixel_x < 0) || (pixel_y > 480) || (pixel_y <0))
                begin
                red <= 4'h0;    
                green <= 4'h0;    
                blue <= 4'h0;    
                end
           else if (
                // G
               ( pixel_x>=119 && pixel_x<=210 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=119 && pixel_x<=139 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=119 && pixel_x<=210 && pixel_y>=210 && pixel_y<=230 )||
               ( pixel_x>=190 && pixel_x<=210 && pixel_y>=160 && pixel_y<=230 )||
               ( pixel_x>=169 && pixel_x<=210 && pixel_y>=160 && pixel_y<=180 )|| 
                // A
               ( pixel_x>=219 && pixel_x<=310 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=219 && pixel_x<=239 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=290 && pixel_x<=310 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=219 && pixel_x<=310 && pixel_y>=170 && pixel_y<=190 )||
               // M
               ( pixel_x>=319 && pixel_x<=410 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=319 && pixel_x<=339 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=354 && pixel_x<=374 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=390 && pixel_x<=410 && pixel_y>=130 && pixel_y<=230 )||
               // E
               ( pixel_x>=419 && pixel_x<=510 && pixel_y>=130 && pixel_y<=150 )||
               ( pixel_x>=419 && pixel_x<=439 && pixel_y>=130 && pixel_y<=230 )||
               ( pixel_x>=419 && pixel_x<=469 && pixel_y>=170 && pixel_y<=190 )||
               (pixel_x>=419 && pixel_x<=510 && pixel_y>=210 && pixel_y<=230  )||
               // E
               ( pixel_x>=119+50 && pixel_x<=210+50 && pixel_y>=250 && pixel_y<=270 )||
               ( pixel_x>=119+50 && pixel_x<=139+50 && pixel_y>=250 && pixel_y<=350 )||
               ( pixel_x>=119+50 && pixel_x<=169+50 && pixel_y>=290 && pixel_y<=310 )||
               ( pixel_x>=119+50 && pixel_x<=210+50 && pixel_y>=330 && pixel_y<=350 )||
               // N
               ( pixel_x>=219+50 && pixel_x<=310+50 && pixel_y>=250 && pixel_y<=270 )||
               ( pixel_x>=219+50 && pixel_x<=239+50 && pixel_y>=250 && pixel_y<=350 )||
               ( pixel_x>=290+50 && pixel_x<=310+50 && pixel_y>=250 && pixel_y<=350 )||
               // D
               ( pixel_x>=319+50 && pixel_x<=410+50 && pixel_y>=250 && pixel_y<=270 )||
               ( pixel_x>=319+50 && pixel_x<=339+50 && pixel_y>=250 && pixel_y<=350 )|
               ( pixel_x>=319+50 && pixel_x<=410+50 && pixel_y>=320 && pixel_y<=350 ) ||
               ( pixel_x>=390+50 && pixel_x<=410+50 && pixel_y>=250 && pixel_y<=350 )           
           )
           begin 
            red <= 4'hF;    
            green <= 4'h0;    
            blue <= 4'h0; 
           end
           else
            begin            
                red <= 4'hF; 
                blue <= 4'hF; 
                green <= 4'hF; 
            end 
        end
        
        
        // game working screens 
        default: begin
                if ((pixel_x > 640)|| (pixel_x < 0) || (pixel_y > 480) || (pixel_y <0))
                        begin
                        red <= 4'h0;    
                        green <= 4'h0;    
                        blue <= 4'h0;    
                        end
               else if (
                // S
               ( pixel_x>=119 && pixel_x<=210 && pixel_y>=46 && pixel_y<=66 )||
               ( pixel_x>=119 && pixel_x<=139 && pixel_y>=46 && pixel_y<=106 )||
               ( pixel_x>=119 && pixel_x<=210 && pixel_y>=86 && pixel_y<=106 )||
               ( pixel_x>=190 && pixel_x<=210 && pixel_y>=76+30 && pixel_y<=116+30 )||
               ( pixel_x>=119 && pixel_x<=210 && pixel_y>=96+30 && pixel_y<=116+30 ))
               begin 
                    red <= 4'hF; 
                    blue <= 4'h0; 
                    green <= 4'h0;
               end
               // I
               else if ( pixel_x>=219 && pixel_x<=239 && pixel_y>=46 && pixel_y<=146 )
               begin 
                    red <= 4'h0; 
                    blue <= 4'hF; 
                    green <= 4'h0;
               end
                // M
               else if (( pixel_x>=249 && pixel_x<=269 && pixel_y>=46 && pixel_y<=146 )||
               ( pixel_x>=249 && pixel_x<=339 && pixel_y>=46 && pixel_y<=76 )||
               ( pixel_x>=284 && pixel_x<=304 && pixel_y>=46 && pixel_y<=146 )||
               ( pixel_x>=319 && pixel_x<=339 && pixel_y>=46 && pixel_y<=146 ))
               begin 
                    red <= 4'h0; 
                    blue <= 4'hF; 
                    green <= 4'hF;
               end
               // O
               else if (( pixel_x>=349 && pixel_x<=440 && pixel_y>=46 && pixel_y<=76 )||
               ( pixel_x>=349 && pixel_x<=369 && pixel_y>=46 && pixel_y<=146 )||
               ( pixel_x>=349 && pixel_x<=440 && pixel_y>=126 && pixel_y<=146 )||
               ( pixel_x>=420 && pixel_x<=440 && pixel_y>=46 && pixel_y<=146 ))
               begin 
                    red <= 4'h0; 
                    blue <= 4'h0; 
                    green <= 4'hF;
               end
               // N
               else if (( pixel_x>=449 && pixel_x<=540 && pixel_y>=46 && pixel_y<=76 )||
               ( pixel_x>=449 && pixel_x<=469 && pixel_y>=46 && pixel_y<=146 )||
               ( pixel_x>=520 && pixel_x<=540 && pixel_y>=46 && pixel_y<=146 ))
               begin 
                    red <= 4'hF; 
                    blue <= 4'h0; 
                    green <= 4'hF;
               end
               // S
               else if (( pixel_x>=120 && pixel_x<=211 && pixel_y>=334 && pixel_y<=354 )||
               ( pixel_x>=120 && pixel_x<=140 && pixel_y>=334 && pixel_y<=394 )||
               ( pixel_x>=120 && pixel_x<=211 && pixel_y>=374 && pixel_y<=394 )||
               ( pixel_x>=191 && pixel_x<=211 && pixel_y>=364+30 && pixel_y<=404+30 )||
               ( pixel_x>=120 && pixel_x<=211 && pixel_y>=384+30 && pixel_y<=404+30 ))
               begin 
                    red <= 4'hF; 
                    blue <= 4'hF; 
                    green <= 4'h0;
               end
                // A
               else if (( pixel_x>=220 && pixel_x<=311 && pixel_y>=334 && pixel_y<=366 )||
               ( pixel_x>=220 && pixel_x<=250-10 && pixel_y>=334 && pixel_y<=434 )||
               ( pixel_x>=291 && pixel_x<=311 && pixel_y>=334 && pixel_y<=434 )||
               ( pixel_x>=220 && pixel_x<=311 && pixel_y>=384 && pixel_y<=414 ))
               begin 
                    red <= 4'hF; 
                    blue <= 4'h0; 
                    green <= 4'h6;
               end
                // Y
               else if (( pixel_x>=320 && pixel_x<=340 && pixel_y>=334 && pixel_y<=384 )||
               ( pixel_x>=320 && pixel_x<=411 && pixel_y>=354+10 && pixel_y<=384 )||
               ( pixel_x>=391 && pixel_x<=411 && pixel_y>=354-20 && pixel_y<=384 )||
               ( pixel_x>=356 && pixel_x<=380 && pixel_y>=384 && pixel_y<=434 ))
               begin 
                    red <= 4'h6; 
                    blue <= 4'hF; 
                    green <= 4'h0;
               end
               // S
               else if (( pixel_x>=420 && pixel_x<=511 && pixel_y>=334 && pixel_y<=354 )||
               ( pixel_x>=420 && pixel_x<=440 && pixel_y>=334 && pixel_y<=394 )||
               ( pixel_x>=420 && pixel_x<=511 && pixel_y>=374 && pixel_y<=394 )||
               ( pixel_x>=491 && pixel_x<=511 && pixel_y>=364+30 && pixel_y<=404+30 )||
               ( pixel_x>=420 && pixel_x<=511 && pixel_y>=384+30 && pixel_y<=404+30 ))
                begin
                    red <= 4'hF; 
                    blue <= 4'h0; 
                    green <= 4'h3;
               end else if ((pixel_x >= 116 && pixel_x <= 174) && (pixel_y >= 192 && pixel_y <= 288)) begin
                    // Blue rectangle
//                    color_select <= 3'b000;
                    case (LED0)
                            1'b0: begin
                                red <= 4'h0;
                                green <= 4'h0;
                                blue <= 4'h6;
                            end
                            1'b1: begin
                                red <= 4'h0;
                                green <= 4'h0;
                                blue <= 4'hF;
                            end
                        endcase
                end else if ((pixel_x >= 232 && pixel_x <= 290) && (pixel_y >= 192 && pixel_y <= 288)) begin
                    // Green rectangle
//                    color_select <= 3'b001;
                    case (LED1)
                            1'b0: begin
                                red <= 4'h0;
                                green <= 4'h6;
                                blue <= 4'h0;
                            end
                            1'b1: begin
                                red <= 4'h0;
                                green <= 4'hF;
                                blue <= 4'h0;
                            end
                        endcase
                end else if ((pixel_x >= 348 && pixel_x <= 406) && (pixel_y >= 192 && pixel_y <= 288)) begin
                    // Yellow rectangle
//                    color_select <= 3'b010;
                    case (LED2)
                            1'b0: begin
                                red <= 4'h6;
                                green <= 4'h6;
                                blue <= 4'h0;
                            end
                            1'b1: begin
                                red <= 4'hF;
                                green <= 4'hF;
                                blue <= 4'h0;
                            end
                        endcase
                end else if ((pixel_x >= 464 && pixel_x <= 522) && (pixel_y >= 192 && pixel_y <= 288)) begin
                    // Red rectangle
//                    color_select <= 3'b011;
                    case (LED3)
                            1'b0: begin
                                red <= 4'h6;
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
                else begin
                    // Default: White outside rectangles
//                    color_select <= 3'b100;
          
                    red <= 4'hF;
                    green <= 4'hF;
                    blue <= 4'hF; 
                end
            end
    endcase    
end
endmodule