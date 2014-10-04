// Alex Johnson 10/6/15
// IM 2250 - Programming for Digital Media
// Assignment 04 - Processing 2 Exploration
// Custom Widget

/**********************************************
 Etch a Sketch
 **********************************************/
 
final int windowWidth = 600;
final int windowHeight = 400;

EtchASketch etchy = new EtchASketch();

void setup() {
  size(windowWidth, windowHeight);
  background(255);
}

void draw() {
  etchy.draw();
}


class EtchASketch {
  float x;
  float y;

  EtchASketch() {
    x = 350;
    y = 240;
  }

  void draw() {
    fill(200, 200, 200);
    rect(x - width/2, y - height/2, width, height);
  }
}

