#         NandGame
  A verilog version for Nandgame's solutions
  https://nandgame.com/

# NAND
![image](https://user-images.githubusercontent.com/36804143/172890252-65e86842-f6b0-4593-8a17-c203ee2eedee.png)

Given: 
- Two inputs: a and b
- Power +
- Relay (default On)
- Relay (defalut Off)
Task: Create a Nand gate from the given tools

Relay (default On):
Relay (defalt Off): 


# Invert
![image](https://user-images.githubusercontent.com/36804143/172890975-9cb5557a-c086-4e4f-8bc6-8b66de9bf042.png)

Given:
 - One input
 - Nand gate
Task: Create an interter from Nand gate(s)

Output = (Input)' = Nand(Input)

# And
![image](https://user-images.githubusercontent.com/36804143/172891255-13e241fa-2cd4-4de7-8c96-4b2c53b3fd74.png)

Given:
 - Two inputs: a and b
 - Inverter
 - Nand gate

Output = And(a,b) = a.b = ((a.b)')' which translates to either Interter(Nand(a,b)) or Nand(Nand(a.b))
