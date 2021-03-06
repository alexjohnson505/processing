// Objects in Processing 2.2.1
// Constructed as a demo on objects in Processing 2

// CONSTANTS
final int viewWidth = 400;
final int viewHeight = 250;

// GLOBAL VARIABLES
color backgroundColor = color(0,0,0), fillColor = color(90, 90, 250);

int currentBallCount = 0;
int maxBallCount = 100;

// OBJECTS
Ball[] balls = new Ball[maxBallCount]; // Init w/ max length

void setup(){

  // Document Setup
  size(viewWidth, viewHeight);
  background(backgroundColor);
  fill(color(250, 250, 250));
//  balls[0] = new Ball(mouseX, mouseY, 20, color(204, 153, 0));
}

void draw(){
  background(0);
 
  for (int i = 0; i < currentBallCount ; i++){
    balls[i].move();
    balls[i].display();
  }
}

void mouseClicked(){
  
  balls[currentBallCount] = new Ball(mouseX, mouseY, 20, color(204, 153, 0));
  currentBallCount++;
}

class Ball {
  float rad;
  float x, y;
  color myColor;
  float radius;
  float xSpeed;
  float ySpeed;

  Ball(float pX, float pY, float pRadius, color pColor){
    x = pX;
    y = pY;
    myColor = pColor;
    radius = pRadius;
    xSpeed = random(2, 15);
    ySpeed = random(2, 15);
  }

  void display(){
    stroke(0,0,0,255);
    fill(myColor);
    ellipse(x, y, radius * 2, radius * 2);
  }

  void move(){
    x += xSpeed;
    y += ySpeed;

    if (x > width || x < 0){
      xSpeed *= -1;
    }

    if (y > height || y < 0){
      ySpeed *= -1;

    }
  }
}
