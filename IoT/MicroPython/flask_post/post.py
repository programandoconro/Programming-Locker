from wifi import wifi_connect
import urequests as requests

wifi_connect()
res = requests.get("http://192.168.1.228:9998/")
print(res.text)

myobj = {'value':'somevalue'}
post = requests.post("http://192.168.1.228:9998/posts",json = myobj)

print(post.text)
