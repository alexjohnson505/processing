// A Dancing T-Rex
// Alex Johnson 9/9/14
// CS 4300

int centerX = 400;
int centerY = 200;

double dinoCenterX = 260;
double dinoCenterY = 220;

int windowWidth = 800;
int windowHeight = 400;

int i = 0;
int mod = 1;

// Initialize program
void setup (){

  // Set size of preview window
  size(windowWidth, windowHeight);
  textFont(createFont("Georgia", 36));
}

// Render
void draw (){
  background(0, 255, 255);
  
  // Window Info
  textSize(32);
  fill(0, 102, 153);
  text(mouseX, 10, 30); 
  text(mouseY, 100, 30);
  text(i,      160, 30);
  
  if (i >= 100){
     mod = -1;
  } else if (i <= 0){
    mod = 1;
  }
  
  i = i + (2 * mod);

//  float scaleX = windowWidth / mouseX + 1;
//  float scaleY = windowHeight / mouseY + 1;

  // BODY CONSTRUCTION
  // FEET
  float[] a = {240, 240 + i};
  float[] b = {240, 360};
  float[] c = {310, 360};
  float[] d = {280, 240 + i};
  Quad feet = new Quad(a, b, c, d);
  feet.display();
      
  // BODY
  float[] a2 = {214, 199};
  float[] b2 = {217, 275};
  float[] c2 = {365, 244};
  float[] d2 = {345, 196};
  Quad body = new Quad(a2, b2, c2, d2);
  body.display();  
}

// Defined a quadrilateral shape,
// given 4 arrays (2-key positions)
// counter clockwise from top left
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
  
  void display() {
    beginShape();
    vertex(ax, ay);
    vertex(bx, by);
    vertex(cx, cy);
    vertex(dx, dy);
    endShape(CLOSE);
  }
}

// Helper
void mouseClicked(){
  println("{" + mouseX + ", " + mouseY + "}");
}


// Position in a coordinate plane.
// Contains an X and a Y value
//class Pos {
//  public float x, y;
//  
//  Pos(float x, float y){
//    x = x;
//    y = y;
//  }
//  
//  float getX(){
//    print("a.x called");
//    return x++;
//  };
//}




