
module carryskipadder(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

wire [3:0] p, g;
wire c1, c2, c3;
wire carry_ripple;
wire skip;

// Propagate and generate
assign p = a ^ b;
assign g = a & b;

// Ripple carry calculation
assign c1 = g[0] | (p[0] & cin);
assign c2 = g[1] | (p[1] & c1);
assign c3 = g[2] | (p[2] & c2);

assign sum[0] = p[0] ^ cin;
assign sum[1] = p[1] ^ c1;
assign sum[2] = p[2] ^ c2;

assign carry_ripple = g[3] | (p[3] & c3);
assign sum[3] = p[3] ^ c3;

// Carry skip logic
assign skip = &p;
assign cout = skip ? cin : carry_ripple;

endmodule
