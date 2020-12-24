def bar(perc):
    if(0 <= perc <= 100):
        p = perc / 4
        print('🔵'  * (int(p)) + '🔴' * (25 - (int(p))))	
    else:
        print('Out of range')
