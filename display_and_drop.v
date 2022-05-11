`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:04:17 11/06/2021 
// Design Name: 
// Module Name:    display_and_drop 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module display_and_drop(
      output [6:0] seven_seg1,
	  output [6:0] seven_seg2,
	  output [6:0] seven_seg3,
	  output [6:0] seven_seg4,
	  output [0:0] drop_activated,
	  input  [15:0] t_act,
	  input  [15:0] t_lim,
	  input         drop_en
    );
reg [6:0] sv1;
reg [6:0] sv2;
reg [6:0] sv3;
reg [6:0] sv4;
reg [0:0] drop_a;	 
always@(*) begin
    if( drop_en == 1 && t_act > t_lim  ) begin //Formam mesajul HOT
	    sv1 = 7'b0000000; 
		sv2 = 7'b1110110;
		sv3 = 7'b1011100;
		sv4 = 7'b1111000;
		drop_a =1'b0;
		
	end else if (	drop_en == 0 && t_act <= t_lim  ) begin //Formam mesajul COLD
	    sv1 = 7'b0111001;
		sv2 = 7'b1011100;
		sv3 = 7'b0111000;
		sv4 = 7'b1011110;
		drop_a = 1'b0;
		
	end else if (	drop_en == 1 && t_act <= t_lim ) begin //Formam mesajul DROP
	    sv1 = 7'b1011110;
		sv2 = 7'b1010000;
		sv3 = 7'b1011100;
		sv4 = 7'b1110011;
		drop_a = 1'b1;
		
	end
end	
assign seven_seg1 = sv1;
assign seven_seg2 = sv2;
assign seven_seg3 = sv3;
assign seven_seg4 = sv4;
assign drop_activated = drop_a;
	
endmodule
	


      	 
