// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// Forces (Gravity and Fluid Resistence) with Vectors 
 
// Demonstration of multiple force acting on bodies (Mover class)
// Bodies experience gravity continuously
// Bodies experience fluid resistance when in "water"

// Five moving bodies
Mover[] movers = new Mover[1];

// Liquid
Lift lift;

void setup() {
  size(640, 360);
  reset();
  // Create liquid object
  lift = new Lift(width * .3, 0, width * .7, height, 0.1);
}

void draw() {
  background(255);
  
  // Draw water
  lift.display();

  for (int i = 0; i < movers.length; i++) {
    
    // Is the Mover in the liquid?
    if (lift.contains(movers[i])) {
      // Calculate drag force
      PVector dragForce = lift.drag(movers[i]);
      // Apply drag force to Mover
      movers[i].applyForce(dragForce);
    }

    // Gravity is scaled by mass here!
    PVector wind = new PVector(0.1, 0);
    // Apply gravity
    movers[i].applyForce(wind);
   
    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
  fill(0);
  text("click mouse to reset",10,30);
  
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    //movers[i] = new Mover(random(0.5, 3), 40+i*70, 0);
    
    movers[i] = new Mover(random(0.5, 3), 0, height - random(0.5, 3) - 20);
  }
}







