ArrayList<Particle> plist;


float GConst = 500;
PVector[] schemes;
PVector colorRange;


void setup() {

  size(720, 720);
  noStroke();

  background(0);
  colorMode(HSB, 255);
  noFill();
  setScheme();
  plist = new ArrayList<Particle>();
}
void mousePressed() {
  Particle p = new Particle(mouseX, mouseY);
  plist.add(p);
}
void draw() {
 
  erase();
  



 
  attract(plist);
  
  for (Particle p : plist) {
    p.display();
    p.update();
  }
}
