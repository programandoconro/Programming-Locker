import paho.mqtt.client as paho

broker="192.168.x.xx"
port=9001

def on_publish(client,userdata,result):          
    print("data published \n")
    pass
    
client1= paho.Client(transport="websockets")                        

client1.on_publish = on_publish                         

client1.connect(broker,port)                                

ret= client1.publish("mytopic/example/test","6")

