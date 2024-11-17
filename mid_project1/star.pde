class Star {
  float x, y, speed, size;

  Star() {
    x = random(width);
    y = random(-height); // -를 붙여 화면 위에서 시작하도록 함.
    speed = random(1, 3);   // 떨어지는 속도 랜덤하게
    size = random(1, 3);    // 별의 크기 랜덤하게
  }

//별의 움직임. 화면 아래로 떨어지면 초기화되어 다시 화면위에서 나타나게.
  void move() {
    y += speed; // 별이 아래로 떨어지는 동작 
    if (y > height) {
      y = random(-50, 0); // 화면 아래로 떨어지면 화면 위로 돌아가기 
      x = random(width);
      speed = random(1, 3);
      size = random(1, 3);
    }
  }

  void display() {
    noStroke();
    fill(255, 255, 200, 200); //별에 약간 노란빛을 더해줌 
    ellipse(x, y, size, size); 
  }
}
