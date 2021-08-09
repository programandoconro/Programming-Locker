#include <M5StickCPlus.h>
#include "WiFi.h"
#include <WiFiMulti.h>

const char* ssid = "Scarybug";
WiFiServer server(80);
String header;

WiFiMulti WiFiMulti;

int ButtonA = 0;
int Screen = 2;
int ButtonB = 1;
const char* Networks[20];
bool Connected = false;

RTC_TimeTypeDef RTC_TimeStruct;
RTC_DateTypeDef RTC_DateStruct;

const long interval = 1000;
unsigned long previousMillis = 0;

float accX = 0;
float accY = 0;
float accZ = 0;
float gyroX = 0;
float gyroY = 0;
float gyroZ = 0;
float temp = 0;

void setup() {

  M5.begin();
  M5.Rtc.begin();
  M5.Imu.Init();
  Serial.begin(9600);

  WiFi.mode(WIFI_STA);
  WiFi.disconnect();
  delay(100);

  RTC_TimeTypeDef TimeStruct;
  TimeStruct.Hours = 21;
  TimeStruct.Minutes = 18;
  TimeStruct.Seconds = 00;
  M5.Rtc.SetTime(&TimeStruct);
  RTC_DateTypeDef DateStruct;

  DateStruct.Month = 8;
  DateStruct.Date = 9;
  DateStruct.Year = 2021;

  M5.Rtc.SetData(&DateStruct);
  M5.Lcd.setTextSize(2);
  M5.Lcd.setRotation(1);
  Serial.print("Setting AP (Access Point)…");

  WiFi.softAP(ssid);

  IPAddress IP = WiFi.softAPIP();
  Serial.print("AP IP address: ");
  Serial.println(IP);

  server.begin();
}

void Window(int button, int nextButton) {
  if (M5.BtnA.read() && ButtonA == button) {

    M5.Beep.beep();
    ButtonA = nextButton;
    Screen = button;

    delay(200);
  }
}

//MAIN MENU (BOTTON B)
void Menu() {

  if (M5.BtnB.read()) {
    M5.Lcd.fillScreen(WHITE);
    M5.Lcd.setTextColor(BLACK);
    M5.Lcd.setTextSize(1);
    M5.Lcd.setCursor(10, 10);
    M5.Lcd.println("Push button A to Scan Network");
    if (ButtonB == 0) {
      ButtonB = 1;
      Screen = 0;

    } else {
      ButtonB = 0;
      Screen = 3;
    }

    delay(200);
  }
}
//CLOCK
void Program1() {
  if (Screen == 0) {
    unsigned long currentMillis = millis();

    if (currentMillis - previousMillis >= interval) {

      previousMillis = currentMillis;
      M5.Lcd.setTextSize(2);
      M5.Lcd.fillScreen(BLACK);
      M5.Lcd.setTextColor(WHITE);
      M5.Rtc.GetTime(&RTC_TimeStruct);
      M5.Rtc.GetData(&RTC_DateStruct);
      M5.Lcd.setCursor(60, 10);
      M5.Lcd.printf("%04d-%02d-%02d\n", RTC_DateStruct.Year, RTC_DateStruct.Month, RTC_DateStruct.Date);

      M5.Lcd.setCursor(30, 50);
      M5.Lcd.setTextSize(4);
      M5.Lcd.printf("%02d:%02d:%02d\n", RTC_TimeStruct.Hours, RTC_TimeStruct.Minutes, RTC_TimeStruct.Seconds);
    }
  }
}

// SENSOR INFO
void Program2() {
  if (Screen == 1) {
    unsigned long currentMillis = millis();

    if (currentMillis - previousMillis >= interval) {
      previousMillis = currentMillis;

      M5.Lcd.fillScreen(GREEN);
      M5.Lcd.setCursor(10, 10);
      M5.Lcd.setTextSize(1);
      M5.Lcd.setTextColor(RED);
      M5.Lcd.println(M5.Axp.GetVbatData());
      M5.Lcd.setCursor(10, 20);
      M5.Lcd.println(M5.Axp.GetPowerbatData());
      M5.Lcd.setCursor(10, 30);
      M5.Lcd.println(M5.Axp.GetAPSVoltage());
      M5.Imu.getTempData(&temp);
      M5.Lcd.setCursor(10, 40);
      M5.Lcd.printf("Temperature : %.2f C", temp);
      M5.Lcd.setCursor(10, 50);
      M5.Imu.getGyroData(&gyroX, &gyroY, &gyroZ);
      M5.Imu.getAccelData(&accX, &accY, &accZ);
      M5.Lcd.printf("%.2f   %.2f   %.2f      ", gyroX, gyroY, gyroZ);
      M5.Lcd.setCursor(10, 60);
      M5.Imu.getAccelData(&accX, &accY, &accZ);
      M5.Lcd.printf("%.2f   %.2f   %.2f      ", accX, accY, accZ);
    }
  }
}

