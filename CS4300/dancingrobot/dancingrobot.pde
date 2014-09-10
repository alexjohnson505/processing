// A Dancing T-Rex
// Alex Johnson 9/9/14
// CS 4300

int centerX = 400;
int centerY = 200;

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
  text(mouseY, 110, 30);
  text(i, 210, 30);
  
  // Count up and down
  if (i >= 100){
     mod = -1;
  } else if (i <= 0){
    mod = 1;
  }
  
  i = i + (2 * mod);

  Dino trex = new Dino(260, 200);
  trex.display(i);
  
}

class Dino {
  float centerX;
  float centerY;
  
  Dino(float centerX, float centerY){
    centerX = centerX;
    centerY = centerY;
  }
  
  // BODY CONSTRUCTION
  // Take an input for scale
  void display(float i) { 
    
    // FEET
    float[] a = {240, 240 + i};
    float[] b = {240, 360};
    float[] c = {310, 360};
    float[] d = {280, 240 + i};
    Quad feet = new Quad(a, b, c, d);
    feet.display();

    // BODY
    float[] a2 = {214, 199 + i};
    float[] b2 = {217 + i * -.3, 275 + i};
    float[] c2 = {365 + i * -.2, 244 + i * 1.4};
    float[] d2 = {345, 196 + i * 1.4};
    Quad body = new Quad(a2, b2, c2, d2);
    body.display();
    
    // TAIL
    float[] a3 = {125, 190 + i * -.3};
    float[] b3 = {120, 210 + i * -.3};
    Quad tail1 = new Quad(a3, b3, b2, a2);
    tail1.display();
  }
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


