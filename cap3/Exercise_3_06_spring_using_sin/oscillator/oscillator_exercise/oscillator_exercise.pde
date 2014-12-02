/*
* Author: Renan Valentin
* Title: Oscillators
* Date: November 26, 2014
* Original: Daniel Shiffman
*/

Oscillator[] oscillators;

void setup() {
 size(640, 360); 
 oscillators = new Oscillator[5];
 
 for(int i = 0; i < oscillators.length; i++) {
  oscillators[i] = new Oscillator();
 } 
}

void draw() {
  background(255);
  
  for(Oscillator oscillator : oscillators) {
    oscillator.oscillate();
    oscillator.display();
  } 
}
