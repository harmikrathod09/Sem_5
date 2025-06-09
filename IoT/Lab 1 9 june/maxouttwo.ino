void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  
  int a=10, b=20;
  
  if(a>b){
  	Serial.println("a is max");
  }
  else{
    Serial.println("b is max");
  }
}

void loop() {
  // put your main code here, to run repeatedly:
  
}
