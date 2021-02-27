#include <Adafruit_SSD1306.h>

Adafruit_SSD1306 display(4);
int adc_id = 0;
int HistoryValue = 0;
char printBuffer[128];

void setup() {

  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);

}

void loop() {
  int value = analogRead(adc_id); // get adc value

  if (((HistoryValue >= value) && ((HistoryValue - value) > 10)) || ((HistoryValue < value) && ((value - HistoryValue) > 10)))
  {

    sprintf(printBuffer, "Water%d level is %d\n", adc_id, value);

    display.clearDisplay();
    display.setTextColor(WHITE);
    display.setCursor(1, 1);
    display.println(printBuffer);
    display.display();
    HistoryValue = value;
  }



}
