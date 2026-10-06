module nandgate(a, b, y);
    input a, b;
    output reg y;
    always @(*) begin
           y = ~(a & b); 
    end
endmodule