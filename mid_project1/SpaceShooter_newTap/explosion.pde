class Explosion {
  float x, y; // 폭발 위치 지정하는 용도임.
  float size = 0; //폭발 크기 지정해줌. 초기값은 0으로 지정 후 age흐르면 증가하게.
  float maxSize = 150; //폭발의 최대 크기 지정해줌.
  float lifespan = 30; //폭발의 지속 시간 지정해줌. 30 값 끝나면 폭발 사라짐.
  float age = 0; //폭발의 경과 시간 지정해줌.

  Explosion(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    age++; //폭발 경과 시간 흐르게 해줌.
    if (size < maxSize) {
      size += 3; //폭발의 크기가 증가하게 해줌.
    }
  }

  void display() {
    noFill();
    //마지막 라인의 투명도(255 - (age / lifespan) * 255)는 age를 기준으로 점점 사라지도록 설정함.
    stroke(255, 80, 80, 255 - (age / lifespan) * 255); 
    strokeWeight(3);
    ellipse(x, y, size, size); 
  }

  boolean isFinished() {
    return age > lifespan; //age가 lifespan보다 커지면 폭발 지속 시간 끝나서 반환되도록 함.
  }
}
