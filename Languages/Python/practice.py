import time

for i in range(1,10):
    print('Hello Python', i)
    time.sleep(1)   

if 1 == 1:
    print('Corrrect')

if 1 < 0:
    print('1<0 ???') 
else:
    print ('Correct 1>0')

def HelloPython (p,t): 
    for i in range(1,p):
        print('Hello Python', i)
        time.sleep(t)  

HelloPython(10,1)

for i in range(1,10**100):
    print('Hello Python', i)

while True: 
    print('Hello Python')
    time.sleep(1)
    
while 1 < 2:
    print ('true')
    time.sleep(1)
