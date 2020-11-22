#include <Adafruit_SSD1306.h>
#include <CCS811.h>

Adafruit_SSD1306 display(4);
CCS811 sensor;
int Max[2] = {0,0};
int Timestamp, i = 0;

void setup() {
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);

  while (sensor.begin() != 0) {
    display.println("failed to init chip, please check if the chip connection is fine");
    delay(1000);
  }
  
  sensor.setMeasCycle(sensor.eCycle_250ms);

}

void loop() {

  delay(1000);
  i = i + 1; 
  if (sensor.checkDataReady() == true) {
    display.clearDisplay();
    display.setTextColor(WHITE);
    display.setCursor(1, 1);
    display.print("CO2: ");
    display.print(sensor.getCO2PPM());
    display.println("ppm");
    display.print("TVOC: ");
    display.print(sensor.getTVOCPPB());
    display.println("ppb");

    if (sensor.getCO2PPM() > Max[0]){
      Max[0] = sensor.getCO2PPM();
      Timestamp = i;
    }

     if (sensor.getTVOCPPB() > Max[1]){
      Max[1] = sensor.getTVOCPPB();
    }

    display.print("Max:");
    display.print(Max[0]);
    display.print("ppm,");
    display.print(Max[1]);
    display.println("ppb");
    display.print("Ts:");
    display.print(Timestamp);
    display.println("s");
    display.display();

  } else {
    display.println("Data is not ready!");
  }

  sensor.writeBaseLine(0x847B);

}
