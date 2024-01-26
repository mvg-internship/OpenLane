module techmappedNet(
  input in_5182062592,
  input in_5184159744,
  input in_5186256896,
  input in_5188354048,
  output out,
  input clk,
  input reset_n
);

wire out_reg;

sky130_fd_sc_hd__and4_1 sky_and(out_reg, in_5182062592, in_5184159744, in_5186256896, in_5188354048);

sky130_fd_sc_hd__dfrtp_2 _34540_ (
  .CLK(clk),
  .D(out_reg),
  .Q(out),
  .RESET_B(reset_n)
);

endmodule // module techmappedNet
