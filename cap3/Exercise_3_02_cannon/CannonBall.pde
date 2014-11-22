/*
 * Author: Renan Valentin
 * Title: Cannon ball
 * Date: November 22, 2014
 * Original: Daniel Shiffman
 */

class CannonBall { 
  // All of our regular motion stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float aAcceleration;
  float aVelocity;
  float angle;


  // Size
  float r = 8;
  
  float topspeed = 10;
  
  int colorIndex = 1;

  CannonBall(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    
    aAcceleration = acceleration.x / 10.0;
    aVelocity += aAcceleration;

    aVelocity = constrain(aVelocity,-0.1,0.1);
    
    angle += aVelocity;
    
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  
  void display() { 
    stroke(0);
    strokeWeight(2);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    fill(255, 255, 255);
    smooth();
    rect(0,0,r*2,r*2);
    popMatrix();
  }
}

