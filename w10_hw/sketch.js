let colours = ['#257180', '#F2E5BF', '#FD8B51', '#CB6040'];
let gravity = [0, 0.1];
let friction = 0.99;
let cnt = 0;
let mouse = [0, 0];

let confetties = [];

function setup() {
  createCanvas(800, 800);
}

function gen(x, y, n) {
  for (let i = 0; i < n; i++) {
    let randomW = random(4, 20);
    let randomH = random(4, 20);
    let randomForce = random(1, 10);
    let randomAngForce = random(-30, 30);
    let newConfetti = new Confetti(
      x,
      y,
      randomW,
      randomH,
      random(colours),
      randomForce,
      randomAngForce
    );
    confetties.push(newConfetti);
  }
}

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log('gen: ' + cnt);
  gen(mouse[0], mouse[1], cnt);
}

function keyPressed() {
  if (key === 'p' || key === 'P') {
    console.log('confetties: ' + confetties.length);
  }
}

function draw() {
  if (mouseIsPressed) {
    cnt++;
  }
  background(255);
  for (let i = confetties.length - 1; i >= 0; i--) {
    let aConfetti = confetties[i];
    aConfetti.update(gravity, friction);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(i, 1);
    }
  }
  for (let i = 0; i < confetties.length; i++) {
    confetties[i].display();
  }
}

//두번째 코드

class Confetti {
  constructor(x, y, w, h, color, force, angForce) {
    this.pos = [x, y]; // 위치
    this.vel = [0, 0]; // 속도
    this.size = [w, h]; // 크기
    this.color = color; // 색상
    this.ang = radians(random(360)); // 초기 회전 각도
    this.angVel = radians(angForce); // 회전 속도

    this.init(x, y, w, h, color, force, angForce);
  }

  init(x, y, w, h, color, force, angForce) {
    this.pos = [x, y];
    this.size = [w, h];
    this.color = color;

    let randomDir = radians(random(360));
    this.vel[0] = force * cos(randomDir);
    this.vel[1] = force * sin(randomDir);

    this.ang = radians(random(360));
    this.angVel = radians(angForce);
  }

  update(force, friction) {
    for (let i = 0; i < 2; i++) {
      this.vel[i] += force[i];
      this.pos[i] += this.vel[i];
      this.vel[i] *= friction;
    }

    this.ang += this.angVel;
    this.angVel *= friction;
  }

  display() {
    push();
    rectMode(CENTER);
    translate(this.pos[0], this.pos[1]);
    rotate(this.ang);
    noStroke();
    fill(this.color);
    rect(0, 0, this.size[0], this.size[1]);
    pop();
  }

  getDiagonal() {
    let sumSquare = pow(this.size[0] * 0.5, 2) + pow(this.size[1] * 0.5, 2);
    return sqrt(sumSquare);
  }

  isOutOfScreen() {
    let diagonal = this.getDiagonal();
    return (
      this.pos[0] < -diagonal ||
      this.pos[0] > width + diagonal ||
      this.pos[1] < -diagonal ||
      this.pos[1] > height + diagonal
    );
  }
}
