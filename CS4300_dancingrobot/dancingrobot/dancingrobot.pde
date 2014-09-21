// Alex Johnson
// CS 4300 - Computer Graphics
// Due 9/24/14
// A Dancing T-Rex

final int windowWidth = 800;
final int windowHeight = 600;

// Initialize program
void setup (){
  
  // Disable stroke
  noStroke();
  
  // Set size of preview window
  size(windowWidth, windowHeight);
  
  // Set default text options
  textFont(createFont("Georgia", 24));
}

// Render
void draw (){
  
  // Convert the Y position of the user's cursor 
  // into a corresponding value between 0 and 100;
  // This number represents the percentage of height
  // to animate the Dino at.
  float x = mouseY / (float)windowHeight * 100; 

  // Dynamic background
  background(250, 175 - .3 * x, 84 + .2 * x);
  
  // Create tree #1
  Tree tree1 = new Tree(223, 320, .7);
  
  // Create tree #2
  Tree tree2 = new Tree(660, 270, 1);
  
  // Create tree #3
  Tree tree3 = new Tree(100, 360, .6);
  
  // Create new Dino
  RobotDino roboRex = new RobotDino(450, 380);
  
  // Render ground
  fill(60, 180, 113);
  rect(0, 450, windowWidth, windowHeight / 2);
  
  // Render objects onto scene. Provide an x value, 
  // representing the current position in a 'dance'
  tree1.display(x);
  tree2.display(x);
  tree3.display(x);
  roboRex.display(x);
  
  // Provide user instructions
  textSize(20);
  text("Move the mouse up and down.", 260, 540);
}

// Create a 'dancing' geometric T-rex.  
class RobotDino {
  float x;
  float y;
  
  RobotDino(float centerX, float centerY) {
    x = centerX;
    y = centerY;
  }
  
  // Provide i, representing current
  // position in the dance
  void display(float i){
    y = y + i;
    
    // Init vars
    float[] a = {0, 0};
    float[] b = {0, 0};
    float[] c = {0, 0};
    float[] d = {0, 0};
    
    // Set dino color
    fill(165,42,42);

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
    a = new float[] {-60, -40};
    b = new float[] {0, -40};
    c = new float[] {-10 + i / 2, 15 - i/3};
    d = new float[] {-45 + i / 2, 15 - i/3}; 
    Quad thigh = new Quad(a, b, c, d);

    // CALF
    a = new float[] {thigh.dx, thigh.dy};
    b = new float[] {thigh.cx, thigh.cy};
    c = new float[] {-20, 90 - i};
    d = new float[] {-30, 90 - i};
    Quad calf = new Quad(a, b, c, d);
    
    // FEET
    pushMatrix();
      translate(x - 30, y + 80 - i);
      rotate(radians(20 + -i/6));
      rect(0, 0, 40, 10);
    popMatrix();
    
    // RENDER
    pushMatrix();
      translate(x, y);
      body.display();
      tail1.display();
      tail2.display();
      thigh.display();
      calf.display();
    popMatrix();
  }
}

// Create a geometric tree.
// Takes a x,y position, and a scale (0-to-1)
class Tree {
  float x;
  float y;
  float scale;
  
  Tree(float pX, float pY, float sc){
    x = pX;
    y = pY;
    scale = sc;
  }
  
  void display(float i) {
    pushMatrix();
      translate(x, y);
      rotate(radians(i * .1));
      scale(scale);
      
      // Create trunk
      fill(139, 69, 19);
      rect(0, 0, 30, 200);
       
      // Create leaves
      fill(34, 139, 34);
      ellipse(0,  -20, 150, 150);
      ellipse(-30,  0, 150, 100);
      ellipse(10,   0, 150, 100);
      ellipse(30,   0, 100, 150);
      ellipse(30,   0, 190, 100);
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

// Print additional info to assist development
void debugInfo(){
  textSize(32);
  fill(0, 102, 153);
  
  text(mouseX, 10, 30); 
  text(mouseY, 110, 30);
}


