
// Objects in Processing 2.2.1
// Constructed as a demo on objects in Processing 2

// CONSTANTS
final int viewWidth = 400;
final int viewHeight = 250;
final int maxBallCount = 25;

color backgroundColor = color(0,0,0), fillColor = color(90, 90, 250);
float xSpeed, ySpeed;

Ball b; // Initialize a new Ball object
Ball[] balls; // Initialize and Array of Objects

void setup(){

  // Document Setup
  size(viewWidth, viewHeight);
  background(backgroundColor);
  fill(color(250, 250, 250));
  
  // Assign an Instance of a Ball to variable b
//  b = new Ball(random(10, 100), random(10, 100), 15, color(204, 153, 0));
  
  balls = new Ball[maxBallCount];
  
  for (int i = 0; i < maxBallCount ; i++){
    balls[i] = new Ball(random(10, 100), random(10, 100), 15, color(204, 153, 0));
  }
}

void draw(){
  for (int i = 0; i < maxBallCount ; i++){
    balls[i].move();
    balls[i].display();
  }
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
    xSpeed = random(5, 200);
    ySpeed = random(5, 200);
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
