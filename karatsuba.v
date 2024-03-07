module karatsuba(
input wire [31:0]X,
input  wire [31:0] Y,
output wire [63:0] out
    );
    
    assign out = X*Y;
    
endmodule
