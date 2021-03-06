// Alex Johnson 10/6/15
// IM 2250 - Programming for Digital Media
// Assignment 04 - Processing 2 Exploration
// Custom Widget

/**********************************************
 Toaster - A digital UI object for taking user
 input, and simulating a kitchen appliance
 through virtual representation. 
 
 Goal: Create a Unique User Interface Object.
 **********************************************/

final int windowWidth = 600;
final int windowHeight = 400;

// Init new Toaster
Toaster toaster = new Toaster();

void setup() {
  size(windowWidth, windowHeight);
  background(255);
}

void draw() {

  toaster.draw();
}


class Toaster {
  float x;
  float y;
  int width;
  int height;

  Toaster() {
    x = 350;
    y = 240;
    width = 100;
    height = 200;
  }

  void draw() {
    fill(200, 200, 200);
    rect(x - width/2, y - height/2, width, height);
  }
}

