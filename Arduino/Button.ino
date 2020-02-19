const int buttonPin = 12;     
const int ledPin =  13;     
int buttonState = 0;    

void setup() {
  pinMode(ledPin, OUTPUT);
  pinMode(buttonPin, INPUT);
}

void loop() {
  buttonState = digitalRead(buttonPin);
  if (buttonState == HIGH) {
    for (int i =0; i<100;i++){
    digitalWrite(ledPin, HIGH);
    delay(100 * i);
    digitalWrite(ledPin, LOW);
    delay(100 * i);
    }
  } else {
    digitalWrite(ledPin, LOW);
  }
}
