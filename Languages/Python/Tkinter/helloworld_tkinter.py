from tkinter import *
from tkinter.ttk import Progressbar
from tkinter import ttk

window = Tk()

window.title("Ro")

window.geometry('350x200')

lbl = Label(window, text="Hola")

lbl.grid(column=0, row=0)
counter = 0

def clicked():
    global counter

    lbl.configure(text="Click otra vez !!")
    counter += 10
    if counter > 100:
        counter = 0
    bar['value'] = counter

btn = Button(window, text="Click Me", command=clicked)

btn.grid(column=1, row=0)
style = ttk.Style()

style.theme_use('default')

style.configure("black.Horizontal.TProgressbar", background='black')

bar = Progressbar(window, length=200, style='black.Horizontal.TProgressbar')

bar['value'] = 0

bar.grid(column=0, row=10)

window.mainloop()
