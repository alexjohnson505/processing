// Alex Johnson 10/6/15
// IM 2250 - Programming for Digital Media
// Assignment 04 - Processing 2 Exploration

/**********************************************
 Etch a Sketch
 A UI element for emulating the interactivity
 of the classic toy. 
 
 Press 'A' to enable the left dial.
 Press 'B' to enable the right dial.
 'Click and Drag' your mouse to emulate
 the "turning" of your selected dial 
 **********************************************/
 
final int windowWidth = 600;
final int windowHeight = 450;

final float offset = 50;

EtchASketch etchy = new EtchASketch();

void setup() {
  size(windowWidth, windowHeight);
  background(178, 34, 34);
  etchy.init();
}

void draw() {
  etchy.draw();
}

void reset(){
  fill(200, 200, 200);
  rect(50, 50, 500, 300); 
}

void keyReleased(){
  if (key == 'a'){
    etchy.setDirection("horizontal");
  }
  if (key == 's'){
    etchy.setDirection("vertical");
  }
  
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
  Knob leftKnob;     // Left Knob
  Knob rightKnob;    // Right Knob
  String direction;  // Set direction of the last selected knob 

  EtchASketch () {
    leftKnob  = new Knob(offset, windowHeight - offset, "horizontal");
    rightKnob = new Knob(windowWidth - offset, windowHeight - offset, "vertical");
    x = windowWidth / 2;
    y = (windowHeight - offset) / 2;
    direction = "horizontal"; // Default
  }
  
  void init(){
      // EtchASketch Background
    fill(200, 200, 200);
    rect(50, 50, 500, 300);
  }
  void setDirection(String d){
    direction = d;
  }
  
  // Change path
  void sketch(){
    if (direction == "horizontal"){
      etchy.x = mouseX; 
    }
    
    if (direction == "vertical"){
      etchy.y = mouseY; 
    }
  }

  void draw() {
    stroke(255);

    fill(0, 0, 0);
    ellipse(x, y, 10, 10); // Demo cursor
    
    leftKnob.draw(direction);
    rightKnob.draw(direction);
    
    text(direction, 10, 10);

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
