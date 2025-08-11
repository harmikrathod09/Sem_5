// C++ code
//

#include<SoftwareSerial.h>
SoftwareSerial port(D5,D4);

void setup()
{
Serial.begin(9600);
 port.begin(9600);
}

void loop()
{
      String name;
  
    if(Serial.available() > 0){
       name = Serial.readString();
    }
    port.print(name);
}