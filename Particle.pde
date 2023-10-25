

class Particle {

  PVector pos, vel, acc;
  PVector prev, prev2;
  float mass, maxForce, maxSpeed;
  float hu;
  Particle(float x, float y) {
    mass = 50;
    maxForce = 15;
    maxSpeed = 15;
    prev = new PVector(x, y);
    prev2 = new PVector(x, y);
    pos = new PVector(x, y);
    vel = new PVector(0, 0);// PVector.random2D();

    acc = new PVector(0, 0);

    hu = random(colorRange.x, colorRange.y);
  }
  void applyForce(PVector force) {
    acc.add(force.div(mass));
  }
  void interect(Particle other) {

    // its unit vector pointing from other towards this
    PVector distance = new PVector(pos.x - other.pos.x, pos.y- other.pos.y);

    if (distance.mag()  < 0.8) {
     
      return;
    }

  
    float forceMag = GConst * mass * other.mass / distance.magSq();
    distance.setMag(1);
    PVector force = new PVector(forceMag*distance.x, forceMag*distance.y);
    force.limit(maxForce);
    // 01 --------> 02
    other.applyForce(force.copy());

    force.mult(-1);

    applyForce(force.copy());
  }
  void update() {
    prev2 = prev.copy();
    prev = pos.copy();
    edges();
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }
  void edges(int mode) {
    if (mode == 0) return;
    float buf = 0.2;

    if (pos.x < mass ) pos.x = width - mass - buf;
    else if ( pos.x > width - mass ) pos.x = buf + mass;

    if (pos.y < mass) pos.y = height - mass - buf;
    else if ( pos.y > height - mass ) pos.y = buf + mass;
  }
  void edges() {
    float buf = 0.2;
    float k = 0.2;
    if (pos.x < mass   ) {
      vel.x = k * abs(vel.x);
      pos.x = buf + mass;
    } else if ( pos.x > width - mass ) {
      vel.x = -k * abs(vel.x);
      pos.x = width - mass - buf;
    }


    if (pos.y < mass) {
      vel.y = k * abs(vel.y);
      pos.y = buf + mass;
    } else if ( pos.y > height - mass ) {
      vel.y = -k * abs(vel.y);
      pos.y = height-mass - buf;
    }
  }
  void display() {



    push();
    strokeWeight(10);
    stroke(hu, 190, 255);
    point(pos.x,pos.y);
    line(pos.x, pos.y, prev.x, prev.y);
    line(prev.x, prev.y, prev2.x, prev2.y);
    pop();
  }
}
