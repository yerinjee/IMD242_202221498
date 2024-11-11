let colours = ['#FF885B', '#FFE5CF', '#557C56', '#33372C'];

let snow = [];

function setup() {
  createCanvas(600, 400);
  for (let idx = 0; idx < 100; idx++) {
    let rad = random(5, 20);
    let newSnow = new Ball(
      random(rad + 5, width - rad - 5),
      random(rad + 5, height - rad - 5),
      random(1, 10),
      rad,
      colours[int(random(colours.length))]
    );
    snow.push(newSnow);
  }
}

function draw() {
  for (let idx = 0; idx < snow.length; idx++) {
    snow[idx].update();
    snow[idx].bound();
  }

  background(255);
  for (let idx = 0; idx < snow.length; idx++) {
    snow[idx].display();
  }
}

//두번째 코드

class Ball {
  // x = undefined;
  // y = undefined;
  // vx = undefined;
  // vy = undefined;
  // rad = undefined;
  // colour = undefined;

  constructor(posX, posY, speed, ballRad, ballColour) {
    this.x = posX;
    this.y = posY;
    let deg = random(360);
    this.vx = speed * cos(radians(deg));
    this.vy = speed * sin(radians(deg));
    this.rad = ballRad;
    this.colour = ballColour;
  }

  update() {
    this.x += this.vx;
    this.y += this.vy;
  }

  bound() {
    if (this.x < this.rad || this.x > width - this.rad) {
      this.vx *= -1;
    }
    if (this.y < this.rad || this.y > height - this.rad) {
      this.vy *= -1;
    }
  }

  display() {
    noStroke();
    fill(this.colour);
    circle(this.x, this.y, 2 * this.rad);
  }
}
