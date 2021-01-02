// Arduino program on the ESP32 chip (TTGO OLED) to publish Temperature and Humidity Data to a MQTT Broker (that sends data to MySQL DB) and display it on the OLED screen. 
// Author: Rodrigo Diaz (programandoconro@gmail.com).
// This program is open source and free to use.

//Internet
#include "WiFi.h"

//Get Time from the Internet
#include <NTPClient.h>
WiFiUDP ntpUDP;
NTPClient timeClient(ntpUDP);

//MQTT
#include <PubSubClient.h>

//Libraries for OLED Display
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

//Temperature and Humidity Sensor
#include "DHT.h"

//Sensor Configuration
#define DHTPIN 25
//our sensor is DHT11 type
#define DHTTYPE DHT11
//create an instance of DHT sensor
DHT dht(DHTPIN, DHTTYPE);

//OLED Configuration
#define OLED_SDA 4
#define OLED_SCL 15
#define OLED_RST 16
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RST);

//WiFi and Server Configuration
const char* ssid = "Mi-Ro-Sa-Network";
const char* password =  "*************";
const char* aws_mqtt_server = "54.199.28.175";
//const char* local_mqtt_server = "192.168.1.166";

WiFiClient espClient;
void callback(char* topic, byte* payload, unsigned int length) {
  // handle message arrived
}

PubSubClient client(aws_mqtt_server, 1883, callback, espClient);

//Iterador
int Timestamp = 0;

void setup() {
  //Set time to Japan
  timeClient.setTimeOffset(32400); //JAPAN +9 = 32400

  //Initialize OLED
  pinMode(OLED_RST, OUTPUT);
  digitalWrite(OLED_RST, LOW);
  delay(20);
  digitalWrite(OLED_RST, HIGH);

  Wire.begin(OLED_SDA, OLED_SCL);
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3c, false, false)) { // Address 0x3C for 128x32
    Serial.println(F("SSD1306 allocation failed"));
    for (;;); // Don't proceed, loop forever
  }

  display.clearDisplay();
  display.setTextColor(WHITE);
  display.setTextSize(1);
  display.setCursor(0, 0);

  //Initialize Serial Monitor and Internet
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }
  
  display.display();

  Serial.println("Connected to the WiFi network");

  //Connect to the Broker
  client.setServer(aws_mqtt_server, 1883);

  //Initialize Sensor
  dht.begin();

   if (client.connect("espClient", "user00001", "***********")) {
      client.publish("sensors/weather", "INSERT INTO Weather VALUES(0,0,0);");

    }
}

void loop() {

  // Read Humidity and temperature 
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  
  //Get Time
  timeClient.update();
  String Localtime = timeClient.getFormattedTime();
  float lt = Localtime.toFloat();

  //Manipulate the data
  char tempString[8];
  char humString[8];
  char timeString[20];
  dtostrf(t, 1, 2, tempString);
  dtostrf(h, 1, 2, humString);
  dtostrf(lt, 1, 0, timeString);

  char buf[70];
  const char *first = "INSERT INTO Weather VALUES(";
  const char *comma = ",";
  const char *second = ");";
  const char *CO2 = "0";

  strcpy(buf, first);
  strcat(buf, tempString);
  strcat(buf, comma);
  strcat(buf, humString);
  strcat(buf, comma);
  strcat(buf, timeString);
  strcat(buf, second);
  
  Serial.println(buf);

  //Publish MQTT
  if (Timestamp == 18000) {
    Timestamp = 1;

    if (client.connect("espClient", "user00001", "************")) {
      client.publish("sensors/weather", buf);

    }
  }

  //Display in the OLED
  display.clearDisplay();
  display.setCursor(0, 0);
  display.setTextSize(2);
  display.print("T:");
  display.println(t);
  display.print("H:");
  display.println(h);
  display.println(Localtime);
  display.setTextSize(1);

  if (WiFi.status() == WL_CONNECTED) {
    display.print("WiFi");

    if (client.connect("espClient", "user00001", "***********)) {
      display.println("-MQTT");
    }

  }
  else {
    display.println("No WiFi");
  }
  display.display();
  
  //Add 1 to timestamp and wait 0.2 seconds
  Timestamp = Timestamp + 1;
  delay(200);

}
