module xnorgate(a,b,y);
input a,b;
output y;
wire w1;
or(w1,a,b);
not(y,w1);
endmodule

