
//--------------------------------------------------
module inv16 (a, inv16_s);
  input wire [15:0] a;
  output wire [15:0] inv16_s;
  assign inv16_s = ~a;   
endmodule 

module xor16(a,b, xor16_s);
  input wire [15:0] a,b;
  output [15:0] xor16_s;
  assign xor16_s = a ^ b;
endmodule 

module or16(a,b,or16_s);
  input [15:0] a,b;
  output [15:0] or16_s;
  assign or16_s = a | b;
endmodule 

module and16(a, b, and16_s);
  input [15:0] a, b;
  output [15:0] and16_s;
  assign and16_s = a & b;
endmodule 

module select16(s,d1,d0, out);
  input s;
  input [15:0] d1,d0;
  output [15:0] out;
  assign out = s ? d1 : d0;
endmodule 

module sub16(a, b, sub16_s);
  input [15:0] a, b;
  output [15:0] sub16_s;
  assign sub16_s = a-b;
endmodule

module add16(a,b,add16_s);
  input [15:0] a,b;
  output [15:0] add16_s;
  assign add16_s = a+b;
endmodule
//--------------------------------------------------
module Logic_unit(op1, op0, X, Y, out);
  input wire op0, op1;
  input wire [15:0] X, Y;
  output wire [15:0] out;
  wire [15:0] tempi, tempxor, tempor, tempa, sel1, sel0;
  
  inv16 u0 (.a(X), .inv16_s(tempi));
  xor16 u1 (.a(X),.b(Y), .xor16_s(tempxor));
  or16 u2 (.a(X),.b(Y),.or16_s(tempor));
  and16 u3 (.a(X), .b(Y), .and16_s(tempa));
  select16 u4 (.s(op0),.d1(tempor), .d0(tempa), .out(sel0));
  select16 u5 (.s(op0), .d1(tempi), .d0(tempxor), .out(sel1));
  select16 u6 (.s(op1), .d1(sel1), .d0(sel0), .out(out));
endmodule 

module arithmetic_unit(op1, op0, X, Y, out);
  input op1, op0;
  input [15:0] X, Y;
  output [15:0] out;
  
  wire [15:0] add0, add1, sub0, sub1, sel0, sel1, sel2;
  wire one;
  assign one = 1'b1;
  
  sub16 u0 (.a(X), .b(Y), .sub16_s(sub0));
  sub16 u1 (.a(X), .b(one), .sub16_s(sub1));
  add16 u2 (.a(X), .b(Y), .add16_s(add0));
  add16 u3 (.a(X),.b(one), .add16_s(add1));
  select16 u4 (.s(op1), .d1(sub1), .d0(add1), .out(sel1));
  select16 u5 (.s(op1), .d1(sub0), .d0(add0), .out(sel0));
  select16 u6 (.s(op0), .d1(sel1), .d0(sel0), .out(out));
  
endmodule 

module ALU(u, op0, op1, zx, sw, X, Y, out);
  input [15:0] X, Y;
  input u, op0, op1, zx, sw;
  output [15:0] out;
  
  wire zero;
  wire [15:0] sel0, sel1, sel2, sel3, au, lu;
  
  assign zero = 1'b0;
  
  arithmetic_unit u0 (.op1(op1), .op0(op0), .X(sel2), .Y(sel0), .out(au));
  logic_unit u1 (.op1(op1), .op0(op0), .X(sel2), .Y(sel0), .out(lu));
  select16 u2 (.s(sw),.d1(X), .d0(Y), .out(sel0));
  select16 u3 (.s(sw), .d1(Y), .d0(X), .out(sel1));
  select16 u4 (.s(zx), .d1(zero), .d0(sel1), .out(sel2));
  select16 u5 (.s(u), .d1(au), .d0(lu), .out(out));
endmodule

//module Condition();
//endmodule 
