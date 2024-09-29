//https://www.youtube.com/watch?v=4JzDttgdILQ&t=8274s 디자인 참고

void setup() {
  size(640, 360);
  rectMode(CENTER);
}

void draw() {
  background(0);
  stroke(255);
  fill(170);

  if (mouseY < height / 4) {
    line(width * .5 - 30, height * .13 - 30,
      width * .5 + 30, height * .13 + 30);
  } else if (mouseY < height /4 * 2) {
    square(width * .5, height * .38, 60);
  } else if (mouseY < height /4 * 3) {
    rect(width * .5, height * .63, 90, 30);
  } else if (mouseY < height /4 * 4) {
    circle(width * .5, height * .88, 60);
  }

  stroke(170);
  strokeWeight(4);
  line(0, height / 4, width, height / 4);
  line(0, height / 4 * 2,
    width, height / 4 * 2);
  line(0, height / 4 * 3,
    width, height / 4 * 3);
}
