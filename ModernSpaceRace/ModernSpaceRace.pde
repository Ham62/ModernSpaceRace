
// Button
// Prog bar?
// money display
//

void setup(){
  frameRate(60);
  size(720, 480);
}

int time = 0;

void draw(){
  background(255);
  time++;
  fill(0, 255, 255);
  text(time, 100, 120);
}



void keyPressed() {
}


void keyReleased() {
}
