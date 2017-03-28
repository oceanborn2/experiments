  int pin = 1;

void setup()
{
  pinMode(pin, OUTPUT);
}

void loop()
{
  for (int i=1; i<=6; i++) {
    digitalWrite(i, HIGH);
    delay(1000);
    digitalWrite(i, LOW);
    
  }
}