//TODO
// WEATHER STATION
//curl "api.openweathermap.org/data/2.5/weather?q=Fukuoka,japan&APPID=95e165ee4522add3c1c1c357469ea202"
//curl "api.openweathermap.org/data/2.5/weather?q=Nakagawa,japan&APPID=95e165ee4522add3c1c1c357469ea202"
void Program3() {
  if (Screen == 4) {
    unsigned long currentMillis = millis();

    if (currentMillis - previousMillis >= interval) {

      previousMillis = currentMillis;
      M5.Lcd.setTextSize(2);
      M5.Lcd.fillScreen(RED);
      M5.Lcd.setTextColor(WHITE);
    }
  }
}

//Login Website
void Program4() {
  WebSite();
  if (Screen == 5) {
    unsigned long currentMillis = millis();

    if (currentMillis - previousMillis >= interval) {
      previousMillis = currentMillis;

      M5.Lcd.setTextSize(2);
      M5.Lcd.fillScreen(BLUE);
      M5.Lcd.setTextColor(WHITE);

      if (Connected) {
        M5.Lcd.setCursor(40, 10);
        M5.Lcd.println("CONNECTED");
        M5.Lcd.println("");
        M5.Lcd.println(WiFi.localIP());
      } else {
        M5.Lcd.setCursor(40, 10);
        M5.Lcd.println("ACCESS POINT");
        M5.Lcd.println("");
        M5.Lcd.println("Connect to ScaryBug");
        M5.Lcd.println("Browse 192.168.4.1");
      }
    }
  }
}

//WELCOME SCREEN
void Program5() {
  if (Screen == 2) {

    M5.Lcd.fillTriangle(random(M5.Lcd.width() - 1), random(M5.Lcd.height() - 1), random(M5.Lcd.width() - 1), random(M5.Lcd.height() - 1), random(M5.Lcd.width() - 1), random(M5.Lcd.height() - 1), random(0xfffe));
  }
}

//SCAN AND CONNECT TO WIFI
void MainMenu() {

  if (Screen == 3) {
    if (M5.BtnA.read()) {
      M5.Lcd.fillScreen(WHITE);
      int n = WiFi.scanNetworks();
      if (n == 0) {
        M5.Lcd.println("no networks found");
      } else {

        for (int i = 0; i < n; ++i) {
          const char* c = WiFi.SSID(i).c_str();
          WiFiMulti.addAP(c, "");
          Networks[i] = c;

          M5.Lcd.setCursor(10, (i + 2) * 10);
          M5.Lcd.print(i + 1);
          M5.Lcd.print(": ");
          M5.Lcd.print(WiFi.SSID(i));
          M5.Lcd.print(" (");
          M5.Lcd.print(WiFi.RSSI(i));
          M5.Lcd.print(")");
          M5.Lcd.println((WiFi.encryptionType(i) == WIFI_AUTH_OPEN) ? " " : "*");
          M5.Beep.beep();
          delay(200);
          M5.Beep.mute();
        }

        for (int i = 0; i < sizeof(Networks); ++i) {

          WiFiMulti.addAP(Networks[i], "");
          delay(200);

          if (WiFiMulti.run() == WL_CONNECTED) {
            M5.Lcd.setCursor(10, 10);
            M5.Lcd.fillScreen(BLUE);
            M5.Lcd.println(WiFi.localIP());
            Connected = true;
            Screen = 5;
            break;
          }

          if (M5.BtnB.read() || M5.BtnA.read()) {
            break;
          }
        }
      }
    }
  }
}

void Programs() {
  if (ButtonB == 1) {
    Program1();
    Program2();
    Program3();
    Program4();
    Program5();
  }

  MainMenu();
}

void ScreenDirection() {
  M5.Imu.getAccelData(&accX, &accY, &accZ);
  if (accX + 0.1 > accY) {
    M5.Lcd.setRotation(1);
  } else {
    M5.Lcd.setRotation(0);
  }
}

void WebSite() {
  WiFiClient client = server.available();

  if (client) {
    Serial.println("New Client.");
    String currentLine = "";
    while (client.connected()) {
      if (client.available()) {
        char c = client.read();
        Serial.write(c);
        header += c;
        if (c == '\n') {
          if (currentLine.length() == 0) {

            client.println("HTTP/1.1 200 OK");
            client.println("Content-type:text/html");
            client.println("Connection: close");
            client.println();
            // Display the HTML web page
            client.println("<!DOCTYPE html><html>");
            client.println("<head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">");
            client.println("<link rel=\"icon\" href=\"data:,\">");
            // CSS to style the on/off buttons
            client.println("<style>html { font-family: Helvetica; display: inline-block; margin: 0px auto; text-align: center;}");
            client.println(".button { background-color: #4CAF50; border: none; color: white; padding: 16px 40px;");
            client.println("text-decoration: none; font-size: 30px; margin: 2px; cursor: pointer;}");
            client.println(".button2 {background-color: #555555;}</style></head>");

            // Web Page Heading
            client.println("<body><h1>ESP32 Web Server</h1>");
          }
        }
      }
    }
  }
  
  header = "";
  
  client.stop();
  Serial.println("Client disconnected.");
  Serial.println("");
}

void loop() {

  Window(0, 1);
  Window(1, 2);
  Window(2, 4);
  Window(4, 5);
  Window(5, 0);
  ScreenDirection();

  M5.Beep.mute();

  Menu();
  Programs();

  M5.update();
  
}
