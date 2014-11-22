class Fly extends Mover {
  
   Fly(float m, float x , float y) {
     super(m, x, y);
    
     topspeed = 2;  
   }
    
  
    void display() {
      stroke(0);
      strokeWeight(2);
      fill(127,200);
      ellipse(location.x,location.y, mass * 5, mass * 5);
    }
}
