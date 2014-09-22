// Alex Johnson 9/15/14
// IM 2250 - Programming for Digital Media
// Assignment 02 - Processing 2 Exploration

final int windowWidth = 500;
final int windowHeight = 350;

// Set Penguin movement speed
final float movementSpeed = 1.2;

// Record score
int score = 0;

// Initial number of fish to start with
int startFishCount = 3;

// set margin for fish
float margin = 20;

// Define penguin in start position
Penguin p = new Penguin(200, 200);

// Define food image assets
PImage fish;
PImage food;

// Array of food 
ArrayList<Fish> fishies;

// Initialize program
void setup (){
 
  // Set size of preview window
  size(windowWidth, windowHeight);
  
  // Load images into global variables
  fish = loadImage("fish.png");
  food = loadImage("food.png");
  
  // Create array of food (3 fish)
  fishies = new ArrayList<Fish>();
  
  for (int i = 0; i < startFishCount + 1; i++){
    fishies.add(new Fish());
  }
}

// Render
void draw (){
  
  // Convert the Y position of the user's cursor 
  // into a corresponding value between 0 and 100;
  float x = mouseY / (float)windowHeight * 100; 
  
  // Dynamic background color
  background(250, 175 - .3 * x, 84 + .2 * x);
  
  // Instructions
  text("Eat the fish. Click mouse to change direction.", 130, 300);
  text("Fish Eaten: " + score, 130, 320);
 
  // When Penguin collides with the walls, change direction automatically
  if (p.x < 0 || p.x > windowWidth || p.y < 0 || p.y > windowHeight){
    p.reverse();
  }
  
 // Render Fish
 for (int i = 0; i < fishies.size() - 1; i++){
    Fish current = fishies.get(i);
    
    current.display();
    
    // Super basic collision detection
    if (current.alive && p.collide(current.x, current.y)){
      
      // Kill fish
      current.alive = false;
      
      // Increment score
      score++;
      
      // Add a new fish elsewhere
      fishies.add(new Fish());
    }
  }
  
  // Render Penguin
  p.render();
}

// Change penguin's direction
void mouseClicked(){
  p.changeDirection();
}
 
class Penguin {
  float x;
  float y;
  int direction;
  float speed;
  Quad body;
  Quad belly;
  Quad beak;
  
  Penguin(float pX, float pY) {
    x = pX;
    y = pY;
    direction = 0;
    speed = movementSpeed;
    
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
    body = new Quad(a, b, c, d);
    
    // BELLY
    a = new float[] {-11, 18};
    b = new float[] {-11, 40};
    c = new float[] {5, 40};
    d = new float[] {5, 18};
    belly = new Quad(a, b, c, d);

    a = new float[] {-3, 6};
    b = new float[] {-3, 14};
    c = new float[] {-25, 12};
    d = new float[] {-25, 9};
    beak = new Quad(a, b, c, d);
  }
  
  void changeDirection(){
    direction = direction + 1;
    direction = direction % 4;
  }
  
  // Reverse direction
  void reverse(){
    direction = direction + 2;
    direction = direction % 4;
  }
  
  boolean collide(float pX, float pY){
    Rectangle fish = new Rectangle(pX, pY, 23, 9);
    Rectangle penguin = new Rectangle(p.x - 23, p.y, 46, 60);
    
    println("Penguin: " + penguin.x + " Fish: " + fish.x);
    
    penguin.draw();
    
    if (fish.x < penguin.x + penguin.width &&
        fish.x + fish.width > penguin.x &&
        fish.y < penguin.y + penguin.height &&
        fish.height + fish.y > penguin.y) {

        return true;
    } else {
        return false;
    }
  }
  
  // Render penguin
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
  float x; // X Position
  float y; // Y Position
  boolean alive;
  
  Fish(){
    x = random(margin, windowWidth - margin);
    y = random(margin, windowHeight - margin);
    alive = true;
  }
  
  void display(){
    if (alive == true){
      image(fish, x, y);
    } else {
      image(food, x, y);
    }
  }
  
  void kill(){
    alive = false;
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

// Represents a rectangle, but better
class Rectangle {
  float x, y;
  float width, height;
  
  Rectangle(float pX, float pY, float w, float h){
    x = pX;
    y = pY;
    width = w;
    height = h;
  }
  
  void draw(){
    rect(x, y, width, height);
  }
}
