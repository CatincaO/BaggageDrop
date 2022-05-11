`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:14 11/05/2021 
// Design Name: 
// Module Name:    square_root 
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

module square_root(
     output [15:0] out,
	  input  [7:0]  in
    );
parameter dim = 32;
reg [15:0] rad;
reg [dim-1:0] aux;	 

always @(*) begin
    aux [dim-1:dim-9]  = 0 ;
	 aux [dim-9:dim-16] = in ;
	 aux [dim-17:0]     = 0;
	 rad [15:0]         = 0;
	 
    if( aux[dim-1:dim-2] < 2'b10 )begin
	   rad[15] = 0;
	 end else begin
	   rad[15] = 1;
	 end
	 
	 if( aux[dim-1:dim-4] < ({rad[15:15],1'b1}*{rad[15:15],1'b1})) begin
	    rad[14] = 0;
	 end else begin
       rad[14] = 1;
    end
	 
	 if( aux[dim-1:dim-6] < ({rad[15:14],1'b1}*{rad[15:14],1'b1})) begin
	    rad[13] = 0;
	 end else begin
       rad[13] = 1;
    end
	 
	 if( aux[dim-1:dim-8] < ({rad[15:13],1'b1}*{rad[15:13],1'b1})) begin
	    rad[12] = 0;
	 end else begin
       rad[12] = 1;
    end
	 
	  if( aux[dim-1:dim-10] < ({rad[15:12],1'b1}*{rad[15:12],1'b1})) begin
	    rad[11] = 0;
	 end else begin
       rad[11] = 1;
    end
	 
	  if( aux[dim-1:dim-12] < ({rad[15:11],1'b1}*{rad[15:11],1'b1})) begin
	    rad[10] = 0;
	 end else begin
       rad[10] = 1;
    end
	 
	  if( aux[dim-1:dim-14] < ({rad[15:10],1'b1}*{rad[15:10],1'b1})) begin
	    rad[9] = 0;
	 end else begin
       rad[9] = 1;
    end
	 
	  if( aux[dim-1:dim-16] < ({rad[15:9],1'b1}*{rad[15:9],1'b1})) begin
	    rad[8] = 0;
	 end else begin
       rad[8] = 1;
    end
	 
	 if( aux[dim-1:dim-18] < ({rad[15:8],1'b1}*{rad[15:8],1'b1})) begin
	    rad[7] = 0;
	 end else begin
       rad[7] = 1;
    end
	 
	 if( aux[dim-1:dim-20] < ({rad[15:7],1'b1}*{rad[15:7],1'b1})) begin
	    rad[6] = 0;
	 end else begin
       rad[6] = 1;
    end
	 
	 if( aux[dim-1:dim-22] < ({rad[15:6],1'b1}*{rad[15:6],1'b1})) begin
	    rad[5] = 0;
	 end else begin
       rad[5] = 1;
    end
	 
	 if( aux[dim-1:dim-24] < ({rad[15:5],1'b1}*{rad[15:5],1'b1})) begin
	    rad[4] = 0;
	 end else begin
       rad[4] = 1;
    end
	 
	  if( aux[dim-1:dim-26] < ({rad[15:4],1'b1}*{rad[15:4],1'b1})) begin
	    rad[3] = 0;
	 end else begin
       rad[3] = 1;
    end
	 
	  if( aux[dim-1:dim-28] < ({rad[15:3],1'b1}*{rad[15:3],1'b1})) begin
	    rad[2] = 0;
	 end else begin
       rad[2] = 1;
    end
	 
	 if( aux[dim-1:dim-30] < ({rad[15:2],1'b1}*{rad[15:2],1'b1})) begin
	    rad[1] = 0;
	 end else begin
       rad[1] = 1;
    end
	 
	 if( aux[dim-1:dim-32] < ({rad[15:1],1'b1}*{rad[15:1],1'b1})) begin
	    rad[0] = 0;
	 end else begin
       rad[0] = 1;
    end
	 
end

  assign out = rad;
endmodule  
	 
	   
	    




