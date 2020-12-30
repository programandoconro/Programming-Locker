import paho.mqtt.client as paho

def on_connect(client, userdata, flags, rc):
    print("Connected with result code "+str(rc))

    client.subscribe("test")

f = open("messages.log","ab")
def write_file(msj):
    f.write(msj)
    new_line = "\n"
    f.write(new_line.encode("utf-8"))
    
def on_message(client, userdata, msg):
    print(msg.topic+"/"+str(msg.payload))
    write_file(msg.payload)

client = paho.Client()
client.username_pw_set(username="name",password="xxxxxxx")
client.on_connect = on_connect
client.on_message = on_message

client.connect("your broker ip", 1883, 60)
client.loop_forever()
