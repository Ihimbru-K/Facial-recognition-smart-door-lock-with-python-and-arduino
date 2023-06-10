#include <Servo.h>

Servo myservo;
int value;
double angle;

void setup() 
{
  Serial.begin(9600);
  myservo.attach(9);
}

void loop() 
{
  if (Serial.available() > 0) {
    int incomingByte = Serial.read();
    if (incomingByte == '1') {
      myservo.write(360);
    } else if (incomingByte == '0') {
      myservo.write(0);
    }
  }
}
