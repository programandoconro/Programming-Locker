// Arduino Mega

int leds[18] = { 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39 };

void setup() {

  for (int jj; jj < sizeof(leds) / sizeof(int); jj++) {
    pinMode(leds[jj], OUTPUT);
    delay(10);
  }
}

void loop() {

  for (int jj; jj < sizeof(leds) / sizeof(int); jj++) {
    digitalWrite(leds[jj], HIGH);
      delay(random(0, 100));
  }
  delay(random(20, 200));
 
  for (int jj; jj < sizeof(leds) / sizeof(int); jj++) {
    digitalWrite(leds[jj], LOW);
    delay(random(0, 100));
  } 
  delay(random(20, 200));

  digitalWrite(leds[random(0,sizeof(leds)/sizeof(int))],HIGH);
  delay(random(20,200));
  digitalWrite(leds[random(0,sizeof(leds)/sizeof(int))],LOW);


}
