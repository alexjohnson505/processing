// Alex Johnson 9/15/14
// IM 2250 - Programming for Digital Media
// Assignment 01 - Processing 2 Exploration

int windowWidth = 1280;
int windowHeight = 768;

int distanceBetweenDinos = 450;

// Grid of relative dino positions;
int[] xValues = {0, 1, 2, 0, 1, 2, 0, 1, 2};
int[] yValues = {0, 0, 0, 1, 1, 1, 2, 2, 2};

  
// Initialize program
void setup (){
  
  // Disable stroke
  noStroke();
  
  // Set size of preview window
  size(windowWidth, windowHeight);
}

// Render
void draw (){
  
  // Convert the Y position of the user's cursor 
  // into a corresponding value between 0 and 100;
  // This number represents the percentage of height
  // to animate the Dino at, indication the current
  // position to render Dino's dance
  float x = mouseY / (float)windowHeight * 100; 
  
  // Dynamic background color
  background(250, 175, 84 + x);
  
  // Instructions
  text("Move your Mouse Up and Down.", 500, 700);
  
  // Create new Dino
  RobotDino roboRex = new RobotDino(450, 250);
  
  // Output Dinos
  pushMatrix();
    
    // Scale down scene
    scale(.5);
      
    // offset dino grid
    translate(800, 250);
    
    // Init counter for iterating through Dinos
    int i = xValues.length;
    
    // Render grid of Dinos
    while(i > 0){
      int ax = xValues[i - 1] * distanceBetweenDinos;
      int ay = yValues[i - 1] * distanceBetweenDinos;
      roboRex.display(x, ax, ay);
      i--;
    }
  popMatrix();
}

// Renders a dancing robo dinosaur.
// Originally developed for CS4300 - 
// Computer Graphics, Assignment 01. 
class RobotDino {
  float x;
  float y;
  
  RobotDino(float centerX, float centerY) {
    x = centerX;
    y = centerY;
  }
  
  // Default display for a Dino. Takes in a
  // i value between 0 and 100, representing the state
  // of the animation
  void display(float i){
    render(i, x, y);
  }
  
  // Provide option parameters for manually 
  // overriding the Dinos' center position  
  void display(float i, float x2, float y2){
    render(i, x2, y2);
  }
  
  void render(float i, float centerX, float centerY){
    x = centerX;
    y = centerY + i;
    
    fill(55, 135, 86);
    
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

// Represents a quadrilateral polygon.
// Quad takes 4 arrays, each representing a cartesian point,
// and connect those coordinates with verteces
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


