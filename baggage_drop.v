`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:00:53 11/06/2021 
// Design Name: 
// Module Name:    baggage_drop 
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
module prelucrare (
      output  [15:0] o,
	  input   [15:0] i
	);       
 assign o = i/2;
endmodule

module baggage_drop(
    output   [6 : 0]   seven_seg1, 
    output   [6 : 0]   seven_seg2,
    output   [6 : 0]   seven_seg3,
    output   [6 : 0]   seven_seg4,
    output   [0 : 0]   drop_activated,
    input    [7 : 0]   sensor1,
    input    [7 : 0]   sensor2,
    input    [7 : 0]   sensor3,
    input    [7 : 0]   sensor4,
    input    [15: 0]   t_lim,
    input              drop_en
    );
 wire [7:0] fir1; //output ul din primul modul (sensors_input)
 wire [7:0] fir2; // input ul celui de al doilea modul (square_root)
 wire [15:0] fir3; // output ul celui de al treilea modul 
 wire [15:0] fir4; // outpu tul dupa modelarea extra pt a scoate formula din enunt
 wire [15:0] fir5; // input ul din ultimul modul
 
 sensors_input s(fir1, sensor1, sensor2, sensor3, sensor4 );
 square_root rad(fir3, fir2);
 //assign fir4 = fir3 /2; //pentru cazul in care nu am fi facut formula in afara modului.
 prelucrare p(fir4, fir3);
 display_and_drop d( seven_seg1, seven_seg2, seven_seg3, seven_seg4, drop_activated,fir5, t_lim, drop_en) ;
 assign fir2 = fir1; //se conecteaza primul modul cu cel de al doilea
 assign fir5 = fir4; //se conecteaza al treilea modul cu al doilea
 
endmodule
