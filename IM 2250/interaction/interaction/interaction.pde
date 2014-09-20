// Alex Johnson 9/15/14
// IM 2250 - Programming for Digital Media
// Assignment 02 - Processing 2 Exploration

final int windowWidth = 500;
final int windowHeight = 350;

// Set Penguin movement speed (pixels per draw)
final float movementSpeed = 1.2;

// Define penguin in start position
Penguin p = new Penguin(200, 200);

// Array of food 
Fish[] fishies = new Fish[3];

// Initialize program
void setup (){
 
  // Set size of preview window
  size(windowWidth, windowHeight);
  
  int i = 2;
  
  // Create array of food (3 fish)
  while (i > -1){
    fishies[i] = new Fish();
    i--;
  }
}

// Render
void draw (){
  
  // Convert the Y position of the user's cursor 
  // into a corresponding value between 0 and 100;
  float x = mouseY / (float)windowHeight * 100; 
  
  // Dynamic background color
  background(250, 175 - x, 84 + x);
  
  // Instructions
  text("Click to change direction.", 200, 300);
  text(mouseX + " " + mouseY, 200, 30); 
  
  // Render Penguin
  p.render();
  
   // Render Fish
  for (int i = 0; i < 3; i++){
    fishies[i].display();
  }
  
}

void mouseClicked(){
  
  // Print the Selected coordinates when the mouse is clicked.
  // println("{" + mouseX + ", " + mouseY + "}");
  
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
  }
  
  // 180d turn around
  void reverse(){
    direction = direction + 2;
    direction = direction % 4;
  }
  
  // Default display for a Dino. Takes in a
  // i value between 0 and 100, representing the state
  // of the animation
  void display(){
    render();
  }
  
  void render(){
    // Determine movement based
    // on current direction
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
    a = new float[] {-15, 0};
    b = new float[] {-15, 40};
    c = new float[] {15, 40};
    d = new float[] {15, 0};
    Quad body = new Quad(a, b, c, d);
    
    // BELLY
    a = new float[] {-11, 18};
    b = new float[] {-11, 40};
    c = new float[] {5, 40};
    d = new float[] {5, 18};
    Quad belly = new Quad(a, b, c, d);

    a = new float[] {-3, 6};
    b = new float[] {-3, 14};
    c = new float[] {-25, 12};
    d = new float[] {-25, 9};
    Quad beak = new Quad(a, b, c, d);
    
    pushMatrix();
      translate(x, y);
      
      // Turn penguin around based on direction of movement
      if (direction == 1 || direction == 2){
        scale(-1.5, 1.5);
      } else {
        scale(1.5, 1.5);
      }
      
      fill(0, 0, 0);
      body.display();
      
      fill(255, 255, 255);
      belly.display();
            
      fill(255, 255, 0);
      beak.display();
    popMatrix();
  }
}

// Represents a target object
class Fish {
  float x;
  float y;
  
  Fish(){
    x = random(0, windowWidth);
    y = random(0, windowHeight);
    
    println("Fish position at:" + x + ", " + y);
  }
  
  void display(){
    pushMatrix();
      stroke(1);
      fill(20, 200, 150);
      translate(x, y);
      rect(x, y, 30, 10);
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

