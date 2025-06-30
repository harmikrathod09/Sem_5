int brightness = 0;
int fadeAmount = 5;

void setup() {
  pinMode(D2, OUTPUT);    // LED pin
  pinMode(D4, INPUT);     // Obstacle sensor pin
  Serial.begin(9600);
}

void loop() {
  bool obstacleDetected = digitalRead(D4);
  Serial.println(obstacleDetected);
  if (obstacleDetected) {
    digitalWrite(D2, HIGH);
    delay(1000);
    digitalWrite(D2, LOW);
    delay(1000);
  } else {
    analogWrite(D2, brightness);
    brightness += fadeAmount;

    if (brightness <= 0 || brightness >= 255) {
      fadeAmount = -fadeAmount;
    }

    delay(3000);
  }
}
