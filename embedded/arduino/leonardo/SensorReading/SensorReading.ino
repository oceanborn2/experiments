void setup()
{
}

void loop() {
    int sensorReading = analogRead(A0);
    Serial.print("A0:");
    Serial.println(sensorReading);
    sensorReading = analogRead(A1);
    Serial.print("A1:");
    Serial.println(sensorReading);
    if (sensorReading > 292) {
      digitalWrite(13, HIGH);
      delay(10);
      digitalWrite(13, LOW);
    }
    delay(200);
}
