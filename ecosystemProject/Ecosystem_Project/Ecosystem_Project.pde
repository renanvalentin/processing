// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


Earth earth;

Snake snake;
Fly fly;

void setup() {
  size(640, 360);
  snake = new Snake(1, random(0, width), random(0, height));
  fly = new Fly(3, random(0, width), random(0, width));
  earth = new Earth();
}

void draw() {
  background(255);

  PVector snakeForceAttraction = earth.attract(snake);

  PVector flyAttraction = fly.attract(snake);
  snake.applyForce(flyAttraction);
  snake.applyForce(snakeForceAttraction);

  snake.update();
  snake.checkEdges();
  snake.display();
  
  
  
  PVector flyForceAttraction = earth.attract(fly);
  
  fly.applyForce(flyForceAttraction);

  fly.update();
  fly.checkEdges();
  fly.display();
  
  
  earth.drag();
  earth.hover(mouseX,mouseY);
  earth.display();
}  

void mousePressed() {
  earth.clicked(mouseX,mouseY); 
}

void mouseReleased() {
  earth.stopDragging(); 
}



