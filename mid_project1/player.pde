class Player {
  float x, y; // 플레이어의 위치. 업데이트에서 mouseX,Y로 설정해줄 예정.
  float size = 40; // 플레이어 우주선 크기가 40이 되도록 함.

  Player() {
    x = width / 2; // 처음 켜면 중간에 놓치도록 함.
    y = height - 100; // 화면 최하단에서 -100지점에 놓치도록 함.
  }

  void update() {
    x = mouseX;     // 마우스의 X 좌표를 따라다니도록

    // 화면 경계를 벗어나지 않도록 제한함. 챗gpt 활용
    if (x < size * 0.9) {
      x = size * 0.9;
    } else if (x > width - size * 0.9) {
      x = width - size * 0.9;
    }
  }

  void display() {
    // 플레이어 우주선 본체 그리기.
    fill(100, 150, 255);
    stroke(255);
    strokeWeight(2);
    triangle(
      x, y - size / 3, 
      x - size / 2, y + size, 
      x + size / 2, y + size  
      );

    // 엔진 불꽃 위치 설정함. 엔진 불꽃은 따로 그려줌.
    displayEngine(x -15, y + 45);
    displayEngine(x + 15, y + 45);
  }
}

// 플레이어 우주선 엔진 그리기.
void displayEngine(float xE, float yE) {
  // r값 높게 랜덤, g값 낮게 랜덤, b값 0으로 해서 주황색 채도가 랜덤하게 나오도록 함.
  fill(random(200, 255), random(100, 200), 0);
  noStroke();
  beginShape();
  vertex(xE - 5, yE);
  vertex(xE + 5, yE);
  vertex(xE, yE + random(10, 20)); // 엔진 불꽃 높이 랜덤하게해서 나아가는 것처럼.
  endShape(CLOSE);
}
