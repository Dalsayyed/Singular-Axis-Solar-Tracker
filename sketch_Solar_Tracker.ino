#include <Servo.h>     // Library used for servo control

Servo myservo;
int pos = 90; 
int tolerance = 20;

void setup() {
  Serial.begin(9600); 
  
  // MG996R standard pulse width range
  myservo.attach(9, 500, 2400); 
}

void loop() {
  int Vout_L = analogRead(A2);
  int Vout_R = analogRead(A3);

  Serial.print("Left V_out = ");  
  Serial.print((Vout_L*5.0)/1024.0);  
  Serial.print(" , ");  
  Serial.print("Right V_out = ");  
  Serial.println((Vout_R*5.0)/1024.0);
  
  // If Right is brighter
  if (Vout_R > (Vout_L - tolerance)) {
    if (pos < 175) pos += 2; // Move right (safe upper limit)
  } 
  // If Left is brighter
  else if (Vout_L > (Vout_R - tolerance)) {
    if (pos > 5) pos -= 2;   // Move left (safe lower limit)
  }

  myservo.write(pos);
  delay(50); // Controls the update speed
}





