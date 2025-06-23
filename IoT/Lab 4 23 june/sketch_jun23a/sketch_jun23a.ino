void setup()
{
  pinMode(13, OUTPUT);
  pinMode(12, INPUT);
  Serial.begin(9600);
}

void loop()
{
  if(digitalRead(12)){
  	digitalWrite(13, HIGH);
    Serial.println("On");
  }
  else{
  	digitalWrite(13, LOW);
    Serial.println("Off");
  }
} 