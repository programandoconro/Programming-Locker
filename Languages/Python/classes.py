# How to update values inside a function (of a class) to avoid the use of global variables in python. 

class number_keeper():
  def __init__(self,n):
    self.n = n
  def get_number(self):    
    self.n += 1
    return(self.n)
    
a = number_keeper(0)

for i in range(10):
  c = a.get_number()
  print(c)
  
