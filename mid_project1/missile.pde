class Missile {
  float x, y; // 미사일 위치 지정을 위함.
  float size; // 미사일의 크기를 랜덤하게 주기 위함.
  float speed; // 미사일 속도를 위함. (일정하게 줄 것)

  Missile(float x, float y, float size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = 5; //미사일 속도는 일정하게.
  }

  void update() {
    y -= speed; //화면 위쪽으로 이동하도록 해줌.
  }

  void display() {
    fill(random(200, 255), random(100, 200), 0); //엔진과 동일한 색상 랜덤 활용함.
    noStroke();
    ellipse(x, y, size, size * 2.5); //타원형 미사일으로 제작함.
  }

//화면을 벗어나면 true 반환하도록 해서 어레이리스트통해 제거되도록 챗gpt 활용함.
  boolean offScreen() {
    return y + size < 0; //미사일이 화면 밖으로 나갔는지.
  }
}
