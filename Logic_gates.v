module logic_gates(a,b, out_nand, out_inv, out_and, out_or, out_xor)
  input wire a, b;
  output wire out_nand, out_inv, out_and, out_or, out_xor;
  
  nand(out_nand, a,b);
  not(out_inv, a,b);
  and(out_and, a,b);
  or(out_or, a,b);
  xor(out_xor, a,b);
    
endmodule 

// Testbench 
module tb_logicgates;
  reg a,b;
  wire out_nand, out_inv, out_and, out_or, out_xor;
  integer i;

  logic_gates u0 (.a(a), .b(b), .out_nand(out_nand), .out_inv(out_inv), .out_and(out_and), .out_or(out_or), .out_xor(out_xor);
  
  initial 
    begin
      {a,b} = 0
      
      $monitor("T=%0t a=%0b b=%0b out_nand=%0b  out_inv=%0b out_and=%0b out_or=%0b out_xor=%0b]", $time, a, b, out_nand, out_inv, out_and, out_or, out_xor)
        for (i = 0; i < 4; i = i+1)
          begin
            #1 a <= $random;
               b <= $random;
          end
      
    end 
  
endmodule
