/*************************************************************
  Blynk is a platform with iOS and Android apps to control
  ESP32, Arduino, Raspberry Pi and the likes over the Internet.
  You can easily build mobile and web interfaces for any
  projects by simply dragging and dropping widgets.

    Downloads, docs, tutorials: https://www.blynk.io
    Sketch generator:           https://examples.blynk.cc
    Blynk community:            https://community.blynk.cc
    Follow us:                  https://www.fb.com/blynkapp
                                https://twitter.com/blynk_app

  Blynk library is licensed under MIT license
  This example code is in public domain.

 *************************************************************
  This example runs directly on ESP8266 chip.

  NOTE: This requires ESP8266 support package:
    https://github.com/esp8266/Arduino

  Please be sure to select the right ESP8266 module
  in the Tools -> Board menu!

  Change WiFi ssid, pass, and Blynk auth token to run :)
  Feel free to apply it to any other example. It's simple!
 *************************************************************/

/* Comment this out to disable prints and save space */
#define BLYNK_PRINT Serial

/* Fill in information from Blynk Device Info here */
//#define BLYNK_TEMPLATE_ID           "TMPxxxxxx"
//#define BLYNK_TEMPLATE_NAME         "Device"
//#define BLYNK_AUTH_TOKEN            "YourAuthToken"

#define BLYNK_TEMPLATE_ID "TMPL3zCzXgoN0"
#define BLYNK_TEMPLATE_NAME "sensorSwitch"
#define BLYNK_AUTH_TOKEN "LimKqtkU5VsfXPZ32fFYIiVG2WS4nKcd"

#include <ESP8266WiFi.h>
#include <BlynkSimpleEsp8266.h>

// Your WiFi credentials.
// Set password to "" for open networks.
char ssid[] = "A-308";
char pass[] = "dietdu@2024";

void setup()
{
  // Debug console
  Serial.begin(9600);
  pinMode(D3, OUTPUT);
  pinMode(D5, INPUT);
  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);
}

void loop()
{
  Blynk.run();

  digitalWrite(D3, LOW);
  delayMicroseconds(5);
  digitalWrite(D3, HIGH);
  delayMicroseconds(10);

  long int duration=pulseIn(D5,HIGH);
  float cm=0.0343*duration;

  Serial.print(cm);

  Blynk.virtualWrite(V0, cm);

}

