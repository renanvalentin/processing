/*
* Author: Renan Valentin
* Title: Drag surface area
* Date: November 21, 2014
* Original: mayarichman
*/

class Mover {

  // location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  // Mass is tied to size
  float mass;
  
  int hBox;
  int wBox;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    
    hBox = (int)(mass * random(10, 16));
    wBox = (int)(mass * random(10, 16));
  }

  // Newton's 2nd law: F = M * A
  // or A = F / M
  void applyForce(PVector force) {
    // Divide by mass 
    PVector f = PVector.div(force, mass);
    // Accumulate all forces in acceleration
    acceleration.add(f);
  }

  void update() {
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Location changes by velocity
    location.add(velocity);
    // We must clear acceleration each frame
    acceleration.mult(0);
  }
  
  // Draw Mover
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127, 200);
    //ellipse(location.x, location.y, mass*16, mass*16);
    
    rect(location.x, location.y, wBox, hBox);
  }
  
  // Bounce off bottom of window
  void checkEdges() {
    if (location.y + hBox> height) {
      velocity.y *= -0.5;  // A little dampening when hitting the bottom
      location.y = height - hBox;
    }
  }
}

