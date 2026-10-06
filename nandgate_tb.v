module testbench;
    reg a, b;
    wire y;

    // Instantiate the nandgate module
    nandgate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("nandgate.vcd");
        $dumpvars(0, testbench); 
        // Test cases
        a = 0; b = 0; #10;
        $display("a=%b, b=%b, y=%b", a, b, y); // Expected y=0

        a = 0; b = 1; #10;
        $display("a=%b, b=%b, y=%b", a, b, y); // Expected y=1

        a = 1; b = 0; #10;
        $display("a=%b, b=%b, y=%b", a, b, y); // Expected y=1

        a = 1; b = 1; #10;
        $display("a=%b, b=%b, y=%b", a, b, y); // Expected y=0

        $finish;
    end     
endmodule