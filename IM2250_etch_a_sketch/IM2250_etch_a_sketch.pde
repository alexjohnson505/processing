// Alex Johnson 10/6/15
// IM 2250 - Programming for Digital Media
// Assignment 04 - Processing 2 Exploration

/**********************************************
              Etch a Sketch
            Re-usable UI Element
            
 Etch a Sketch is a User Interface element made
 in processing 2.0 to emulate the interactivity
 of the classic children's toy.

 This UI element attempts to emulate the interactivity
 of an etch a sketch. Etch a Sketches are iteresting 
 in the way they limit movement. Instead of a traditional
 2D movement scheme (up, down, left, right), each dial
 represents a direction of movement (horizontal/vertical),
 and spinning the dial represents the velocity. 
 
 Interact with this UI element using the following keys:
  - Press 'A' to enable the left dial (horizontal movement)
  - Press 'D' to enable the right dial (vertical movement)
  - Press 'W' or 'S' to adjust velocity (forwards, backwards)
  
 **********************************************/
 
final int windowWidth = 600;
final int windowHeight = 450;

// Define default offset to use
final float offset = 50;

// Define movement speed
final float speed = 3;

// Initialize a new EtchASketch
EtchASketch etchy = new EtchASketch();

void setup() {
  size(windowWidth, windowHeight);
  background(178, 34, 34);
  etchy.init();
}

void draw() {
  etchy.draw();
}

// Keyboard listener
void keyPressed(){
  etchy.keyPress(true);
}

// Keyboard listener
void keyReleased(){
  etchy.keyPress(false);
}

// EtchASketch defines the UI element for emulating the classic
// children's toy. Using keyboard keys, the user can move the 
// point at which it draws lines.

class EtchASketch {
  float x;   // position of the draw cursor
  float y;   // position of the draw cursor
  
  float width;  // width of screen;
  float height; // height of screen;
  
  String direction;  // Current direction of movement
  float velocity;    // Set movement velocity
  
  Knob leftKnob;     // Left Knob
  Knob rightKnob;    // Right Knob
   
  EtchASketch () {
    
    // Define locations/directions of knobs
    leftKnob  = new Knob(offset, windowHeight - offset, "horizontal");
    rightKnob = new Knob(windowWidth - offset, windowHeight - offset, "vertical");
    
    // Define screen size
    width = windowWidth - 100;
    height = windowHeight - 150;
    
    // Define cursor (drawing) position
    x = windowWidth / 2;
    y = (windowHeight - offset) / 2;
    
    // Defaults
    direction = "horizontal"; 
    velocity = 0;
  }
  
  // Run prior to drawing. Initializes the 
  // wrapper and the instructional text
  void init(){
    
    // EtchASketch Background
    fill(200, 200, 200);
    rect(50, 50, width, height);
    
    // Local vars for text positioning
    int xText = 100;
    int yText = windowHeight - 65;
    
    textSize(18);
    fill(200, 202, 153);
    
    text("Etch-a-Sketch Emulator", xText, yText);
    text("Use 'A' and 'D' to toggle direction", xText, yText + 20);
    text("Use 'W' and 'S' to move", xText, yText + 40);
  }
  
  // Responder to key events. Takes in a boolean
  // representing whether or not a key is currently
  // pressed down.
  void keyPress(boolean keyDown){
    
    // Activate left knob
    if (key == 'a'){
      etchy.setDirection("horizontal");
    }
    
    // Activate right knob
    if (key == 'd'){
      etchy.setDirection("vertical");
    }
    
    // Set velcocity on key press
    if (keyDown){
      
      // Forward velocity
      if (key == 'w'){
        velocity = 1;
      
      // Backward velocity
      } else if (key == 's'){
        velocity = -1;
        
      // Don't move for other keys
      } else {
        velocity = 0;
      }
    
    // Disable velocity on key release
    } else {
      velocity = 0;
    }
  }
  
  void setDirection(String d){
    direction = d;
  }
  
  void draw() {
    float i = velocity * speed;
    
    if (direction == "horizontal"){
      float x2 = x + i;
      
      // Check bounds
      if (withinBounds(x2, y)){
        x = x2;
      }
    }
      
    if (direction == "vertical"){
      float y2 = y + i;
      
      // Check bounds
      if (withinBounds(x, y2)){
        y = y2;
      }
    }
    
    stroke(255);
    fill(0, 0, 0);
    
    // Draw
    ellipse(x, y, 10, 10);
    
    leftKnob.draw(direction);
    rightKnob.draw(direction);
  }
  
  void reset(){
    fill(200, 200, 200);
    rect(50, 50, width, height); 
  }
  
  // Ensure drawing cursor remains 
  // within drawable area 
  boolean withinBounds(float x, float y){
    float lineWidth = 4;
    float xMin = 0 + offset + lineWidth;
    float xMax = width + offset - lineWidth;
    float yMin = 0 + offset + lineWidth;
    float yMax = height + offset - lineWidth;
    return x > xMin && x < xMax && y > yMin && y < yMax;
  }
}

class Knob {
  float x;   // x position
  float y;   // y position
  String direction;  // direction this knob effects
  
  Knob(float ax, float ay, String adirection){
    x = ax;
    y = ay;
    direction = adirection;
  }
  
  void draw(String currentKnob){
    
    // Provide UI feedback for active knob
    if (currentKnob == direction){
      fill(255, 255, 255);
    } else {
      fill(10, 10, 10);
    }
    
    strokeWeight(2);    
    ellipse(x, y, 50, 50);
    ellipse(x, y, 40, 40);
    strokeWeight(1);
  }
}
