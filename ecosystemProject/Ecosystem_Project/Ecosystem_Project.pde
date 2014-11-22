// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com


Snake snake;
Fly fly;

void setup() {
  size(640,360);
  snake = new Snake();
  fly = new Fly(); 
}

void draw() {
  background(255);
  
  snake.update();
  snake.checkEdges();
  snake.display();


  fly.update();
  fly.checkEdges();
  fly.display(); 
  
}  
  

