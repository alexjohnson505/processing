// Alex Johnson 9/9/14
// CS 4300 - Computer Graphics
// A Dancing T-Rex

int centerX = 400;
int centerY = 200;

int windowWidth = 800;
int windowHeight = 400;

// Initialize program
void setup (){
  
  // Set size of preview window
  size(windowWidth, windowHeight);
  
  // Set default text options
  textFont(createFont("Georgia", 24));
  
}

// Render
void draw (){
  background(0, 255, 255);
  debugInfo();
  
  // Convert the Y position of the user's cursor 
  // into a corresponding value between 0 and 100;
  // This number represents the percentage of height
  // to animate the Dino at.
  float x = mouseY / (float)windowHeight * 100; 

  // Create new Dino
  Dino trex = new Dino(260, 200);
  RobotDino roboRex = new RobotDino(550, 300);
  
  // Render dino, providing a number indicating it's
  // current position in a dance
  trex.display(x);
  roboRex.display(x);
}

class RobotDino {
  float x;
  float y;
  
  
  
  RobotDino(float centerX, float centerY) {
    x = centerX;
    y = centerY;
    
    
  }
  
  // i is between 0 and 100;
  void display(float i){
    x = x;
    y = y + i;
    
    // Init vars
    float[] a = {0, 0};
    float[] b = {0, 0};
    float[] c = {0, 0};
    float[] d = {0, 0};
    
    // BODY
    a = new float[] {x - 90, y - 100 + i};
    b = new float[] {x - 80 + i * -.3, y - 25 + i};
    c = new float[] {x + 55 + i * -.2, y - 40 + i * 1.4};
    d = new float[] {x + 45, y - 100 + i * 1.4};
    Quad body = new Quad(a, b, c, d);
    body.display();
    
    pushMatrix();
    translate(x, y);
    rect(0, 0, 200, 100);
    popMatrix();
    
    
    
    text("center", x, y);
  }
}

class Dino {
  float centerX;
  float centerY;
  
  Dino(float centerX, float centerY){
    centerX = centerX;
    centerY = centerY;
  }
  
  // BODY CONSTRUCTION
  // Take an input for scale
  void display(float i) { 
    
    // FEET
    float[] a = {240, 240 + i};
    float[] b = {240, 360};
    float[] c = {310, 360};
    float[] d = {280, 240 + i};
    Quad feet = new Quad(a, b, c, d);
    feet.display();

    // BODY
    a = new float[] {214, 199 + i};
    b = new float[] {217 + i * -.3, 275 + i};
    c = new float[] {365 + i * -.2, 244 + i * 1.4};
    d = new float[] {345, 196 + i * 1.4};
    Quad body = new Quad(a, b, c, d);
    body.display();
    
    // TAIL 1
    a = new float[] {125, 300 + i * -.1};
    b = new float[] {120, 330 + i * -.1};    
    Quad tail1 = new Quad(a, b, body.getB(), body.getA());
    tail1.display();
    
    // TAIL 2
    a = new float[] {70, 400 + i * -1};
    b = new float[] {70, 400 + i * -1};
    Quad tail2 = new Quad(a, b, tail1.getB(), tail1.getA());
    tail2.display();
    
    // HEAD
    c = new float[] {440, 250 + i };
    d = new float[] {440 + i * -.1, 210 + i };
    Quad head = new Quad(body.getD(), body.getC(), c, d);
    head.display();
    
    // JAW
    c = new float[] {430, 280 + i };
    d = new float[] {430, 270 + i };
    Quad jaw = new Quad(body.getD(), body.getC(), c, d);
    jaw.display();
    
    // ARM
    c = new float[] {347, 332};
    d = new float[] {347, 332};
    Quad arm = new Quad(body.getC(), body.getD(), c, d);
    arm.display();
  }
}

// Represents a quadrilateral polygon.
// Quad takes 4 arrays, each representing a coordinate,
// and connect those coordinates with lines,  counter 
// clockwise starting with the top left vertex.
class Quad {
  float ax, ay, bx, by, cx, cy, dx, dy;
  
  Quad(float[] a, float[] b, float[] c, float[] d){
    ax = a[0];
    ay = a[1];
    bx = b[0];
    by = b[1];
    cx = c[0];
    cy = c[1];
    dx = d[0];
    dy = d[1];    
  }
  
  Quad(float ax, float ay, float bx, float by, float cx, float cy, float dx, float dy) {
    ax = ax;
    ay = ay;
    bx = bx;
    by = by;
    cx = cx;
    cy = cy;
    dx = dx;
    dy = dy;
  }
  
  // Draw lines connecting the 4 vertices
  void display() {
    beginShape();
    vertex(ax, ay);
    vertex(bx, by);
    vertex(cx, cy);
    vertex(dx, dy);
    endShape(CLOSE);
  }
  
  float[] getA () {
    return new float[] {ax, ay};
  }
  float[] getB () {
    return new float[] {bx, by};
  }
  float[] getC () {
    return new float[] {cx, cy};
  }
  float[] getD () {
    return new float[] {dx, dy};
  }

}

// Print the Selected coordinates when the mouse is clicked.
void mouseClicked(){
  println("{" + mouseX + ", " + mouseY + "}");
}

// Print additional info to assist development
void debugInfo(){
  textSize(32);
  fill(0, 102, 153);
  
  text(mouseX, 10, 30); 
  text(mouseY, 110, 30);
}


