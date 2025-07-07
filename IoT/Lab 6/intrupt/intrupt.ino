#define LED_PIN D0
#define BTN_PUSH D4

volatile byte ledState = LOW;
volatile bool buttonPressed = false;

void setup()
{
  pinMode(BTN_PUSH, INPUT_PULLUP);
  pinMode(LED_PIN, OUTPUT);
  
  attachInterrupt(digitalPinToInterrupt(BTN_PUSH), blinkled, CHANGE);
  Serial.begin(9600);
}

void loop()
{
  if (buttonPressed) {
    ledState = !ledState;
    digitalWrite(LED_PIN, ledState);
    buttonPressed = false;
  }
}

void blinkled() {
  buttonPressed = true;
}
