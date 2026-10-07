module orgate_tb;
    reg a;
    reg b;
    wire y;

    orgate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin 
        $dumpfile("orgate.vcd");
        $dumpvars(0, orgate_tb);
        // Test case 1: a=0, b=0
        a = 0; b = 0;
        #10; // Wait for 10 time units
        $display("Test case 1: a=%b, b=%b, y=%b", a, b, y);

        // Test case 2: a=0, b=1
        a = 0; b = 1;
        #10; // Wait for 10 time units
        $display("Test case 2: a=%b, b=%b, y=%b", a, b, y);

        // Test case 3: a=1, b=0
        a = 1; b = 0;
        #10; // Wait for 10 time units
        $display("Test case 3: a=%b, b=%b, y=%b", a, b, y);

        // Test case 4: a=1, b=1
        a = 1; b = 1;
        #10; // Wait for 10 time units
        $display("Test case 4: a=%b, b=%b, y=%b", a, b, y);

        $finish; // End simulation
    end
endmodule