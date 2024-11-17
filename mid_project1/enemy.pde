class Enemy {
  float x, y; 
  float speed = 3; //적 우주선 속도 일정하게 함.
  float size = random(20, 40); //적 우주선 크기 랜덤하게 함.

  Enemy(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void update() {
    y += speed; //아래로 이동하도록 하는 코드.
  }

  void display() {
    // 본체1 (큰 타원)
    fill(random(0,70), 180, random(0,70));
    stroke(0);
    ellipse(x, y, size * 2, size);  

    // 본체2 (작은 타원)
    fill(120, 255, 150, 98);
    stroke(255, 50);
    ellipse(x, y - size / 2, size * 1.6, size * 0.6);

    // 창문 (원 3개)
    fill(255);
    float windowSize = size * 0.1;
    ellipse(x - size * 0.3, y - size / 3, windowSize, windowSize);
    ellipse(x, y - size / 3, windowSize, windowSize);
    ellipse(x + size * 0.3, y - size / 3, windowSize, windowSize);

    // 다리 (원 2개)
    fill(255, 0, 0, 150);
    float legSize = size * 0.2;
    ellipse(x - size * 0.3, y + size / 3, legSize, legSize);
    ellipse(x + size * 0.3, y + size / 3, legSize, legSize);
  }

  // 적 우주선과 미사일의 충돌을 체크하는 것을 챗gpt에게 물어봄.
  // 미사일과 적 우주선 사이의 거리를 계산하여 충돌 여부를 판단함.
  boolean isHit(Missile m) {
    float d = dist(x, y, m.x, m.y);
    return d < size / 2;
  }
}
