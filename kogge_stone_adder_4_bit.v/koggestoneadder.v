
module koggestoneadder(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

wire [3:0] p, g;


wire [3:0] p1, g1;


wire [3:0] p2, g2;


assign p = a ^ b;
assign g = a & b;


assign p1[0] = p[0];
assign g1[0] = g[0];

assign p1[1] = p[1] & p[0];
assign g1[1] = g[1] | (p[1] & g[0]);

assign p1[2] = p[2] & p[1];
assign g1[2] = g[2] | (p[2] & g[1]);

assign p1[3] = p[3] & p[2];
assign g1[3] = g[3] | (p[3] & g[2]);


assign p2[0] = p1[0];
assign g2[0] = g1[0];

assign p2[1] = p1[1];
assign g2[1] = g1[1];

assign p2[2] = p1[2] & p1[0];
assign g2[2] = g1[2] | (p1[2] & g1[0]);

assign p2[3] = p1[3] & p1[1];
assign g2[3] = g1[3] | (p1[3] & g1[1]);


wire c1, c2, c3;

assign c1 = g[0] | (p[0] & cin);
assign c2 = g2[1] | (p2[1] & cin);
assign c3 = g2[2] | (p2[2] & cin);
assign cout = g2[3] | (p2[3] & cin);


assign sum[0] = p[0] ^ cin;
assign sum[1] = p[1] ^ c1;
assign sum[2] = p[2] ^ c2;
assign sum[3] = p[3] ^ c3;

endmodule
