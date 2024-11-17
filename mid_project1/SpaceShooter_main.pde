Star[] stars = new Star[200]; // 200개의 별이 생성되어 관리되도록 함.
Player player;    // 플레이어 우주선
ArrayList<Missile> missiles; // 미사일 생성 제거 관리를 위해 미사일은 어레이리스트로 불러옴.
ArrayList<Enemy> enemies; //적 우주선 관리하는 ArrayList 생성해줌.
ArrayList<Explosion> explosions; //폭발 효과 관리하는 어레이리스트.
int playerX, playerY;
int score = 0;

void setup() {
  //size(640, 480);
  fullScreen(); //풀스크린모드 적용함.

  missiles = new ArrayList<Missile>();
  enemies = new ArrayList<Enemy>();
  explosions = new ArrayList<Explosion>();

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star(); // 셋업에서 위에서 언급한 200개의 별들이 각각 초기화되어 실행되도록 함.
  }

  player = new Player(); // 마찬가지로 플레이어 실행되도록.

  //초반에 바로 생성되는 적 우주선을 화면 상단 너머에 8개정도 만들어줌.
  for (int i = 0; i < 8; i++) {
    spawnEnemy();
  }
}

void spawnEnemy() {
  // 랜덤 위치에 새로운 적 우주선 생성
  enemies.add(new Enemy(random(50, width - 50), random(-200, -50)));
}

// 마우스 클릭으로 미사일 발사되도록 함. 일정한 간격을 유지하며 미사일을 생성하기 위해 챗gpt 활용하였음.
void mousePressed() {
  // 마우스를 클릭하면 1-3 값의 랜덤한 수의 미사일을 생성하도록 함.
  int missileCount = int(random(1, 4)); // 1~3개의 미사일 생성함.
  float spacing = 30; // 미사일 간격
  float totalWidth = (missileCount - 1) * spacing; //30간격 주기 위해 전체 폭에서 미사일 수 나눠줌.
  float startX = player.x - totalWidth / 2; // 첫 번째 미사일의 시작 위치를 플레이어 우주선 가운데로 지정함.

  for (int i = 0; i < missileCount; i++) {
    float missileX = startX + i * spacing; // 각 미사일의 x 좌표를 구해줌.
    float missileSize = random(3, 7); // 미사일 크기 살짝 랜덤하게 해줌.
    missiles.add(new Missile(missileX, player.y, missileSize));
  }
}



void draw() {
  background(5);

  // 텍스트 사용+ Arraylist 크기 화면 좌측 상단에 출력하기 위해 챗 gpt 활용함.
  fill(255, 0, 0);
  textSize(22);
  text("Missile Count: " + missiles.size(), 20, 30);

  fill(255, 0, 0);
  textSize(22);
  text("Enemy Count: " + enemies.size(), 20, 60);

  fill(255, 0, 0);
  textSize(22);
  text("Explosion Count: " + explosions.size(), 20, 90);

  // 스코어는 미사일과 적 우주선이 충돌할 때 마다 100 씩 증가함.
  fill(255, 0, 0);
  textSize(22);
  text("Score: " + score, 20, 120);

  for (int i = 0; i < stars.length; i++) {
    stars[i].move();
    stars[i].display(); // star 클래스에 만든 move, display 불러와서 별을 계속 그리도록 함.
  }

  player.update();
  player.display(); // 플레이어 클래스에서 만든 플레이어 우주선 그리도록.

  //미사일 클래스에서 만든거 그려줌.
  for (int idx = 0; idx < missiles.size(); idx++) {
    Missile aMissile = missiles.get(idx);
    aMissile.update(); //미사일 이동하는 것 불러옴.
    aMissile.display(); //미사일 그린 것 불러옴.

    //미사일이 화면 밖으로 나가 true 반환되면 제거되는 것을 구현하기 위해 챗gpt 활용함.
    if (aMissile.offScreen()) {
      missiles.remove(idx);
    }
  }

  // 적 우주선 클래스 만든거 그려줌.
  for (int i = enemies.size() - 1; i >= 0; i--) {
    Enemy aEnemy = enemies.get(i);
    aEnemy.update();
    aEnemy.display();

    //적 우주선이 화면을 벗어났을 때 그 적을 제거하고, 새로운 적 우주선을 생성하는 로직을 챗gpt활용.
    if (aEnemy.y > height) {
      enemies.remove(i); //화면을 벗어난 적 우주선 제거하는 코드.
      spawnEnemy(); //새로운 적 우주선 추가해주는 코드.
      continue; //continue를 사용해 현재 적 우주선에 대한 처리를 마치고 다음 적 우주선을 처리함.
    }

    // 적 우주선과 미사일 충돌하면 우주선이 제거되고 새로운 우주선 생성해주는 코드.
    // 충돌 시 점수를 증가시킴.
    for (int j = missiles.size() - 1; j >= 0; j--) {
      Missile m = missiles.get(j);
      //충돌 발생 시
      if (aEnemy.isHit(m)) {
        //충돌 발생 시 충돌된 적 우주선 위치에 폭발 효과 발생하는 코드.챗gpt활용.
        explosions.add(new Explosion(aEnemy.x, aEnemy.y)); 
        enemies.remove(i);  //충돌된 적 우주선 제거 코드.
        missiles.remove(j); //충돌된 미사일 제거 코드.
        score += 100;       //충돌할 때 마다 100점 씩 점수를 증가시킴.
        spawnEnemy();       //하나 사라지면 새로운 적 우주선을 추가해주는 코드.
        break;
      }
    }
  }
  //폭발효과 만든거 불러옴.
  for (int i = explosions.size() - 1; i >= 0; i--) {
    Explosion aExplosion = explosions.get(i);
    aExplosion.update();
    aExplosion.display();

    //폭발 효과가 끝나면 제거되도록 하는 코드.
    if (aExplosion.isFinished()) {
      explosions.remove(i);
    }
  }
}
