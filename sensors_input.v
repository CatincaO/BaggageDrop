`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:33 11/05/2021 
// Design Name: 
// Module Name:    sensors_input 
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
module sensors_input(
      output [7:0] height,
	  input  [7:0] sensor1,
	  input  [7:0] sensor2,
	  input  [7:0] sensor3,
	  input  [7:0] sensor4
    );
reg [9:0] med;
reg [9:0] sum;


always @(*) begin
    if(sensor1 == 0 || sensor3 == 0) begin
	  sum = sensor4 + sensor2;
	  if (sum[0] == 1) begin // se verifica daca suma este impara ( un numar este impar daca are lsb = 1)
	    med = (sum + 1) / 2;
		end else begin
		   med = sum /2;
		end	
    end else if ( sensor2 == 0 || sensor4 == 0) begin
	    sum = sensor1 + sensor3;
		   if(sum[0] == 1) begin //La suma impara adaugam 1 pentru a aproxima media cu o unitate in sus
			med = (sum + 1) /2;
			end else begin
			   med = sum /2;
			end		 
    end else begin
          sum = (sensor1 + sensor2 + sensor3 + sensor4);
         if( sum[0] == 1 ) begin
           med = (sum + 1) /4;
         end else if(  sum[1] == 1 && sum[0] == 0 ) begin //verificam daca un numar nu e divizibil cu 4 ( un numar binar e divizibil cu 4 daca ultimii 2 biti sunt 0)
			  med = (sum + 2) /4;
		 end else begin
              med = sum /4 ;
		 end
	end
end
assign  height = med;
endmodule	  
     	 

	  
	 