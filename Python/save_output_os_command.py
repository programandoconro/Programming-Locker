import time
import os


def getData():
	r = os.popen("curl 192.168.11.199:8000/data.txt").read()
	time.sleep(1)
	r2 = os.popen("curl 192.168.11.199:8000/data.txt").read()
	if r != r2:
		with open("data.txt", "w") as filetowrite:
			filetowrite.write(r2)
			print("People in the room")
	else:
		print("No changes")
while True:
	getData(
