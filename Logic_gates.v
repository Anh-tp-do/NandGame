// Reference
module logic_gates(a,b, out_nand, out_inv, out_and, out_or, out_xor);
  input wire a, b;
  output wire out_nand, out_inv, out_and, out_or, out_xor;
  
  nand(out_nand, a,b);
  not(out_inv, a);
  and(out_and, a,b);
  or(out_or, a , b);
  xor(out_xor, a , b);
    
endmodule 

//------------------------

module nand_gate(a,b,nand_s);
  input wire a, b;
  output wire nand_s;
  
  assign nand_s = !(a&b);
endmodule 

module inv_gate(a,inv_s);
  input wire a;
  output wire inv_s;
  
  nand_gate u0 (.a(a), .b(a), .nand_s(inv_s));
endmodule 

module and_gate(a,b,and_s);
  input wire a,b;
  output wire and_s;
  wire temp;
  
  nand_gate u0(.a(a), .b(b), .nand_s(temp));
  inv_gate u1(.a(temp), .inv_s(and_s));
  
endmodule 

module or_gate(a,b,or_s);
  input wire a,b;
  output wire or_s;
  
  wire temp_a, temp_b;
  
  inv_gate u0 (.a(a), .inv_s(temp_a));
  inv_gate u1 (.a(b), .inv_s(temp_b));
  nand_gate u2 (.a(temp_a), .b(temp_b), .nand_s(or_s));
endmodule 

// Testbenches -------------------
module tb_logicgates;
  reg a,b;
  wire out_nand, out_inv, out_and, out_or, out_xor;
  wire nand_s, inv_s, and_s, or_s;
  integer i;
  
  logic_gates u0 (.a(a), .b(b), .out_nand(out_nand), .out_inv(out_inv), .out_and(out_and), .out_or(out_or), .out_xor(out_xor));
  
  nand_gate u1 (.a(a), .b(b), .nand_s(nand_s));
  inv_gate u2(.a(a),.inv_s(inv_s));
  and_gate u3(.a(a), .b(b), .and_s(and_s));
  or_gate u4(.a(a), .b(b), .or_s(or_s));
  
  initial 
    begin
      {a,b} = 0;

      
      $monitor("T=%t a=%b b=%b | out_nand=%0b nand_s=%0b  || out_inv=%b  inv_s = %b || out_and=%b and_s=%b || out_or=%b or_s=%b || out_xor=%0b ", $time, a, b, out_nand, nand_s, out_inv, inv_s, out_and, and_s, out_or, or_s, out_xor);
      
      for (i = 0; i < 4; i = i+1)
          begin
            #1  {a,b} = i;
               
          end
      
    end 
  
endmodule
