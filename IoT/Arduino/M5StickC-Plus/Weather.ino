#include <M5StickCPlus.h>
#include "WiFi.h"
#include <WiFiMulti.h>
#include <HTTPClient.h>
#include <Arduino_JSON.h>


const long interval = 30000;
unsigned long previousMillis = 0;

const char* ssid = "your ssid";
const char* password = "your password";

String jsonBuffer;


void setup() {

  M5.begin();
  M5.Rtc.begin();
  M5.Imu.Init();
  Serial.begin(9600);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }
  delay(100);

  M5.Lcd.setTextSize(2);
  M5.Lcd.setRotation(1);



}


// From: https://embedgyan.wordpress.com/2020/05/21/esp32-http-get-with-arduino-ide-openweathermap-org-and-thingspeak/
String httpGETRequest(const char* serverName) {
  HTTPClient http;

  // Your IP address with path or Domain name with URL path
  http.begin(serverName);

  // Send HTTP POST request
  int httpResponseCode = http.GET();

  String payload = "{}";

  if (httpResponseCode > 0) {
    Serial.print("HTTP Response code: ");
    Serial.println(httpResponseCode);
    payload = http.getString();
  }
  else {
    Serial.print("Error code: ");
    Serial.println(httpResponseCode);
  }
  // Free resources
  http.end();

  return payload;
}

void getCurrentWeather() {
  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= interval) {

    previousMillis = currentMillis;
    M5.Lcd.setTextSize(16);
    M5.Lcd.fillScreen(BLACK);
    M5.Lcd.setTextColor(WHITE);

    if (WiFi.status() == WL_CONNECTED) {
      String serverPath = "http://api.openweathermap.org/data/2.5/weather?q=Fukuoka,japan&APPID=ffdd7da7dc76d29fce72bba0ae6ac89a&units=metric";
      jsonBuffer = httpGETRequest(serverPath.c_str());
      Serial.println(jsonBuffer);
      JSONVar myObject = JSON.parse(jsonBuffer);

      if (JSON.typeof(myObject) == "undefined") {
        Serial.println("Parsing input failed!");
        return;
      }
      else {
        M5.Lcd.setCursor(10, 40);
        M5.Lcd.println(myObject["main"]["temp"]);

      }


      Serial.println(myObject);
      Serial.print("Temperature: ");


      Serial.print("Pressure: ");
      Serial.println(myObject["main"]["pressure"]);
      Serial.print("Humidity: ");
      Serial.println(myObject["main"]["humidity"]);
      Serial.print("Wind Speed: ");
      Serial.println(myObject["wind"]["speed"]);
    }
    else {
      Serial.println("WiFi Disconnected");
    }
  }

}

// TODO:
void getTomorrowWeather() {
// curl "api.openweathermap.org/data/2.5/forecast?q=Fukuoka,japan&APPID=yourapi&units=metric&cnt=8"


}



void loop() {
  getCurrentWeather();

}
