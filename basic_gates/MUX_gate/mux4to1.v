module mux4to1(
    input i0, i1, i2, i3,
    input s0, s1,
    output y
);

    assign y = (s1 == 0 && s0 == 0) ? i0 :
               (s1 == 0 && s0 == 1) ? i1 :
               (s1 == 1 && s0 == 0) ? i2 :
               (s1 == 1 && s0 == 1) ? i3 : 1'bx; // default case for invalid select lines
endmodule


//dataflow modelling2
module mux4to1(
    input i0, i1, i2, i3,
    input s1, s0,
    output y
);

assign y = (~s1 & ~s0 & i0) |
           (~s1 & s0  & i1) |
           (s1  & ~s0 & i2) |
           (s1  & s0  & i3);

endmodule



//gatelevel modelling
module mux4to1(
    input i0, i1, i2, i3,
    input s1, s0,
    output y
);

wire ns1, ns0;
wire w1, w2, w3, w4;

not(ns1, s1);
not(ns0, s0);

and(w1, i0, ns1, ns0);
and(w2, i1, ns1, s0);
and(w3, i2, s1, ns0);
and(w4, i3, s1, s0);

or(y, w1, w2, w3, w4);

endmodule


//behavioral modeling

module mux4to1(
    input i0, i1, i2, i3,
    input s1, s0,
    output reg y
);

always @(*) begin

    case ({s1, s0})
        2'b00: y = i0;
        2'b01: y = i1;
        2'b10: y = i2;
        2'b11: y = i3;
    endcase

end

endmodule