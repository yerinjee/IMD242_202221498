float sqSize = random(32, 80);
float sqThickness = random(4, 12);

void setup() {
  size(640, 480);
  background(0);
  rectMode(CENTER);
  // circleX=0; (float circleX = 0;에서 = 0;이랑 같음)
}

void mousePressed() {
  sqSize = random(32, 80);
  sqThickness = random(4, 12);
}

void draw() {
  sqSize = random(32, 80);
  sqThickness = random(4, 12);
  fill(255, 255, 0, 16);
  stroke(255, 64, 0, 16);
  strokeWeight(sqThickness);
  square(width * 0.5, height * 0.5, sqSize);
}
