/*
  Blink
 Turns on the 4 leds successively - First all of them as setup
 Controller: AVR ISP
 */
 
 // http://provideyourown.com/2012/arduino-leonardo-versus-uno-whats-new/
 

// Pin 13 has an LED connected on most Arduino boards.
// give it a name:
int ledL = 13;
//int ledTx = 22; // A priori, ne peut pas fonctionner car les leds TX et RX sont utilisées pour le premier port série (USB) - Le port série habituel d'Arduino n'est pas relié aux leds TX/RX et devient un port série secondaire
//int ledRx = 8; 
int timer=100;

void blinkALed(int led) {
  digitalWrite(led, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(timer);              // wait for a second
  digitalWrite(led, LOW);   // turn the LED on (HIGH is the voltage level)
}

void blinkAllLeds() {
  for (int i=0; i<4; i++) {
    digitalWrite(ledL,  HIGH);
    //    digitalWrite(ledTx, HIGH);
    //    digitalWrite(ledRx, HIGH);
    delay(100);
    digitalWrite(ledL, LOW);
    //    digitalWrite(ledTx, LOW);
    //    digitalWrite(ledRx, LOW);
    delay(100);
  }
  delay(300);
}
// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pin as an output.
  pinMode(ledL,  OUTPUT);     
  //  pinMode(ledTx, OUTPUT);     
  //  pinMode(ledRx, OUTPUT);     
  //blinkAllLeds();
}

// the loop routine runs over and over again forever:
void loop() {
  blinkAllLeds();
  blinkALed(ledL);
  //  blinkALed(ledTx);
  //  blinkALed(ledRx);
}

