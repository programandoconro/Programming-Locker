int led1 = 1;
int led2 = 2;
int led3 = 3;
int led4 = 4;

void setup() {
  for(int i = 1; i<5;i++)
    pinMode(i, OUTPUT);
   
}

void unit(int led) {
  digitalWrite(led, HIGH);  
  delay(random(10,100));
  digitalWrite(led, LOW);    

}
void loop() {
  unit(led1);         
  unit(led2);
  unit(led3);
  unit(led4);

}
