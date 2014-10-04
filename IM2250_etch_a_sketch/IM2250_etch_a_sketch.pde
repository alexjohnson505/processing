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
  background(255);
  
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

class EtchASketch {
  float x;  // center of the draw cursor
  float y;  // center of the draw cursor
  float px; // previous center of the draw cursor
  float py; // previous center of the draw cursor

  EtchASketch() {
//    x = 350;
//    y = 240;
  }

  void draw() {
    x = mouseX;
    y = mouseY;
    px = pmouseX;
    py = pmouseY;
    

    stroke(255);
    if (mousePressed == true) {
      line(x,y,px,py);
    }
  }
}

