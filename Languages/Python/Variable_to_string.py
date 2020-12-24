#/usr/bin/python

import os
import time
os.system('touch json_test.json')
t = 'test'
n = 0

while True:
  n += 1
  os.system('echo %s %d >> json_test.json'% (t, n))
  time.sleep(1)
  os.system('echo {} hola {}'.format(t,n))
