#!/usr/bin/python3

my_long_list = range(1000000)

def binary_search(l, value):
    cl = l

    if value > l[len(l) - 1] or value < l[0]:
        print("Value not in the list")
    else:
        while True:
            index =  cl[len(cl) // 2]

            if value == l[index]:
                answer = l[index]
                print("Found: ", answer)
                break
            
            elif value > l[index]:
                
                cl = cl[len(cl) // 2: len(cl)]
                print("Value higher than")

            elif value < l[index]:
                
                cl = cl[0:len(cl) // 2]
                print("Value lower than")


binary_search(my_long_list, 33333)
binary_search(my_long_list, 555555)
binary_search(my_long_list, 1)
binary_search(my_long_list, 999999)
binary_search(my_long_list, 500000)


