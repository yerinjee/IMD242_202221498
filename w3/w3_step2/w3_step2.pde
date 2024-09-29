float x = random(width);
float y = random(height);
float r = random(255);
float g = random(255);
float b = random(255);

void setup() {
  size(1280, 720);
  background(0);
  noStroke();
}

void draw() {
  x = random(width);
  y = random(height);
  r = random(127, 255);
  g = random(64, 127);
  b = random(16);
  fill(r, g, b);
  circle(x, y, 20);
}
