
// Objects in Processing 2.2.1 
// Constructed as a demo on objects in Processing 2 

int w = 400;
int h = 250;
float xSpeed, ySpeed;
color bg = color(0,0,0), fillColor = color(90, 90, 250);
Ball b;

void setup(){
  // Document Setup
  size(w, h);
  background(bg);
  fill(color(250, 250, 250));  
  
  // New Object
  b = new Ball(random(10, 100), random(10, 100), 15, color(204, 153, 0));

  // Set speed ranges
  xSpeed = random(5, 200);
  ySpeed = random(5, 200);
}

void draw(){
  b.display();
}

class Ball {
  float rad;
  float x, y;
  color myColor;
  float radius;
  
  Ball(float pX, float pY, float pRadius, color pColor){
    x = pX;
    y = pY;
    myColor = pColor;
    radius = pRadius; 
  }
  
  void display(){
    stroke(0,0,0,255);
    fill(myColor);
    ellipse(x, y, radius * 2, radius * 2);
  }
  
  void move(){
  }
}
