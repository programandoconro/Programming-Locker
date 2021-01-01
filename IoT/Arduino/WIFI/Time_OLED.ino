#include "WiFi.h"
#include "heltec.h"
#include <NTPClient.h>

WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP);

void WifiText() {
  Heltec.display->setFont(ArialMT_Plain_16);
  Heltec.display->setTextAlignment(TEXT_ALIGN_LEFT);
  Heltec.display->drawStringMaxWidth(0, 0, 128, "Connected" );

}

const char* ssid = "Mi-Ro-Sa-Network";
const char* password =  "***************";

void setup() {

  timeClient.setTimeOffset(32400); //JAPAN +9 = 32400

  Serial.begin(115200);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }

  Serial.println("Connected to the WiFi network");

  Heltec.begin(true);
  Heltec.display->clear();
  WifiText();
  Heltec.display->display();
  delay(1000);
}


void loop() {
  timeClient.update();
  Heltec.display->clear();
  Serial.println(timeClient.getFormattedTime());
  delay(1000);

  Heltec.display->setFont(ArialMT_Plain_24);
  Heltec.display->setTextAlignment(TEXT_ALIGN_LEFT);
  Heltec.display->drawStringMaxWidth(20, 20, 228, timeClient.getFormattedTime() );
  Heltec.display->display();


}
