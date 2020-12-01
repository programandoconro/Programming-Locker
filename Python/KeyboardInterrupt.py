import os
import sys

def main():
  while True:
    print("Infinite Loop, Ctrl-c to break it")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        print('Bye')
        try:
            sys.exit(0)
        except SystemExit:
            os._exit(0)
