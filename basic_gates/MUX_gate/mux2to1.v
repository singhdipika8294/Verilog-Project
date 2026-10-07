module mux2to1( // gatelevel modelling
    input i0, i1, s,
    output  y
);
wire w1, w2, w3;
not(w1, s);
and(w2, i0, w1);
and(w3, i1, s);     
or(y, w2, w3);
endmodule



//dataflow modeling
module mux2to1(
    input i0, i1,s,
    output y
);
assign y = (~s & i0) | (s & i1);
endmodule



//behavioral modelling
module mux2to1(
    input i0, i1, s,
    output reg y
);
always @(*) begin
    if (s==0)
       y = i0;
    else
    y = i1;
end
endmodule