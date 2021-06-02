#!/bin/python3

'''
Change keyboard layout between Japanese(kanji), English and Spanish.
キーボードレイアウトを日本語（漢字）、英語やスペイン語に変更します。
Cambia el layout del teclado entre Español, Inglés y Japonés.  

This script was made to be used as a keybinding in the i3 windows manager config file:
bindsym $mod+space exec python3 /home/user/shuffle_languages.py
'''

import os

engines = ["kkc", "xkb:us::eng", "xkb:es::spa"]

def shuffle_engines():
  
    current_engine = os.popen('ibus engine').read()
    for i,e in enumerate(engines):
        if e == current_engine.strip():
            if i == len(engines) - 1:
                command = "ibus engine " + engines[0]
            else:
                command = "ibus engine " + engines[i + 1]
                
    os.system(command)


shuffle_engines()
