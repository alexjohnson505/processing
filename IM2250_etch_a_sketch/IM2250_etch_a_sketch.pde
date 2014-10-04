// Alex Johnson 10/6/15
// IM 2250 - Programming for Digital Media
// Assignment 04 - Processing 2 Exploration

/**********************************************
 Etch a Sketch
 A UI element for emulating the interactivity
 of the classic toy. 
 
 Press 'A' to enable the left dial.
 Press 'D' to enable the right dial.
 Press 'W' or 'S' to move
  
 **********************************************/
 
final int windowWidth = 600;
final int windowHeight = 450;

// Define default offset to use
final float offset = 50;
final float speed = 10;

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

void keyPressed(){
  etchy.keyPress(true);
}

void keyReleased(){
  etchy.keyPress(false);
}

void mousePressed (){
  etchy.mousePressed();
}

// Listener for mouse drag
void mouseDragged() {
  etchy.sketch();
}

class EtchASketch {
  float x;   // center of the draw cursor
  float y;   // center of the draw cursor
  float px;  // previous center of the draw cursor
  float py;  // previous center of the draw cursor
  
  String direction;  // Set direction of the last selected knob
  float velocity;    // Set movement velocity
  
  Knob leftKnob;     // Left Knob
  Knob rightKnob;    // Right Knob
   
  EtchASketch () {
    leftKnob  = new Knob(offset, windowHeight - offset, "horizontal");
    rightKnob = new Knob(windowWidth - offset, windowHeight - offset, "vertical");
    x = windowWidth / 2;
    y = (windowHeight - offset) / 2;
    px = x;
    py = y;
    direction = "horizontal"; // Default
    velocity = 0;
  }
  
  void init(){
    // EtchASketch Background
    fill(200, 200, 200);
    rect(50, 50, 500, 300);
    
    int xText = 100;
    int yText = windowHeight - 75;
    
    textSize(18);
    fill(200, 202, 153);
    
    text("Etch a Sketch Emulator using key presses", xText, yText);
    text("Use 'A' and 'D' to toggle movement direction", xText, yText + 20);
    text("Use 'W' and 'S' to move the cursor", xText, yText + 40);
  }
  
  void keyPress(boolean keyDown){
    println(keyDown);
    
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
      if (key == 'w'){
        velocity = 1;
      }else if (key == 's'){
        velocity = -1;
      } else {
        velocity = 0;
    } else {
      velocity = 0;
    }
  }
  
  void setDirection(String d){
    direction = d;
  }
  

  void draw() {
    float i = velocity * speed;
    px = x;
    py = y;
    
    if (direction == "horizontal"){
      x = x + i;
    }
    
    if (direction == "vertical"){
      y = y + i;
    }
    
    stroke(255);

    fill(0, 0, 0);
    ellipse(x, y, 10, 10); // Demo cursor
    stroke(255);
    
    
    line(px, py, x, y);
    
    leftKnob.draw(direction);
    rightKnob.draw(direction);

//    fill(250,250, 250);
//    text("Currently selected direction: " + direction, 100, windowHeight - 15);
    
    
  }
  
  void reset(){
    fill(200, 200, 200);
    rect(50, 50, 500, 300); 
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
    
    ellipse(x, y, 50, 50);
  }
}
