// Class Ball
// Defines an example object, 
// Constructed as a demo on processing 2.2.1 objects 

int w = 400;
int h = 250;
color bg = color(0,0,0), fillColor = color(90, 90, 250);

Ball b;

void setup(){
  size(w, h);
  background(bg);
  fill(color(250, 250, 250));
  println("Setup");
  b = new Ball(random(10, 100), random(10, 100), 20, color(204, 153, 0));
   
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
}
