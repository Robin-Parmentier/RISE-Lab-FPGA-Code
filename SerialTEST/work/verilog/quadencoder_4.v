/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module quadencoder_4 (
    input clk,
    input rst,
    input a,
    input b,
    output reg [15:0] count
  );
  
  
  
  wire [1-1:0] M_syncA_out;
  reg [1-1:0] M_syncA_in;
  pipeline_11 syncA (
    .clk(clk),
    .in(M_syncA_in),
    .out(M_syncA_out)
  );
  wire [1-1:0] M_syncB_out;
  reg [1-1:0] M_syncB_in;
  pipeline_11 syncB (
    .clk(clk),
    .in(M_syncB_in),
    .out(M_syncB_out)
  );
  wire [1-1:0] M_aRise_out;
  reg [1-1:0] M_aRise_in;
  edge_detector_13 aRise (
    .clk(clk),
    .in(M_aRise_in),
    .out(M_aRise_out)
  );
  wire [1-1:0] M_bRise_out;
  reg [1-1:0] M_bRise_in;
  edge_detector_13 bRise (
    .clk(clk),
    .in(M_bRise_in),
    .out(M_bRise_out)
  );
  wire [1-1:0] M_aFall_out;
  reg [1-1:0] M_aFall_in;
  edge_detector_15 aFall (
    .clk(clk),
    .in(M_aFall_in),
    .out(M_aFall_out)
  );
  wire [1-1:0] M_bFall_out;
  reg [1-1:0] M_bFall_in;
  edge_detector_15 bFall (
    .clk(clk),
    .in(M_bFall_in),
    .out(M_bFall_out)
  );
  reg [15:0] M_ctr_d, M_ctr_q = 1'h0;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    M_syncA_in = a;
    M_syncB_in = b;
    M_aRise_in = M_syncA_out;
    M_bRise_in = M_syncB_out;
    M_aFall_in = M_syncA_out;
    M_bFall_in = M_syncB_out;
    count = M_ctr_q;
    if (M_aRise_out) begin
      if (b) begin
        M_ctr_d = M_ctr_q - 1'h1;
      end else begin
        M_ctr_d = M_ctr_q + 1'h1;
      end
    end
    if (M_aFall_out) begin
      if (b) begin
        M_ctr_d = M_ctr_q + 1'h1;
      end else begin
        M_ctr_d = M_ctr_q - 1'h1;
      end
    end
    if (M_bRise_out) begin
      if (a) begin
        M_ctr_d = M_ctr_q + 1'h1;
      end else begin
        M_ctr_d = M_ctr_q - 1'h1;
      end
    end
    if (M_bFall_out) begin
      if (a) begin
        M_ctr_d = M_ctr_q - 1'h1;
      end else begin
        M_ctr_d = M_ctr_q + 1'h1;
      end
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_ctr_q <= 1'h0;
    end else begin
      M_ctr_q <= M_ctr_d;
    end
  end
  
endmodule
