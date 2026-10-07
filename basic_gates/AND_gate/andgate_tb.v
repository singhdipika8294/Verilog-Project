module andgate_tb;
    reg a;
    reg b;
    wire y;

    andgate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        // Test case 1: a=0, b=0
        a = 0; b = 0;
        #10;
        $display("Test case 1: a=%b, b=%b, y=%b", a, b, y);

        // Test case 2: a=0, b=1
        a = 0; b = 1;
        #10;
        $display("Test case 2: a=%b, b=%b, y=%b", a, b, y);

        // Test case 3: a=1, b=0
        a = 1; b = 0;
        #10;
        $display("Test case 3: a=%b, b=%b, y=%b", a, b, y);

        // Test case 4: a=1, b=1
        a = 1; b = 1;
        #10;
        $display("Test case 4: a=%b, b=%b, y=%b", a, b, y);

        $finish;
    end
endmodule