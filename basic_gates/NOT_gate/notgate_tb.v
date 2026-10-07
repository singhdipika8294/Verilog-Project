module testbench;
reg a;
wire y;
notgate uut(a,y);
initial begin
    $dumpfile("notgate.vcd");
    $dumpvars(0, testbench);
    $monitor("Time=%0t a=%b y=%b",$time,a,y);
    a=0; #10;
    a=1; #10;
    $finish;
end
endmodule
