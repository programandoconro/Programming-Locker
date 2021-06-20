/* Get and display time until the next 3 Shinkansen trains from Hakata-Minami to Hakata Station.
   @programandoconro 2021
*/

#include <heltec.h>
#include <WiFi.h>
#include <HTTPClient.h>

const char* ssid = "Mi-Ro-Sa-Network";
const char* password = "*********************";

void WifiText() {
  Heltec.display->setFont(ArialMT_Plain_16);
  Heltec.display->setTextAlignment(TEXT_ALIGN_LEFT);
  Heltec.display->drawStringMaxWidth(0, 0, 128, "Connected");
}

void setup() {

  WiFi.begin(ssid, password);
  Serial.begin(115200);
  Heltec.begin(true /*DisplayEnable Enable*/, false /*LoRa Disable*/, true /*Serial Enable*/);

  Heltec.display->setTextAlignment(TEXT_ALIGN_LEFT);
  Heltec.display->setFont(ArialMT_Plain_10);


  while (WiFi.status() != WL_CONNECTED) {
    delay(3000);
    Serial.println("Connecting to WiFi..");
  }

  Heltec.display->clear();
  WifiText();
  Heltec.display->display();
  delay(1000);
}

void loop() {
  delay(1000);


  if ((WiFi.status() == WL_CONNECTED)) { 
    HTTPClient http;
 
    http.begin("http://192.168.1.228:9999/hakataminami-hakata"); 
    delay(10000);
    int httpCode = http.GET(); 
    delay(10000);
    if (httpCode > 0) { 
        Heltec.display->clear();
        
        String payload = http.getString();
        
        Serial.println(httpCode);
        Serial.println(payload);

        Heltec.display->setFont(ArialMT_Plain_10);

        Heltec.display->setTextAlignment(TEXT_ALIGN_LEFT);
        Heltec.display->drawString(0, 0,  "Next in: ");
        Heltec.display->drawString(110, 50,  "H:M ");
        
        Heltec.display->setFont(ArialMT_Plain_24);

        Heltec.display->drawString(50, 0,  payload.substring(2,6));
        Heltec.display->drawString(50, 20, payload.substring(12,16));
        Heltec.display->drawString(50, 40, payload.substring(22,26));
        
        Heltec.display->display();
        
      }
 
    else {
      Serial.println("Error on HTTP request");
    }
 
    http.end(); 
  }
}
