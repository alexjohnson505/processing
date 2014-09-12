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
  RobotDino roboRex = new RobotDino(450, 250);
  
  // Render dino, providing a number indicating it's
  // current position in a dance
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
    y = y + i;
    
    // Init vars
    float[] a = {0, 0};
    float[] b = {0, 0};
    float[] c = {0, 0};
    float[] d = {0, 0};

    // BODY
    a = new float[] {-90, -100};
    b = new float[] {-80, -25};
    c = new float[] {55 , -40};
    d = new float[] {45 , -100};
    Quad body = new Quad(a, b, c, d);
    
    // TAIL1. Inherit points from body
    a = new float[] {body.ax, body.ay};
    b = new float[] {body.bx, body.by};
    c = new float[] {-160 , -20 + i * -.4};
    d = new float[] {-160 , -60 + i * -.4};
    Quad tail1 = new Quad(a, b, c, d);
    
    // TAIL2. Inherit points from tail 1
    a = new float[] {-270 , 40 + i * -1.6};
    b = new float[] {-270 , 40 + i * -1.6};
    c = new float[] {tail1.cx, tail1.cy};
    d = new float[] {tail1.dx, tail1.dy};
    Quad tail2 = new Quad(a, b, c, d);

   

    
    // JAW
    pushMatrix();
      translate(x + 60, y - 70);
      rotate(radians(20 + i / 3));
      rect(0, 0, 60, 20);
    popMatrix();
    
    // HEAD
    pushMatrix();
      translate(x + 50, y - 20);
      rotate(radians(20 - i / 3));
      rect(-20, -100, 120, 60);
    popMatrix();

    // ARM
    pushMatrix();
      translate(x, y - 40);
      rotate(radians(-90 + i));
      triangle(0, 0, 10, 0, 5, 60);
    popMatrix();

    // THIGH
    pushMatrix();
      a = new float[] {0, 0};
      b = new float[] {40, 0};
      c = new float[] {30, 60};
      d = new float[] {0, 60};
      Quad thigh = new Quad(a, b, c, d);
    popMatrix();
    
    
    
    // RENDER
    pushMatrix();
      translate(x, y);
      body.display();
      tail1.display();
      tail2.display();
      thigh.display();
    popMatrix();

    
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


