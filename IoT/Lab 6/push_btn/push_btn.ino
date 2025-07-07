void ICACHE_RAM_ATTR blinkled(){
   digitalWrite(D0, HIGH);
}

void setup()
{
  pinMode(D0, OUTPUT);
  pinMode(D4, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(D4), blinkled, CHANGE);
  
}

void loop()
{
    digitalWrite(D0, HIGH);
    delay(1000);
    digitalWrite(D0,  LOW);
    delay(1000);	
}

