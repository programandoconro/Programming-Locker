
//Internet
#include "WiFi.h"

//MQTT
#include <PubSubClient.h>

//Libraries for OLED Display
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#include "DHT.h"

#define DHTPIN 25
//our sensor is DHT11 type
#define DHTTYPE DHT11
//create an instance of DHT sensor
DHT dht(DHTPIN, DHTTYPE);


//OLED pins
#define OLED_SDA 4
#define OLED_SCL 15
#define OLED_RST 16
#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RST);

const char* ssid = "Mi-Ro-Sa-Network";
const char* password =  "***************";
const char* aws_mqtt_server = "54.199.28.175";
const char* local_mqtt_server = "192.168.1.166";

WiFiClient espClient;
void callback(char* topic, byte* payload, unsigned int length) {
  // handle message arrived
}

PubSubClient client(aws_mqtt_server, 1883, callback, espClient);
long lastMsg = 0;
char msg[50];
int value = 0;

int Timestamp = 0;

void setup() {
  pinMode(OLED_RST, OUTPUT);
  digitalWrite(OLED_RST, LOW);
  delay(20);
  digitalWrite(OLED_RST, HIGH);

  //initialize OLED
  Wire.begin(OLED_SDA, OLED_SCL);
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3c, false, false)) { // Address 0x3C for 128x32
    Serial.println(F("SSD1306 allocation failed"));
    for (;;); // Don't proceed, loop forever
  }

  display.clearDisplay();
  display.setTextColor(WHITE);
  display.setTextSize(1);
  display.setCursor(0, 0);

  //initialize Serial Monitor
  Serial.begin(115200);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.println("Connecting to WiFi..");
  }
  display.display();

  Serial.println("Connected to the WiFi network");

  dht.begin();
}


void loop() {
  float h = dht.readHumidity();
  // Read temperature as Celsius (the default)
  float t = dht.readTemperature();

  char tempString[8];
  char humString[8];
  dtostrf(t, 1, 2, tempString);
  dtostrf(h, 1, 2, humString);

  char buf[50];
  const char *first = "INSERT INTO Weather VALUES(";
  const char *comma = ",";
  const char *second = ");";
  const char *CO2 = "0";
  strcpy(buf, first);
  strcat(buf, tempString);
  strcat(buf, comma);
  strcat(buf, humString);
  strcat(buf, comma);
  strcat(buf, CO2);
  strcat(buf, second);


  if (Timestamp == 3000) {
    Timestamp = 0;

    if (client.connect("espClient", "user00001", "*************")) {
      client.publish("sensors/weather", buf);

    }
  }

  display.clearDisplay();
  display.setCursor(0, 0);
  display.setTextSize(2);


  if (WiFi.status() == WL_CONNECTED) {
    display.print("WiFi");
   
    if (client.connect("espClient", "user00001", "***********")) {
      display.println("-MQTT");
    }

    display.println("");

  }
  else {
    display.println("No WiFi");
  }

  display.setTextSize(2);
  display.print("H:");
  display.println(h);
  display.print("T:");
  display.println(t);
  display.display();

  Timestamp = Timestamp + 1;
  delay(200);

}
