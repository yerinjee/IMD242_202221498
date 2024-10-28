ArrayList<Circle> circles;

void setup() {
  size(600, 600);
  circles = new ArrayList<Circle>();
  Circle aNewCircle = new Circle();
  aNewCircle.init(
    width * 0.5, height * 0.5,
    50);
  circles.add(aNewCircle);
}

void mousePressed() {
  Circle aNewCircle = new Circle();
  aNewCircle.init(
    mouseX, mouseY,
    random(10, 50));
  circles.add(aNewCircle);
}

void draw() {
  background(255);

  for (int idx = 0;
    idx < circles.size();
    idx++) {
    Circle aCircle = circles.get(idx);
    aCircle.display();
  }
}
