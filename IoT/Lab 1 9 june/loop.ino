void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  int i=1;
}

void loop() {
  // put your main code here, to run repeatedly:
  if(i<100){
  	Serial.println(i);
    i++;
  }
}
