// Alex Johnson 10/6/15
// IM 2250 - Programming for Digital Media
// Assignment 04 - Processing 2 Exploration
// Custom Widget

/**********************************************
 Etch a Sketch
 **********************************************/
 
final int windowWidth = 600;
final int windowHeight = 450;

EtchASketch etchy = new EtchASketch();

void setup() {
  size(windowWidth, windowHeight);
  background(178, 34, 34);
  
  // EtchASketch Background
  fill(200, 200, 200);
  rect(50, 50, 500, 300);
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
void mousePressed() {
//  println(mouseX);
//  println(mouseY);
  
  
   
}

void mouseDragged() {
    etchy.x = mouseX; 
    etchy.y = mouseY; 
}

void mouseReleased() {
  
}

class EtchASketch {
  float x;  // center of the draw cursor
  float y;  // center of the draw cursor
  float px; // previous center of the draw cursor
  float py; // previous center of the draw cursor
  Knob leftKnob;     // Left Knob
  Knob rightKnob;    // Right Knob
  String direction;  // Set direction of the last selected knob 

  EtchASketch () {
    leftKnob  = new Knob(50, windowHeight - 50, "horizontal");
    rightKnob = new Knob(windowWidth - 50, windowHeight - 50, "vertical");
    x = windowWidth / 2;
    y = (windowHeight - 50) / 2;
    direction = "horizontal";
  }
  
  void setDirection(String d){
    direction = d;
  }

  void draw() {
    stroke(255);

    fill(0, 0, 0);
    ellipse(x, y, 10, 10); // Demo cursor
    
    leftKnob.draw(currentKnob);
    rightKnob.draw(currentKnob);
    
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
