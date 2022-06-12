//------------- Half adder
module half_adder(a,b, h, l);
  input wire a,b;
  output wire h, l;
  
  and_gate u0(.a(a), .b(b), .and_s(h));
  xor_gate u1(.a(a), .b(b), .xor_s(l));
endmodule 

//------------- Full adder
module full_adder(a,b, c,h,l);
  input wire a, b, c;
  output h, l;
  
  wire temp_h0, temp_h1, temp_l;
  
  half_adder u0 (.a(a), .b(b), .h(temp_h0), .l(temp_l));
  half_adder u1 (.a(temp_l), .b(c), .h(temp_h1), .l(l));
  xor_gate u2(.a(temp_h0), .b(temp_h1), .xor_s(h));
endmodule
//------------- 
module multibit_adder(a1, a0, b1, b0, c, c_out, s1, s0);
  input wire a1,a0, b1, b0, c;
  output wire c_out, s1, s0;
  
  wire temp_h;
  
  full_adder u0 (.a(a0), .b(b0), .c(c), .h(temp_h),.l(s0));
  full_adder u1 (.a(a1), .b(b1), .c(temp_h), .h(c_out), .l(s1));
  
endmodule

//--------------------------------
module add_16(a,b,c, s, c_out);
  input wire [15:0] a,b;
  input wire c;
  output [15:0] s;
  output c_out;
  assign {c_out, s} = a + b+ c;
endmodule

//--------------------------------
module subt_16(a,b, out);
  input wire [15:0] a,b;
  output [15:0] out;
  
  assign out = a-b;
  
endmodule 
//--------------------------------
module eq(b3,b2,b1,b0,eq_f);
  input wire b3,b2, b1,b0;
  output eq_f;
  
  wire tempi3,tempi2,tempi1, tempi0, tempa1, tempa2;
  inv_gate u0 (.a(b0), .inv_s(tempi0));
  inv_gate u1 (.a(b1), .inv_s(tempi1));
  inv_gate u2 (.a(b2), .inv_s(tempi2));
  inv_gate u3 (.a(b3), .inv_s(tempi3));
  and_gate u4 (.a(tempi0), .b(tempi1), .and_s(tempa1));
  and_gate u5 (.a(tempi2), .b(tempi3), .and_s(tempa0));
  and_gate u6 (.a(tempa0), .b(tempa1), .and_s(eq_f));
  
endmodule 
//--------------------------------
module lt(a,lt_f);
  input wire [15:0] a;
  output lt_f;
  
  assign lt_f = a[15] ? 1'b1 : 1'b0;
  
endmodule
//--------------------------------
module selector(s, d1, d0, out);
  input s, d1, d0;
  output out;
  wire tempi, tempa0, tempa1;
 
  inv_gate u0 (.a(s), .inv_s(tempi));
  and_gate u1 (.a(tempi), .b(d0), .and_s(tempa0));
  and_gate u2 (.a(s), .b(d1), .and_s(tempa1));
  or_gate u3 (.a(tempa1), .b(tempa0), .or_s(out));
  
endmodule 
//----------------------------------
module switch(s,d, c1, c0);
  input wire s,d;
  output c1, c0;
  wire temp;
  
  inv_gate u0(.a(s), .inv_s(temp));
  and_gate u1(.a(temp), .b(d), .and_s(c0));
  and_gate u2(.a(s), .b(d), .and_s(c1));
  
endmodule

// Testbench--------------------------------------------------------
module tb_logicgates;
  reg a,b,c;
  reg a0, a1, b0, b1;
  wire ha_h, ha_l, fa_h, fa_l, ma_h, ma_l, ma_c;
  integer i, j;

  half_adder u0(.a(a), .b(b), .h(ha_h), .l(ha_l));
  full_adder u1(.a(a), .b(b), .c(c), .h(fa_h), .l(fa_l));
  multibit_adder u2(.a1(a1), .a0(a0), .b1(b1), .b0(b0), .c(c), .c_out(ma_c), .s1(ma_h), .s0(ma_l));  

  initial 
    begin
      {a,b,c} = 0;
      {a0, a1, b1, b0,c} =0;
      $monitor("T=%t a=%0b b=%0b c=%0b || half adder h=%b l=%b || full adder h=%b l=%b || multi-bit adder a1a0=%b%b b1b0=%b%b c=%b c_out=%b s1s0=%b%b", $time, a, b, c, ha_h, ha_l, fa_h, fa_l, a1, a0, b1, b0, c, ma_c, ma_h, ma_l );
      
      for (i = 0; i < 8; i = i+1)
          begin
            #1  {a,b,c} = i;
          end 
     
      for (j = 0; j < 32; j = j+1)
          begin
            #1  {a1,a0, b1,b0,c} = j;
          end 
    end 
  
endmodule

//------------------------------------------
