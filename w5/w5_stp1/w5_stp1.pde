float rectW, rectH, rectA, rectX, rectY;

void setup() {
  size(640, 480);

  rectW = 160;
  rectH = 20;
  rectA = 30;
  rectX = 100;
  rectY = 20;
  //rectA = TAU / 360 * 30;

  rectMode(CENTER);
}

void draw() {
  rectX = mouseX;
  rectY = mouseY;
  background(255);
  translate(rectX, rectY);
  rotate(radians(rectA));
  noFill();
  stroke(0);
  rect(0, 0, rectW, rectH);
  noStroke();
  fill(255, 0, 0);
  circle(0, 0, 10);
  circle(rectW * 0.5, 0, 10);
  rectA++;
}
