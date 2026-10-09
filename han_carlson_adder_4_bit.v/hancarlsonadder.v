
module hancarlsonadder(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

wire [3:0] p, g;
wire [3:0] P, G;
wire c1, c2, c3;


assign p = a ^ b;
assign g = a & b;


assign P[1] = p[1] & p[0];
assign G[1] = g[1] | (p[1] & g[0]);


assign P[3] = p[3] & p[2];
assign G[3] = g[3] | (p[3] & g[2]);


assign c1 = g[0] | (p[0] & cin);
assign c2 = G[1] | (P[1] & cin);
assign c3 = g[2] | (p[2] & c2);
assign cout = G[3] | (P[3] & c2);


assign sum[0] = p[0] ^ cin;
assign sum[1] = p[1] ^ c1;
assign sum[2] = p[2] ^ c2;
assign sum[3] = p[3] ^ c3;

endmodule
