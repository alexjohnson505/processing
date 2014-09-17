// Alex Johnson 9/15/14
// IM 2250 - Programming for Digital Media
// Assignment 01 - Processing 2 Exploration

final int windowWidth = 500;
final int windowHeight = 350;
final float movementSpeed = 1;

// Define penguin in start position
Penguin p = new Penguin(200, 200);

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
  float x = mouseY / (float)windowHeight * 100; 
  
  // Dynamic background color
  background(250, 175, 84 + x);
  
  // Instructions
  text("Click to change direction.", 200, 300);
  
  // Render Penguin
  p.render();
}

void mouseClicked(){
  
  // Print the Selected coordinates when the mouse is clicked.
  println("{" + mouseX + ", " + mouseY + "}");
  
  // Change penguins direction
  p.changeDirection();
}
 
class Penguin {
  float x;
  float y;
  int direction;
  float speed;
  
  Penguin(float pX, float pY) {
    x = pX;
    y = pY;
    direction = 0;
    speed = movementSpeed;
  }
  
  void changeDirection(){
    direction = direction + 1;
    direction = direction % 4;
    println(direction);
  }
  
  // Default display for a Dino. Takes in a
  // i value between 0 and 100, representing the state
  // of the animation
  void display(){
    render();
  }
  
  void render(){
    if (direction == 0){
      x = x - 1 * speed;
    } else if (direction == 1){
      y = y - 1 * speed;
    } else if (direction == 2){
      x = x + 1 * speed;
    } else {
      y = y + 1 * speed;
    }
    
    // Init vars
    float[] a = {0, 0};
    float[] b = {0, 0};
    float[] c = {0, 0};
    float[] d = {0, 0};

    // BODY
    a = new float[] {0, 0};
    b = new float[] {0, 40};
    c = new float[] {30, 40};
    d = new float[] {30, 0};
    Quad body = new Quad(a, b, c, d);
    
    // BELLY
    a = new float[] {4, 18};
    b = new float[] {4, 40};
    c = new float[] {20, 40};
    d = new float[] {20, 18};
    Quad belly = new Quad(a, b, c, d);

    a = new float[] {12, 6};
    b = new float[] {12, 14};
    c = new float[] {-10, 12};
    d = new float[] {-10, 9};
    Quad beak = new Quad(a, b, c, d);
    
    pushMatrix();
      translate(x, y);
      scale(1.5);
      
      fill(0, 0, 0);
      body.display();
      
      fill(255, 255, 255);
      belly.display();
      
      fill(255, 255, 0);
      beak.display();
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

// Print additional info to assist development
void debugInfo(){
  textSize(32);
  fill(0, 102, 153);
  
  text(mouseX, 10, 30); 
  text(mouseY, 110, 30);
}


