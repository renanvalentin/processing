/*
* Author: Renan Valentin
* Title: Drag surface area
* Date: November 21, 2014
* Original: Daniel Shiffman
*/
 
 // Lift class 
 class Lift {

  
  // Liquid is a rectangle
  float x,y,w,h;
  // Coefficient of drag
  float c;

  Lift(float x_, float y_, float w_, float h_, float c_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
  }
  
  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.location;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }
  
  // Calculate drag force
  PVector drag(Mover m) {
    // L = (1/2) * d * v² * s *CL
    
    
    float d = 1.12;
    float v = m.velocity.mag() * m.velocity.mag();
    float s = m.wBox / m.hBox;
    float dragMagnitude = 0.5 * c * v;
    //    dragMagnitude *= m.wBox / 5;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    //dragForce.mult(-1);
    
    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    
       dragForce.limit(2);
    
    return dragForce;
  }
  
  void display() {
    noStroke();
    fill(50);
    rect(x,y,w,h);
  }

}

