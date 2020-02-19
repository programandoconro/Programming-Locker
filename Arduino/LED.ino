int led = 1;
int led2 = 2;
int led3 = 3;
int led4 = 4;
int time = 1000;

void setup() {
  for(int i = 1; i<5;i++)
    pinMode(i, OUTPUT);
   
}
void unit(int l) {
  digitalWrite(l, HIGH);  
  delay(time);  
  digitalWrite(l, LOW);    
  delay(time);  

}
void loop() {
  unit(led);         
  unit(led2);
  unit(led3);
  unit(led4);

}
