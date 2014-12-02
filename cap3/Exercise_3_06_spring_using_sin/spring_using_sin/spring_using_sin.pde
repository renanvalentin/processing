void setup() {
 size(640, 360); 
}

void draw() {
  background(255);
  
  float period = 120;
  float amplitude = height;
  //float x = amplitude * cos(TWO_PI * frameCount / period);
  float y = amplitude * sin(TWO_PI * frameCount / period);
  y = map(y, amplitude * - 1, amplitude, 0, amplitude );
  
  stroke(0);
  fill(175);
  translate(width/2, 0);
  line(0, 0, 0, y);
  ellipse(0, y, 20, 20);
  
}
