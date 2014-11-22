class Snake extends Mover {
    float theta = 0;
  
   Snake(float m, float x , float y) {
     super(m, x, y);
    
     topspeed = 2;  
   }
   
   
   void hunt(Mover m) {
      PVector force = PVector.sub(location, m.location);
      float distance = force.mag();
      distance = constrain(distance, 5.0, 25.0);
      
      PVector flyTarget = fly.attract(snake);
       
       println(distance);
     
     if(distance > 20)
       this.applyForce(flyTarget);
   }
    
   void display() {
      stroke(0);
      fill(255,0, 0);
      ellipse(location.x,location.y, mass * 16, mass * 16);
   }    
}
