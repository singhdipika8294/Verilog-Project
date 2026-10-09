
module testbench;

reg [3:0] a, b;
reg cin;
wire [3:0] sum;
wire cout;

koggestoneadder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, testbench);

    $monitor("Time=%0t | a=%b | b=%b | cin=%b | sum=%b | cout=%b",
             $time, a, b, cin, sum, cout);

    a = 4'b0000; b = 4'b0000; cin = 0; #10;
    a = 4'b1111; b = 4'b0001; cin = 0; #10;
    a = 4'b1010; b = 4'b0101; cin = 0; #10;
    a = 4'b0110; b = 4'b0011; cin = 1; #10;
    a = 4'b1001; b = 4'b0110; cin = 0; #10;

    $finish;
end

endmodule
