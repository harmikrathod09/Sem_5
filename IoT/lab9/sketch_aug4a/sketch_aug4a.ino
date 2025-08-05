void setup() {
  // put your setup code here, to run once:
  pinMode(D5, INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

  if(digitalRead(D5)){
    Serial.println("Motion Detected");
  }
  else{
    Serial.println("Motion Not detected");
  }

  delay(1000);
}
