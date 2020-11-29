//programandoconro
//2020.11.29

/************************
  DC motor using the L293D chip and the PIR 501 motion sensor
************************/

#define ENABLE 5
#define DIRA 3
#define DIRB 4

int pirPin = 2;
int pirStatus = 0; 
                 
void setup() {
  pinMode(ENABLE, OUTPUT);
  pinMode(DIRA, OUTPUT);
  pinMode(DIRB, OUTPUT);
  Serial.begin(9600);
}

void loop() {

  pirStat = digitalRead(pirPin);
  if (pirStatus == HIGH) {
   
    Serial.println("Motion Detected, motor started");
    digitalWrite(ENABLE, HIGH); 
    digitalWrite(DIRA, HIGH); 
    digitalWrite(DIRB, LOW);
    delay(1000);
    digitalWrite(DIRB, HIGH); 
    digitalWrite(DIRA, LOW);
    delay(1000);

  }
  else {
    digitalWrite(ENABLE, LOW); 
  }
}
