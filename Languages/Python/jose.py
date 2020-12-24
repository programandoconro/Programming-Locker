
import random
import string

def rand_num(num_length=4, num_sample=string.digits):
    return "".join(random.sample(num_sample, num_length))

numberRandom = rand_num()

def compare_numbers(a,b):
    cows = 0
    bulls = 0
    for i in range(len(b)):
        if a[i] == b[i]: 
            cows = cows + 1    

    for i in range(len(a)):
        for j in range(len(b)):
            if a[i] == b[j]: 
                bulls = bulls + 1 


    print("Bulls->", bulls,"Cows->", cows)

def gameLoop():
    users_guess = str(input("Welcome to the Cows and Bulls Game!\nEnter a 4 digit number: "))
    compare_numbers(users_guess,numberRandom)
    print(users_guess,numberRandom)   
    return users_guess

def cows_and_bulls():
    while True:
        gameLoop()
        if gameLoop() == numberRandom: 
            print('you Win')	
            break

        if len(gameLoop()) != len(rand_num()):
            print("The number must be 4 digits")
            users_guess = str(input("Enter a 4 digit number: "))           

cows_and_bulls()




