module nydesign_demo (
  input [37:0] io_in,
  output [37:0] io_out,
  output [37:0] io_oeb
);

  wire [1:0] count;

  assign io_out[13:12] = count;
  assign io_oeb[13:12] = 2'b0;

  //assign clk = io_in[10];
  assign io_oeb[10] = 1'b1;

  //assign rst = io_in[11];
  assign io_oeb[11] = 1'b1;

  assign io_out[11:0] = 12'b0;
  assign io_out[37:14] = 24'b0;

  assign io_oeb[11:0] = 12'b0;
  assign io_oeb[37:14] = 24'b0;

  counter c0(
    .clk(io_in[10]),
    .reset(io_in[11]),
    .count(count)
    );

endmodule	// nydesign_demo

module counter #(
    parameter BITS = 2
)(
    input clk,
    input reset,
    output reg [BITS-1:0] count
);

    always @(posedge clk) 
    begin
        if (reset) 
            count <= 0;
        else  
            count <= count + 1;
    end

endmodule

