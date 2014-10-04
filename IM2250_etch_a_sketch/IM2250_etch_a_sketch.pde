// Alex Johnson 10/6/15
// IM 2250 - Programming for Digital Media
// Assignment 04 - Processing 2 Exploration

/**********************************************
              Etch a Sketch
            Re-usable UI Element
            
 Etch a Sketch is a User Interface element made
 in processing 2.0 to emulate the interactivity
 for an Etch a Sketch, the classic children's toy
 
 Interact using the following keyboard keys:
 
  - Press 'A' to enable the left dial.
  - Press 'D' to enable the right dial.
  - Press 'W' or 'S' to move
  
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
// children's toy. Using keyboard keys, the user can move the cursor
// and draw shapes. I've attempted to mimic the uique interface of an
// etch a sketch. Etch a sketches are captivating due to the movement 
// limitations the impose. I've emulated this through forcing the user
// to navigate via the use of a.) toggling direction and b.) toggling 
// movement. 

class EtchASketch {
  float x;   // position of the draw cursor
  float y;   // position of the draw cursor
  float px;  // previous position of the draw cursor
  float py;  // previous position of the draw cursor
  
  String direction;  // Current direction of movement
  float velocity;    // Set movement velocity
  
  Knob leftKnob;     // Left Knob
  Knob rightKnob;    // Right Knob
   
  EtchASketch () {
    // Define locations/directions of knobs
    leftKnob  = new Knob(offset, windowHeight - offset, "horizontal");
    rightKnob = new Knob(windowWidth - offset, windowHeight - offset, "vertical");
    
    // Define cursor (drawing) position
    x = windowWidth / 2;
    y = (windowHeight - offset) / 2;
    
    // Defaults
    direction = "horizontal"; 
    velocity = 0;
  }
  
  // Run prior to drawing. Initializes the 
  // wrapper and the instructions
  void init(){
    
    // EtchASketch Background
    fill(200, 200, 200);
    rect(50, 50, 500, 300);
    
    int xText = 100;
    int yText = windowHeight - 75;
    
    textSize(18);
    fill(200, 202, 153);
    
    text("Etch-a-Sketch Emulator using key presses", xText, yText);
    text("Use 'A' and 'D' to toggle movement direction", xText, yText + 20);
    text("Use 'W' and 'S' to move the cursor", xText, yText + 40);
  }
  
  // Responder to key events. Takes in a boolean
  // representing wether or now a key is currently
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
    
    // Set velcocity
    if (keyDown){
      // Forward velocity
      if (key == 'w'){
        velocity = 1;
      // Backward velocity
      }else if (key == 's'){
        velocity = -1;
      } else {
        velocity = 0;
      }
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
      
      if (withinBounds(x2, y)){
        x = x2;
      }
    }
      
    if (direction == "vertical"){
      float y2 = y + i;
      
      if (withinBounds(x, y2)){
        y = y2;
      }
    }
    
    
    stroke(255);

    fill(0, 0, 0);
    ellipse(x, y, 10, 10); // Demo cursor
    stroke(255);
    
    leftKnob.draw(direction);
    rightKnob.draw(direction);
  }
  
  void reset(){
    fill(200, 200, 200);
    rect(50, 50, 500, 300); 
  }
  
  boolean withinBounds(float x, float y){
    float xMin = 50;
    float xMax = 550;
    float yMin = 50;
    float yMax = 350;
    println("x: " + x + " | y: " + y);
    return x > xMin && x < xMax && y > yMin && y < yMax;
    
//    rect(50, 50, 500, 300);
    
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
