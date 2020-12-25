#!/usr/bin/python3

my_long_list = range(2000000)

def binary_search(l, value):

    def recursive(rl):
        
        index =  rl[len(rl) // 2]
        if value == l[index]:
            print("Found: ", index)

        elif value > l[index]:
            recursive(rl[len(rl) // 2 : ])
            print("Value higher than")

        elif value < l[index]:
            recursive(rl[ :len(rl) // 2])
            print("Value lower than")

    if value > l[len(l) - 1] or value < l[0]:
        print("Value not in the list")
    else:
        recursive(l)

binary_search(my_long_list, 33333)
binary_search(my_long_list, 1555555)
binary_search(my_long_list, 1)
binary_search(my_long_list, 999999)
binary_search(my_long_list, 500000)



