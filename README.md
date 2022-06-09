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

![image](https://user-images.githubusercontent.com/36804143/172901742-2fe03678-f099-4fbd-807e-556d38aadb37.png)



# Invert
![image](https://user-images.githubusercontent.com/36804143/172890975-9cb5557a-c086-4e4f-8bc6-8b66de9bf042.png)

Given:
 - One input
 - Nand gate
Task: Create an interter from Nand gate(s)

Output = (Input)' = Nand(Input)

![image](https://user-images.githubusercontent.com/36804143/172901804-42acacd4-a754-46ec-a92a-956c54a5a8b8.png)


# And
![image](https://user-images.githubusercontent.com/36804143/172891255-13e241fa-2cd4-4de7-8c96-4b2c53b3fd74.png)

Given:
 - Two inputs: a and b
 - Inverter
 - Nand gate

Output = And(a,b) = a.b = ((a.b)')' which translates to either Interter(Nand(a,b)) or Nand(Nand(a.b))

![image](https://user-images.githubusercontent.com/36804143/172901873-3c8f8d8d-3f15-4e37-a6fd-4389e73f0742.png)


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

![image](https://user-images.githubusercontent.com/36804143/172901940-e0feb1d0-5c5a-4293-828b-567f57852d8b.png)


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

# Half Adder
![image](https://user-images.githubusercontent.com/36804143/172902045-71856a84-5db1-44e6-8363-ed42613b9cec.png)

Given:
 - Nand
 - Inv
 - And
 - Or
 - Xor
Task: Create a half adder from the given tools.

We see there that there are two outputs: h and l, let's solve them separately.
l = a'.b + a.b' which translates directly to Xor(a,b)
h = a.b which is And(a,b)

![image](https://user-images.githubusercontent.com/36804143/172902634-d18a7450-5009-45bc-9230-4e64e58652e8.png)

# Full Adder
![image](https://user-images.githubusercontent.com/36804143/172903364-fbc8dd87-e464-4b8e-a05e-8e11e9ccd2ec.png)


