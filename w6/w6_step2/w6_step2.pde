// int ramdomSeed = 6543;
int randomSeed = int(random(100000000));

void mousePressed() {
  randomSeed = int(random(100000000));
  println(randomSeed);
}

void setup() {
  size(800, 800);
}

//void mousePressed() {
//  randomSeed = int(random(10000));
//}

void draw() {
  randomSeed(randomSeed);
  background(255);

  //for(int n = 0; n < 5; n++) {
  //flower(random(width));
  //}
  for (int n = 0; n < 5; n++) {
    flower(random(width), random(1 / 3.0 * height, 2 / 3.0 * height), 30, random(100, 200));
  }
}

void flower(float x, float h, float budD, float pettalD) {
  pushMatrix();
  translate(x, height);
  rotate(radians(random(-5, 5)));
  line(0, 0, 0, -h);
  pushMatrix();
  translate(0, -h);

  int petalNum = int(random(5, 21));
  float petalArcA = 0.25 * 360 / float(petalNum);

  for (int n = 0; n < petalNum; n++) {
    pushMatrix();
    rotate(radians(n * 360 / float(petalNum) - 90));
    arc(0, 0, pettalD, pettalD, radians(-petalArcA), radians(petalArcA), PIE );
    popMatrix();
  }

  circle(0, 0, budD);
  popMatrix();
  popMatrix();
}
