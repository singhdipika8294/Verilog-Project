
module carryselectadder(
    input  [3:0] a,
    input  [3:0] b,
    input        cin,
    output [3:0] sum,
    output       cout
);

wire [3:0] sum0, sum1;
wire cout0, cout1;

// Lower 2-bit block
wire [2:0] low;
assign low = {1'b0, a[1:0]} + {1'b0, b[1:0]} + cin;

// Upper block: calculate both carry possibilities
assign {cout0, sum0[1:0]} = {1'b0, a[3:2]} + {1'b0, b[3:2]};
assign {cout1, sum1[1:0]} = {1'b0, a[3:2]} + {1'b0, b[3:2]} + 1'b1;

// Select the upper result using the lower carry
assign sum[1:0] = low[1:0];
assign sum[3:2] = low[2] ? sum1[1:0] : sum0[1:0];
assign cout = low[2] ? cout1 : cout0;

endmodule
