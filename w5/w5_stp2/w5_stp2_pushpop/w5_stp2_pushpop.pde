float rectW, rectH;
float aX, aY, aA, bX, bY, bA;

void setup() {
  size(640, 480);
  rectW = 160;
  rectH = 20;
  aA = 30;
  bX = width * 0.5;
  bY = height * 0.5;
  bA = 60;

  background(0);
  rectMode(CENTER);
}

void draw() {
  aX = mouseX;
  aY = mouseY;

  background(0);
  pushMatrix();
  translate(aX, aY);
  rotate(radians(aA));
  fill(255, 0, 0);
  rect(0, 0, rectW, rectH);
  popMatrix();
  translate(bX, bY);
  rotate(radians(bA));
  fill(0, 255, 0);
  rect(0, 0, rectW, rectH);
}
