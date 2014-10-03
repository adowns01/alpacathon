/**
 * Keyboard. 
 * 
 * Click on the image to give it focus and press the letter keys 
 * to create forms in time and space. Each key has a unique identifying 
 * number. These numbers can be used to position shapes in space. 
 */
import processing.video.*;

import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
String itemName = "superCuteAlpacaUpper";

Capture cam;

int rectWidth;
int count = 0;
   
void setup() {
  size(640, 360);
  noStroke();
  background(0);
  rectWidth = width/4;
  
  print(Serial.list());
  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);

  
  String[] cameras = Capture.list();

  if (cameras == null) {
    println("Failed to retrieve the list of available cameras, will try the default...");
    cam = new Capture(this, 640, 480);
  } if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }

    // The camera can be initialized directly using an element
    // from the array returned by list():
    cam = new Capture(this, cameras[0]);
    // Or, the settings can be defined based on the text in the list
    //cam = new Capture(this, 640, 480, "Built-in iSight", 30);
    
    // Start capturing the images from the camera
    cam.start();
  }
}

void draw() { 
  // keep draw() here to continue looping while waiting for keys
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
   if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
    if ( val == 84){    
    print(val);
    print("*");
    saveScreen();
    }
  }
}

void saveScreen() {
  saveFrame("data/"+ itemName +"/" + itemName + count + ".jpg"); 
  count++;
}


