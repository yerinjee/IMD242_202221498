int randomSeed = int(random(100000000));

void mousePressed() {
  randomSeed = int(random(100000000));
  println(randomSeed);
}

void setup() {
  size(800, 800);
}

void draw() {
  randomSeed(randomSeed);
  background(0, 120, 100);
  fill(230, 250, 250);
  rect(0, 0, 800, 200);

  for (int n = 0; n < 5; n++) {
    house(random(width), random(1 / 3.0 * height, 2 / 3.0 * height), random(50, 100), random(40, 80));
  }
 
  cloud(random(width), random(50, 150), random(50, 110));
  cloud(random(width), random(50, 150), random(50, 110));
}

void house(float x, float y, float houseWidth, float houseHeight) {

  fill(random(100, 200), random(100, 200), random(100, 200));
  rect(x, y - houseHeight, houseWidth, houseHeight);

  fill(random(100, 150), random(100, 150), random(100, 150));
  triangle(x, y - houseHeight, x + houseWidth / 2,
    y - houseHeight - houseHeight / 2, x + houseWidth, y - houseHeight);

  fill(100, 150, 150);
  float doorWidth = houseWidth / 4;
  float doorHeight = houseHeight / 3;
  rect(x + (houseWidth - doorWidth) / 2, y - doorHeight, doorWidth, doorHeight);

  fill(150, 150, 100);
  float windowX = houseWidth / 1.3;
  float windowY = houseHeight * 0.8;
  rect(x + (houseWidth - windowX) / 2, y - windowY, 15, 15);

  fill(150, 150, 100);
  float windowX2 = houseWidth / 50.0;
  float windowY2 = houseHeight * 0.8;
  rect(x + (houseWidth - windowX2) / 2, y - windowY2, 15, 15);

  stroke(255);
}

  void cloud(float x, float y, float size) {
    fill(255);
    ellipse(x, y, size, size / 2);
    ellipse(x - size * 0.4, y + size * 0.1, size * 0.7, size / 3);
    ellipse(x + size * 0.4, y + size * 0.1, size * 0.7, size / 3);
    ellipse(x - size * 0.2, y - size * 0.1, size * 0.5, size / 4);
    ellipse(x + size * 0.2, y - size * 0.1, size * 0.5, size / 4);
  }
