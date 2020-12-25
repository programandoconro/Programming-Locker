import random
from math import floor

def binary_search(l, value):
    l.sort()
    cl = l

    if value > l[len(l) - 1] or value < l[0]:
        print("value not in the list")

    else:

        while True:
            index =  floor((len(cl) / 2) - 1)
            
            if value > l[index]:
                
                cl = cl[floor((len(cl) / 2) - 1): len(cl) - 1]
                print("Value higher than")

            if value < l[index]:
                
                cl = cl[0:floor((len(cl) / 2) - 1)]
                print("Value lower than")

            if value == l[index]:
                answer = l[index]
                print("Founded: ", answer)
                break

list_n = int(input("Please input the size of the array to search in: "))
user_value = int(input("Please input a number to search: "))

my_long_list = random.sample(range(list_n), list_n)

binary_search(my_long_list, user_value)



