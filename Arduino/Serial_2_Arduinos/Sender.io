#include <SoftwareSerial.h>

void setup() {
  Serial1.begin(9600);
  Serial.begin(9600);
 
}

void loop() {

  Serial1.print(0);
  Serial.println(0);
  delay(1000);
 
  Serial1.print(1);
  Serial.println(1);
  delay(1000);

  Serial1.print(2);
  Serial.println(2);
  delay(1000);

}
