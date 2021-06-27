#include <WiFi.h>
#include <HTTPClient.h>

const char* ssid = "Mi-Ro-Sa-Network";
const char* password = "***********";
int counter = 0;
void setup() {

  WiFi.begin(ssid, password);
  Serial.begin(115200);

  while (WiFi.status() != WL_CONNECTED) {
    delay(3000);
    Serial.println("Connecting to WiFi..");
  }
}

void loop() {

  if ((WiFi.status() == WL_CONNECTED)) {
    HTTPClient http;

    http.begin("http://192.168.1.228:9998/posts");
    delay(10000);
    counter ++;
    String h = String(counter);

    int httpCode = http.POST(h);
    Serial.println(httpCode);     
    delay(10000);

    http.end();
  }
}
