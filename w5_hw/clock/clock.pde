//https://ejleep1.tistory.com/591 참고

void setup() {
  size(800, 800);
}

void draw() {
  background(5);
  translate(width / 2, height / 2);
  strokeWeight(8);
  noFill();

  fill(255);
  noStroke();
  circle(0, 0, 650);  
 
  stroke(5);
  strokeWeight(2);
  for (int marker = 0; marker < 60; marker++) {
    float angle = map(marker, 0, 60, 0, 360);
    float x1 = cos(radians(angle)) * 330;
    float y1 = sin(radians(angle)) * 330;
    float x2 = cos(radians(angle)) * (marker % 5 == 0 ? 300 : 310);
    float y2 = sin(radians(angle)) * (marker % 5 == 0 ? 300 : 310);
    strokeWeight(marker % 5 == 0 ? 3 : 1);
    line(x1, y1, x2, y2);
  }

  int hr = hour() % 12;
  int mn = minute();      
  int sc = second();  

  float s = map(sc, 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(mn, 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hr + mn / 60.0, 0, 12, 0, TWO_PI * 2) - HALF_PI;

  pushMatrix();
    strokeWeight(5);
  rotate(h);
  stroke(5);
  line(0, 0, 200, 0);
  popMatrix();

  pushMatrix();
  strokeWeight(4);
  rotate(m);
  stroke(5);
  line(0, 0, 265, 0);
  popMatrix();

  pushMatrix();
    strokeWeight(3);
  rotate(s);
  stroke(255, 50, 150);
  line(-30, 0,255, 0);
  popMatrix();

  noStroke();
  fill(255, 50, 150);
  circle(0, 0, 20);
  point(0, 0);
}
