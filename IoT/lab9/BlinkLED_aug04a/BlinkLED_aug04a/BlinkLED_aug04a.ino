#include "arduino_secrets.h"
#include "thingProperties.h"

const int ledPin = D4;     // LED connected to digital pin 9
const int sensorPin = D5;  // Sensor connected to digital pin 5

int motionVal = 0;
bool motionState = false;

void setup() {
  // Start serial
  Serial.begin(9600);
  delay(1500); // Wait for serial monitor

  // Initialize Cloud properties
  initProperties();

  // Pin Modes
  pinMode(ledPin, OUTPUT);
  pinMode(sensorPin, INPUT);

  // Connect to Arduino Cloud
  ArduinoCloud.begin(ArduinoIoTPreferredConnection);

  setDebugMessageLevel(2);
  ArduinoCloud.printDebugInfo();
}

void loop() {
  ArduinoCloud.update(); // Keep Cloud connection alive

  // Read sensor
  motionVal = digitalRead(sensorPin);

  if (motionVal == HIGH) {
    digitalWrite(ledPin, HIGH);
    delay(500);
    if (!motionState) {
      Serial.println("Motion detected");
      motionState = true;
    }
  } else {
    digitalWrite(ledPin, LOW);
    delay(500);
    if (motionState) {
      Serial.println("Motion stopped");
      motionState = false;
    }
  }
}

// Called when cloud variable `lED` is changed
void onLEDChange() {
  digitalWrite(ledPin, lED ? HIGH : LOW);
}

// Called when cloud variable `switchBtn` is toggled
void onSwitchBtnChange() {
  digitalWrite(ledPin, !digitalRead(ledPin));
}
