/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     CPOL = 0
     CPHA = 0
*/
module spi_slave_8 (
    input clk,
    input rst,
    input ss,
    input mosi,
    output reg miso,
    input sck,
    output reg done,
    input [7:0] data_in,
    output reg [7:0] data_out
  );
  
  localparam CPOL = 1'h0;
  localparam CPHA = 1'h0;
  
  
  reg [2:0] M_bit_ct_d, M_bit_ct_q = 1'h0;
  reg [7:0] M_data_d, M_data_q = 1'h0;
  reg M_mosi_reg_d, M_mosi_reg_q = 1'h0;
  reg M_miso_reg_d, M_miso_reg_q = 1'h0;
  reg [1:0] M_sck_reg_d, M_sck_reg_q = 1'h0;
  reg M_ss_reg_d, M_ss_reg_q = 1'h0;
  reg [7:0] M_data_out_reg_d, M_data_out_reg_q = 1'h0;
  reg M_done_reg_d, M_done_reg_q = 1'h0;
  
  always @* begin
    M_sck_reg_d = M_sck_reg_q;
    M_mosi_reg_d = M_mosi_reg_q;
    M_done_reg_d = M_done_reg_q;
    M_ss_reg_d = M_ss_reg_q;
    M_data_d = M_data_q;
    M_bit_ct_d = M_bit_ct_q;
    M_data_out_reg_d = M_data_out_reg_q;
    M_miso_reg_d = M_miso_reg_q;
    
    miso = M_miso_reg_q;
    done = M_done_reg_q;
    data_out = M_data_out_reg_q;
    M_ss_reg_d = ss;
    M_mosi_reg_d = mosi;
    M_sck_reg_d = {M_sck_reg_q[0+0-:1], sck};
    M_done_reg_d = 1'h0;
    if (M_ss_reg_q) begin
      M_bit_ct_d = 3'h7;
      M_data_d = data_in;
      M_miso_reg_d = data_in[7+0-:1];
    end else begin
      if (M_sck_reg_q == 2'h1) begin
        M_data_out_reg_d[(M_bit_ct_q)*1+0-:1] = M_mosi_reg_q;
        M_bit_ct_d = M_bit_ct_q - 1'h1;
        if (M_bit_ct_q == 1'h0) begin
          M_done_reg_d = 1'h1;
          M_data_d = data_in;
        end
      end else begin
        if (M_sck_reg_q == 2'h2) begin
          M_miso_reg_d = M_data_q[(M_bit_ct_q)*1+0-:1];
        end
      end
    end
  end
  
  always @(posedge clk) begin
    M_mosi_reg_q <= M_mosi_reg_d;
    M_miso_reg_q <= M_miso_reg_d;
    M_sck_reg_q <= M_sck_reg_d;
    M_ss_reg_q <= M_ss_reg_d;
    M_data_out_reg_q <= M_data_out_reg_d;
    M_done_reg_q <= M_done_reg_d;
    
    if (rst == 1'b1) begin
      M_bit_ct_q <= 1'h0;
      M_data_q <= 1'h0;
    end else begin
      M_bit_ct_q <= M_bit_ct_d;
      M_data_q <= M_data_d;
    end
  end
  
endmodule
