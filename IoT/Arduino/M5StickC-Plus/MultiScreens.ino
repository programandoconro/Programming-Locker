#include <M5StickCPlus.h>

int ButtonA = 0;
int Screen = 0;

void setup() {

  M5.begin();
  Serial.begin(9600);


}

void loop() {
  if (M5.BtnA.read() && ButtonA == 0) {

    M5.Beep.beep();
    ButtonA = 1;
    Screen = 0;
    delay(200);
  }

  if (M5.BtnA.read() && ButtonA == 1) {

    M5.Beep.beep();
    ButtonA = 2;
    Screen = 1;
    delay(200);
  }

  if (M5.BtnA.read() && ButtonA == 2) {

    M5.Beep.beep();
    ButtonA = 0;
    Screen = 2;
    delay(200);
  }

  if (M5.BtnB.read()) {

    M5.Beep.beep();
    Screen = 3;
    delay(200);
  }

  if (Screen == 0) {
    M5.Lcd.fillScreen(GREEN);
  }
  if (Screen == 1) {
    M5.Lcd.fillScreen(BLUE);
  }
  if(Screen == 2){
      M5.Lcd.fillTriangle(random(M5.Lcd.width()-1), random(M5.Lcd.height()-1), random(M5.Lcd.width()-1), random(M5.Lcd.height()-1), random(M5.Lcd.width()-1), random(M5.Lcd.height()-1), random(0xfffe));
  }  
  
  if(Screen == 3){
      M5.Lcd.fillScreen(WHITE);
  }


  M5.Beep.mute();
  M5.update();

   

 
}
