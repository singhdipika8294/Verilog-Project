module xorgate(
    input wire a,
    input wire b,
    output wire y
);
    assign y = a ^ b; // XOR operation
endmodule