import os
import coronaCanarias

os.system('grep Canarias -A 2 noisy_data.txt > results.txt && cat results.txt' )

file = open('results.txt').read()
