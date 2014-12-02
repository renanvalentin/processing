Car car;



void setup() {
  size(500, 480);  
  
  car = new Car();
}

void draw() {
  background(255);
  
  if (keyPressed == true) {
    if (key == CODED && keyCode == LEFT) {
      car.turnLeft();
      
    } else if (key == CODED && keyCode == RIGHT) {
      car.turnRight();
    }
  }
  
  car.update();
  car.checkEdges();
  car.display();
}

