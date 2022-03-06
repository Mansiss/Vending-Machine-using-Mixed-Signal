`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 10:12:46 PM
// Design Name: 
// Module Name: VM_2
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
//i have to addd rst here

module VM_2(clk,rst,cash_in,purchase,prnt_state,nxt_state,cash_return);
input clk,rst ;
input[1:0] cash_in;
output reg purchase;
output reg [1:0]prnt_state,nxt_state,cash_return;

parameter s0=2'b00, s1=2'b01, s2=2'b10;

always@(posedge clk)
begin
if(rst==1)
begin
prnt_state=0;
nxt_state=0;
end
else begin
    case(prnt_state)
    
          s0: if(cash_in==2'b00)
                begin
                  nxt_state=s0;
                  purchase=0;
                  cash_return=0;
                end
                else if(cash_in==2'b01)
                        begin
                            nxt_state=s1;
                              purchase=0;
                               cash_return=0;
                            end
 else if(cash_in==2'b10)
                                         begin
                                              nxt_state=s2;
                                               purchase=0;
                                                cash_return=0;
                                              end

                                              s1: if(cash_in==2'b00)
                                                             begin
                                                              nxt_state=s0;
                                                              purchase=0;
                                                              cash_return=2'b01;
                                                               end
                                                               else if(cash_in==2'b01)
                                                                               begin
                                                                               nxt_state=s2;
                                                                               purchase=0;
                                                                               cash_return=0;
                                                                               end
  else if(cash_in==2'b10)
                                                                                            begin
                                                                                            nxt_state=s0;
                                                                                            purchase=1;
                                                                                            cash_return=0;
                                                                                            end  


s2: if(cash_in==2'b00)
          begin
              nxt_state=s0;
              purchase=0;
               cash_return=2'b10;
            end
else if(cash_in==2'b01)
                         
                   begin
                      nxt_state=s0;
                       purchase=1;
                       cash_return=0;
                     end
else if(cash_in==2'b10)
                               begin
                                 nxt_state=s0;
                                  purchase=1;
                                  cash_return=2'b01;
                                  end  
                           endcase
end
end

endmodule
