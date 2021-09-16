#!/usr/bin/python3 

# Los decorators toman una función como parámetro:
def d(target):
    print("decorator")
    print(target(2,2))
    return target

# Así llamamos al decorator, utilizando arroba:
@d

# Esta es la función target:
def a(val, val2):
    print("decorado")
    return val + val2

# Básicamente sería cómo hacer esto:
d(a)

# Output:

#decorator
#decorado
#4
#decorator
#decorado
#4
