import os

os.system('grep Canarias -A 2 noisy_data.txt > results.txt')

os.system('cat results.txt')

file = open('results.txt').read()

file
