int const upperPin = 2;
int const lowerPin = 4;
int const ledPin = 13;
int const motorPin = 9;

int const upperDuration = 30;  //in ms
int const lowerDuration = 20;  //in ms
int const upperPicture = 10;   //in # of pics
int const lowerPicture = 15;   //in # of pics


void setup() {
  Serial.begin(9600);    //connect serial port
  pinMode(upperPin, INPUT);  //set up digital pin direction
  pinMode(lowerPin, INPUT);  
  pinMode(motorPin, OUTPUT);
  pinMode(ledPin, OUTPUT);   
  digitalWrite(ledPin, LOW);
}

void loop() {
  if (digitalRead(upperPin) == HIGH) {
        
    // debug turn on led for 1 second
    digitalWrite(ledPin, HIGH);
    
    for(int i=1; i<=upperPicture; i++) {
      // move motor here
      digitalWrite(motorPin, HIGH);
      delay(upperDuration);
      digitalWrite(motorPin, LOW);
      delay(1000);
      Serial.print("Take Picture Upper #");
      Serial.println(i);
      
    }
    digitalWrite(ledPin, LOW);  
  }
  
  if (digitalRead(lowerPin) == HIGH) {

    // debug turn on led for 1 second
    digitalWrite(ledPin, HIGH);
    
    for(int i=1; i<=lowerPicture; i++) {
      digitalWrite(motorPin, HIGH);
      delay(lowerDuration);
      digitalWrite(motorPin, LOW);
      delay(1000);
      Serial.print("Take Picture Low #");
    Serial.println(i);
    }
    
    digitalWrite(ledPin, LOW);  
  }
  
}


