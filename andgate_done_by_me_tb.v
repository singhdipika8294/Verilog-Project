module testbench;
reg a, b;
wire y;
andgate uut (
    .a(a),
    .b(b),
    .y(y)
);
initial begin 
    $dumpfile("andgate.vcd");
    $dumpvars(0, testbench);
    a=0; b=0; #10;
    a=0; b=1; #10;
    a=1; b=0; #10;
    a=1; b=1; #10; 
    $finish;

end
endmodule
