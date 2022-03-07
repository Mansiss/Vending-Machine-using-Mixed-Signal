\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off LATCH*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off NULLPORT*/  /* verilator lint_off EOFNEWLINE*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  /* verilator lint_off */  

//Your Verilog/System Verilog Code Starts Here:
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


//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  rst;//input
		logic  [1:0] cash_in;//input
		logic  purchase;//output
		logic  prnt_state;//output
		logic  nxt_state;//output
		logic  cash_return;//output
//The $random() can be replaced if user wants to assign values
		assign rst = $random();
		assign cash_in = $random();
		VM_2 VM_2(.clk(clk), .rst(rst), .cash_in(cash_in), .purchase(purchase), .prnt_state(prnt_state), .nxt_state(nxt_state), .cash_return(cash_return));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule

