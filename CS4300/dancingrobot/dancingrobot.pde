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
  
  // Render dino, providing a number indicating it's
  // current position in a dance
  trex.display(x);
  
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
    float[] a2 = {214, 199 + i};
    float[] b2 = {217 + i * -.3, 275 + i};
    float[] c2 = {365 + i * -.2, 244 + i * 1.4};
    float[] d2 = {345, 196 + i * 1.4};
    Quad body = new Quad(a2, b2, c2, d2);
    body.display();
    
    // TAIL 1
    float[] a3 = {125, 300 + i * -.3};
    float[] b3 = {120, 330 + i * -.3};
    Quad tail1 = new Quad(a3, b3, b2, a2);
    tail1.display();
    
    // TAIL 2
    float[] a4 = {80, 250 + i * -.8};
    float[] b4 = {70, 250 + i * -.8};
    Quad tail2 = new Quad(a4, b4, b3, a3);
    tail2.display();
    
    // HEAD
    float[] c5 = {440, 250 + i };
    float[] d5 = {440 + i * -.1, 210 + i };
    Quad head = new Quad(d2, c2, c5, d5);
    head.display();
    
    // JAW
    float[] c6 = {430, 280 + i };
    float[] d6 = {430, 270 + i };
    Quad jaw = new Quad(d2, c2, c6, d6);
    jaw.display();
    
    // ARM
    float[] c7 = {347, 332};
    float[] d7 = {347, 332};
    Quad arm = new Quad(c2, d2, c7, d7);
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
  
  // Draw lines connecting the 4 vertices
  void display() {
    beginShape();
    vertex(ax, ay);
    vertex(bx, by);
    vertex(cx, cy);
    vertex(dx, dy);
    endShape(CLOSE);
  }
}

// Print the Selected coordinates when the mouse is clicked.
void mouseClicked(){
  println("{" + mouseX + ", " + mouseY + "}");
}

void debugInfo(){
    // Window Info
  textSize(32);
  fill(0, 102, 153);
  
  text(mouseX, 10, 30); 
  text(mouseY, 110, 30);
  text(i, 210, 30);
}


