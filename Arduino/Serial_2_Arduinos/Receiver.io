#include <SoftwareSerial.h>

void setup() {
  Serial1.begin(9600);

}

void loop() {

  while (Serial1.available() > 0) {
    int Data = Serial1.read();
    Serial.println(Data - 48 , DEC);

  }

}
