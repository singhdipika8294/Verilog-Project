module testbench;
reg a, b;
wire y;
orgate uut(
    .a(a),
    .b(b),
    .y(y)
);
initial begin
    $dumpfile("orgate.vcd");
    $dumpvars(0, testbench);
    $monitor("Time=%0t a=%b b=%b y=%b",$time,a,b,y); 
    a=0; b=0; #10;
    a=1; b=0; #10;
    a=0; b=1; #10;
    a=1; b=1; #10;
    $finish
end
endmodule