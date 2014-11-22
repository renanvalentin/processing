class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  // The Mover's maximum speed
  float topspeed;
  
  // gravity properties
  float G;
  float mass;

  Mover(float m, float x , float y) {
    topspeed = 5;
    G = 0.4;
    mass = m;
    
    location = new PVector(x, y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0, 0);
  }

  void update() {        
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
  // F = A * M
  // A = F / M
  void applyForce(PVector force) {
    PVector f = PVector.div(force , mass);
    acceleration.add(f);   
  }
  
  // F = G * m1 * m2 * r / r * r
  PVector attract(Mover m) {
    PVector force = PVector.sub(location, m.location);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 25.0);
    
    force.normalize();
    float strength = (G * mass * m.mass) / (distance * distance);
    force.mult(strength);
    return force;
  }



  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } 
    else if (location.y < 0) {
      location.y = height;
    }
  }

}


