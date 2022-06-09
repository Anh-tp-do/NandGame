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

Output = Nand(a,b) = (a.b)'

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

# Or 
![image](https://user-images.githubusercontent.com/36804143/172892738-917e9847-f232-4863-8abc-c8df225842f3.png)


Given: 
 - Two inputs: a and b
 - Nand
 - Inverter
 - And
Task: Create an Or gate

Output = Or(a,b) = a + b
Using DeMorgan's law and Boolean algebra, we have: Output = a + b = ((a.b)')' = (a'.b')', which translates to Nand(Inv(a), Inv(b))

# Xor
![image](https://user-images.githubusercontent.com/36804143/172894544-bdb773fd-a7b0-4bea-8756-1bdf817067ff.png)

Given:
 - Inputs: a and b
 - Nand
 - Inv
 - And
 - Or
Task: Create a Xor gate

Output = Xor(a,b) = a'.b + a.b', which can translate to Or((And(Inv(a), b), And(a, Inv(b))
Let's look at a different implementation that requires fewer gates.
We have Output = Xor(a,b) = a'.b + a.b' = a'.a + b'.b + a'.b + a.b' = (a'.b').(a+b) = (a.b)'.(a+b) which translates to And(Nand(a,b),Or(a,b)).
We now went from 5 gates to 3 gates.

![image](https://user-images.githubusercontent.com/36804143/172894469-fcfd0636-4b36-4647-ac49-5f1633bc47ce.png)

