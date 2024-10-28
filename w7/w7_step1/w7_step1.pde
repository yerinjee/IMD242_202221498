float[] ballX, ballY;
float[] ballVx, ballVy;
float[] ballRad;
int[] ballColour;
int ballNum = 200;

//float[] ball = {. . . . .}

int[] Colours = {
  0xFF020659,
  0xFF023059,
  0xFF012340,
  0xFFEBF222,
  0xFFF2E41D
};

void setup() {
  size(600, 400);
  ballX = new float[ballNum];
  ballY = new float[ballNum];
  ballVx = new float[ballNum];
  ballVy = new float[ballNum];
  ballRad = new float[ballNum];
  ballColour = new int[ballNum];


  for (int idx = 0; idx < ballNum; idx++) {
    ballX[idx] = width * 0.5;
    ballY[idx] = height * 0.5;
    float randomDeg = random(360);
    float speed = 5;
    ballVx[idx] = speed * cos(radians(randomDeg));
    ballVy[idx] = speed * sin(radians(randomDeg));
    ballRad[idx] = random(5, 20);
    ballColour[idx] =
    Colours[int(random(Colours. length))];
  }
}

void draw() {
  for (int idx = 0; idx < ballNum; idx++) {
    ballX[idx] += ballVx[idx];
    ballY[idx] += ballVy[idx];

    if (ballX[idx] < 0 + ballRad[idx] || ballX[idx] > width - ballRad[idx]) {
      ballVx[idx] *= -1;
    }
    if (ballY[idx] < 0 + ballRad[idx] || ballY[idx] > height - ballRad[idx]) {
      ballVy[idx] *= -1;
    }
  }

  background(255);
  noStroke();
  fill(255, 0, 0);

  for (int idx = 0; idx < ballNum; idx++) {
    fill(ballColour[idx]);
    circle(ballX[idx], ballY[idx], 2 * ballRad[idx]);
  }
}
