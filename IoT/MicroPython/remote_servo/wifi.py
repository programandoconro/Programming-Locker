import network

def wifi_connect():
    
    ssid = 'Mi-Ro-Sa-Network'
    wp2_pass = '**************'
    sta_if = network.WLAN(network.STA_IF)
    sta_if.active(True)
    sta_if.connect(ssid, wp2_pass)
    while sta_if.isconnected() == False:
        pass
    
def hotspot_connect():
    
    ssid = 'roro-phone'
    wp2_pass = '*************'
    sta_if = network.WLAN(network.STA_IF)
    sta_if.active(True)
    sta_if.connect(ssid, wp2_pass)
    while sta_if.isconnected() == False:
        pass
    
    
