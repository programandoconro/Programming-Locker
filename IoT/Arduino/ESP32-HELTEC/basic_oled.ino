// OLED screen test. Based on https://github.com/HelTecAutomation/Heltec_ESP32

#include <heltec.h>

int i = 0;
char message[17] = "Hello ESP32 OLED";

void setup() {
  Serial.begin(9600);
 
  Heltec.begin(true /*DisplayEnable Enable*/, false /*LoRa Disable*/, true /*Serial Enable*/);
  Heltec.display->setTextAlignment(TEXT_ALIGN_LEFT);
  Heltec.display->setFont(ArialMT_Plain_10);
}

void loop() {
  Serial.println(message);
  
  Heltec.display->clear();
  Heltec.display->drawString(0, 10, message);
  Heltec.display->drawString(0, 20, String(i));
  Heltec.display->display();
  
  i++;
  delay(1000);

}
