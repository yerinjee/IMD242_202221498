float x = random(width);
float y = random(height);
float r = random(255);
float g = random(255);
float b = random(255);
float size = random(20, 100);

void setup() {
  size(1280, 720);
  background(0);
  noStroke();
  colorMode(HSB);
}

void draw() {
  x = random(width);
  y = random(height);
  r = random(127, 255);
  g = random(64, 127);
  b = random(196, 255);
  size = random(20, 100);
  fill(r, g, b);
  circle(x, y, size);
  
}
