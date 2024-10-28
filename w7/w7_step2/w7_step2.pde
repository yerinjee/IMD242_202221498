int[] colours = {
  0xFFFF885B,
  0xFFFFE5CF,
  0xFF557C56,
  0xFF33372C
};

Ball[] snow; //class 이름 -> 아무 이름으로 데이터 타입 만들기

void setup() {
  size(600, 400);
  snow = new Ball[500];
  for (int idx = 0; idx < snow.length; idx++) {
    float rad = random(5, 20);
    snow[idx] = new Ball(
      random(rad + 5, width - rad - 5),
      random(rad + 5, height - rad - 5),
      random(1, 10),
      rad,
      colours[int(random(colours.length))]);
  }
}

void draw() {
  background(255);
  for (int idx = 0; idx < snow.length; idx++) {
    snow[idx].bound(0.9);
    snow[idx].update();
  }

  for (int idx = 0; idx < snow.length; idx++) {
    snow[idx].display();
  }
}
