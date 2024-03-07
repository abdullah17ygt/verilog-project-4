module top(
input wire clk,
input wire [63:0] x,
input wire [63:0] y,
output [127:0]out
    );
    
    
  wire [63:0] x1y1, x1yr,xry1,xryr,out_x1y1,out_xry1,out_x1yr,out_xryr;
  wire [127:0] fout;
   
   karatsuba    s1 (.X(x[63:32]), .Y(y[63:32]), .out (x1y1));
   karatsuba    s2 (.X(x[63:32]), .Y(y[31:0]), .out (x1yr));
   karatsuba    s3 (.X(x[31:0]), .Y(y[63:32]), .out (xry1));
   karatsuba    s4 (.X(x[31:0]), .Y(y[31:0]), .out (xryr));
   
   dff          s5 (.clk(clk), .D(x1y1), .Q(out_x1y1));
   dff          s6 (.clk(clk), .D(x1yr), .Q(out_x1yr));
   dff          s7 (.clk(clk), .D(xry1), .Q(out_xry1));
   dff          s8 (.clk(clk), .D(xryr), .Q(out_xryr));
   
   assign fout = (32'd4294967296)*out_x1y1 + (16'd65536)*((out_x1yr)+(out_xry1))+out_xryr;
   
   dff          s9 (.clk(clk), .D(fout), .Q(out));
    
endmodule

