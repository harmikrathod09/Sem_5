#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266_SSL.h>

char ssid[] = "A-308";
char pass[] = "dietdu@2024";

void setup() {
  // put your setup code here, to run once:
  pinMode(D3, OUTPUT);
  pinMode(D5, INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  digitalWrite(D3, LOW);
  delayMicroseconds(5);
  digitalWrite(D3, HIGH);
  delayMicroseconds(10);

  long int duration=pulseIn(D5,HIGH);
  float cm=0.0343*duration;

  Serial.println(cm);
}
