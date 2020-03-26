import os
from CoronaCanarias import pdfs_to_txt

pdfs_to_txt(path="/home/roro/COVID_canarias/")
os.system('grep Canarias -A 2 noisy_data.txt > results.txt && cat results.txt')
file = open('results.txt').read()

