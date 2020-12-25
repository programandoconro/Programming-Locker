#!/usr/bin/python3

import random

my_long_list = random.sample(range(1000000), 1000000)

def binary_search(l, value):
    l.sort()

    def recursive(rl):
        
        index =  rl[len(rl) // 2]
        if value == l[index]:
            answer = l[index]
            print("Found: ", answer)

        elif value > l[index]:
            
            rl = rl[len(rl) // 2 : ]
            recursive(rl)
            print("Value higher than")

        elif value < l[index]:
            
            rl = rl[ :len(rl) // 2]
            recursive(rl)
            print("Value lower than")

    if value > l[len(l) - 1] or value < l[0]:
        print("Value not in the list")
    else:
        recursive(l)

binary_search(my_long_list, 33333)
binary_search(my_long_list, 555555)
binary_search(my_long_list, 1)
binary_search(my_long_list, 999999)
binary_search(my_long_list, 500000)
