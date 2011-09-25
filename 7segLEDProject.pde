/*
LED Countdown clock
http://www.ryanosullivan.ca/?p=239
Project by Ryan O'Sullivan
*/
 #define button 13
 #define speaker 12
 
 // Buzzer Library
 // Care of http://www.faludi.com/2007/04/23/buzzer-arduino-example-code/
 void buzz(int targetPin, long frequency, long length) {
  long delayValue = 1000000/frequency/2; // calculate the delay value between transitions
  //// 1 second's worth of microseconds, divided by the frequency, then split in half since
  //// there are two phases to each cycle
  long numCycles = frequency * length/ 1000; // calculate the number of cycles for proper timing
  //// multiply frequency, which is really cycles per second, by the number of seconds to 
  //// get the total number of cycles to produce
 for (long i=0; i < numCycles; i++){ // for the calculated length of time...
    digitalWrite(targetPin,HIGH); // write the buzzer pin high to push out the diaphram
    delayMicroseconds(delayValue); // wait for the calculated delay value
    digitalWrite(targetPin,LOW); // write the buzzer pin low to pull back the diaphram
    delayMicroseconds(delayValue); // wait againf or the calculated delay value
  }
 }
 
// LED rendering library
// Wiring - From LED Anodes 1-10 to Arduino outputs D00-D08.  Anodes 3 and 8 to voltage
// Comon Anodes: 3 & 8
// A: 7
// B: 6
// C: 4
// D: 2
// E: 1
// F: 9
// G: 10
// DP: 5 
// Wiring document for RED 7 seg LED http://www.sparkfun.com/datasheets/Components/YSD-160AR4B-8.pdf
// Audrino Wiring map
// A: 7
// B: 5
// C: 3
// D: 2
// E: 1
// F: 6
// G: 8
// DP: 3 
// By Ryan O'Sullivan
// Last updated 20/01/2010

void renderClear(){
  digitalWrite(8, HIGH);
  digitalWrite(1, HIGH);
  digitalWrite(2, HIGH);
  digitalWrite(3, HIGH);
  digitalWrite(4, HIGH);
  digitalWrite(4, HIGH);
  digitalWrite(5, HIGH);
  digitalWrite(6, HIGH);
  digitalWrite(7, HIGH);
}
void renderAll(){
  digitalWrite(8, LOW);
  digitalWrite(1, LOW);
  digitalWrite(2, LOW);
  digitalWrite(3, LOW);
  digitalWrite(4, LOW);
  digitalWrite(5, LOW);
  digitalWrite(6, LOW);
  digitalWrite(7, LOW);
}
void render0(){
  digitalWrite(7, LOW);
  digitalWrite(6, LOW);
  digitalWrite(3, LOW);
  digitalWrite(2, LOW);
  digitalWrite(1, LOW);
  digitalWrite(5, LOW);
}
void render1(){
  digitalWrite(5, LOW);
  digitalWrite(3, LOW);
}
void render2(){
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(8, LOW);
  digitalWrite(1, LOW);
  digitalWrite(2, LOW);
}
void render3(){
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(8, LOW);
  digitalWrite(3, LOW);
  digitalWrite(2, LOW);
}
void render4(){
  digitalWrite(6, LOW);
  digitalWrite(8, LOW);
  digitalWrite(5, LOW);
  digitalWrite(3, LOW);
}
void render5(){
  digitalWrite(7, LOW);
  digitalWrite(6, LOW);
  digitalWrite(8, LOW);
  digitalWrite(3, LOW);
  digitalWrite(2, LOW);
}
void render6(){
  digitalWrite(7, LOW);
  digitalWrite(6, LOW);
  digitalWrite(8, LOW);
  digitalWrite(3, LOW);
  digitalWrite(2, LOW);
  digitalWrite(1, LOW);
}
void render7(){
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(3, LOW);
}
void render8(){
  digitalWrite(8, LOW);
  digitalWrite(1, LOW);
  digitalWrite(2, LOW);
  digitalWrite(3, LOW);
  digitalWrite(5, LOW);
  digitalWrite(6, LOW);
  digitalWrite(7, LOW);
}
void render9(){
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(8, LOW);
  digitalWrite(6, LOW);
  digitalWrite(3, LOW);
}

void renderCountdown(){
  renderClear();
  render9();
  delay(1000);
  renderClear();
  render8();
  delay(1000);
  renderClear();
  render7();
  delay(1000);
  renderClear();
  render6();
  delay(1000);
  renderClear();
  render5();
  delay(1000);
  renderClear();
  render4();
  delay(1000);
  renderClear();
  render3();
  delay(1000);
  renderClear();
  render2();
  delay(1000);
  renderClear();
  render1();
  delay(1000);
  renderClear();
  render0();
  delay(1000);
  renderClear();
}

// Main Program
int val = 0;
int oldVal = 0;
int state = 0;

void setup()   {                
  // initialize the digital pin as an output:
  pinMode(8, OUTPUT);
  pinMode(1, OUTPUT);   
  pinMode(2, OUTPUT); 
  pinMode(3, OUTPUT); 
  pinMode(4, OUTPUT); 
  pinMode(5, OUTPUT); 
  pinMode(6, OUTPUT); 
  pinMode(7, OUTPUT); 
  pinMode(button, INPUT);
  pinMode(speaker, OUTPUT);
}

void loop()                     
{
  val = digitalRead(button);
  renderClear;
  if ((val == HIGH) && (oldVal == LOW)){
    state = 1 - state;  
    delay(10);
  }
  
  oldVal = val;
  
  if (state == 1) {
    renderCountdown();
    buzz(speaker, 2500, 1000);
    state = 0;
  }    
}

