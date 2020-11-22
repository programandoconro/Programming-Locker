#include <Adafruit_SSD1306.h>
#include <CCS811.h>

Adafruit_SSD1306 display(4);
CCS811 sensor;
int i = 0;

void setup() {
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);

  while (sensor.begin() != 0) {
    Serial.println("failed to init chip, please check if the chip connection is fine");
    delay(1000);
  }

  sensor.setMeasCycle(sensor.eCycle_250ms);

}

void loop() {
  i = i + 1;
  delay(1000);
  if (sensor.checkDataReady() == true) {

    display.clearDisplay();
    display.setTextColor(WHITE);
    display.setCursor(1, 1);
    display.print("CO2: ");
    display.print(sensor.getCO2PPM());
    display.println("ppm.");
    display.print("TVOC: ");
    display.print(sensor.getTVOCPPB());
    display.println("ppb.");
    display.print("s: ");
    display.println(i);
    display.println("ro");
    display.display();

  } else {
    Serial.println("Data is not ready!");
    display.println("Data is not ready!");

  }

  sensor.writeBaseLine(0x847B);

}
