/*
 * Author: Renan Valentin
 * Title: Car simulation
 * Date: November 22, 2014
 * Original: Daniel Shiffman
 */


class Car {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  float xoff, yoff;

  float r = 16;

  Car() {
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    acceleration = new PVector(1, 1);
    topspeed = 4;
    xoff = 1000;
    yoff = 0;
  }

  void update() {

   
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    acceleration.mult(0);
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force, 1.2);
    acceleration.add(f);
  }

  void display() {
    float theta = velocity.heading();

    stroke(0);
    strokeWeight(2);
    fill(127);
    pushMatrix();
    rectMode(CENTER);
    translate(location.x, location.y);
    rotate(theta);
    rect(0, 0, 30, 10);
    popMatrix();
  }
  
  void turnLeft() {
    
   velocity.x *= -1;
   
  }
  
  void turnRight() {
   velocity.x *= -1;
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


