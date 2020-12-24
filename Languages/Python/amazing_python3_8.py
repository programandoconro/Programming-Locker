                                       ## Amazing Python 3.8 ## 

# Una nueva manera de evitar escribir len(a) dos veces. 

a = [2,3,3]
if (n := len(a)) > 2:
    print(f"List is too long ({n} elements, expected <= 2)")  

# Clases:

class Names:
  def __init__(self, firstname, lastname):
    self.r = firstname
    self.i = lastname

x = Names('ro', 'diaz')
x.r, x.i

# Imprimir objetos y texto facilmente

a = 1
b = 2

f'{a} y {2}'
