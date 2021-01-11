import random

class randomIntegers:
    
    def __init__(self, length):
        self.length = length

    def create(self):
        
        r = random.sample(range(self.length), self.length)
        c = random.choice(range(self.length))
        
        l = []        
        for i in range(self.length):
            l.insert(i, int( random.random() * i ) )
        
        return [c, r, l]

test = randomIntegers( 100 )
test.create()



