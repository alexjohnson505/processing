// A Dancing T-Rex
// Alex Johnson 9/9/14
// CS 4300

int windowWidth = 800;
int windowHeight = 400;

int centerX = 400;
int centerY = 200;
  
// Count
int x = 0;
  
// Initialize program
void setup (){
  // Set size of preview window
  size(windowWidth, windowHeight);
  
//  Pos a = new Pos(10,12);
//  print(a.x);
}

// Render
void draw (){
  background(0, 255, 255);
  
//  rect(mouseX / 2, mouseY /2, 200, 80);
   
  textSize(32);
  fill(0, 102, 153);
  
  text(mouseX, 10, 30); 
  text(mouseY, 100, 30);
  
//  Pos a = new Pos(20, 20);
//  Pos b = new Pos(85, 20);
//  Pos c = new Pos(85, 75);
//  Pos d = new Pos(30, 75);

  
//  Pos a = new Pos(20, 20);
//  Pos b = new Pos(85, 20);
//  Pos c = new Pos(85, 75);
//  Pos d = new Pos(30, 75);
//  
//  Quad r = new Quad(a, b, c, d);
//  r.display();
}

// Defined a quadrilateral shape,
// given 4 Pos (vertices).
//class Quad {
//  Pos a;
//  Pos b;
//  Pos c;
//  Pos d;
//  
//  Quad(Pos a, Pos b, Pos c, Pos d){
//    a = a;
//    b = b;
//    c = c;
//    d = d;
//  }
//  
//  void display() {
//    beginShape();
//    vertex(a.x, a.y);
//    vertex(85, 20);
//    vertex(85, 75);
//    vertex(30, 75);
//    endShape(CLOSE);
//  }
//}

// Position in a coordinate plane.
// Contains an X and a Y value
//class Pos {
//  public float x, y;
//  
//  Pos(float x, float y){
//    x = x;
//    y = y;
//  }
//  
//  float getX(){
//    print("a.x called");
//    return x++;
//  };
//  
//
//}
//
//


