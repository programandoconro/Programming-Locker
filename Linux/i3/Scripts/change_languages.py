#!/bin/python3
import os

def print_current_engine():
    
    current_engine = os.popen('ibus engine').read()
    if "xkb:us::eng" == current_engine.strip():
        command = "ibus engine " + "kkc"
    else:
        command = "ibus engine " + "xkb:us::eng"
    os.system(command)

print_current_engine()

                        
