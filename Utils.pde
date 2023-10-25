void setScheme() {

  schemes = new PVector[3];
  schemes[0] = new PVector(0, 70);
  schemes[1] = new PVector(100, 170);
  schemes[2] = new PVector(210, 255);
  int r =(int) random(0, 3);
  colorRange = schemes[r];
}

void erase() {

  push();
  fill(0, 40);
  rect(0, 0, width, height);
  pop();
}

void createParticles(int count){
for (int i = 0; i<count; i++) {
    Particle p = new Particle(width/2, height/2);
    p.vel =  PVector.random2D();
    p.vel.mult(5);
    plist.add(p);
  }

}
void attract(ArrayList<Particle> plist) {
  for (int i =0; i<plist.size(); i++) {
    Particle p1 = plist.get(i);

    for (int j =i+1; j<plist.size(); j++) {
      Particle p2 = plist.get(j);
      p1.interect(p2);
    }
  }
}
