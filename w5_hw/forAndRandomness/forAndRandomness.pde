//1. 마우스 위치에 따라 최소 3개에서 최대 16개의 사각 타일로 채운다.
int tileNum;
int randomSeed = 0;
float noiseMult = 0.01;

void setup() {
  size(600, 600);
}

void draw() {
  noiseSeed(randomSeed);
  background(0);
  randomSeed(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  //noiseMult = map(mouseY, 0, height, 0.01, 0.0005);
  noiseMult = pow(10, map(mouseY, 0, height, -1, -5));
  float tileSize = width / float(tileNum);
  
  float yMoveFactor = map(mouseY, 0, height, 0.005, 0.0001); 
  float xMoveFactor = map(mouseX, 0, width, 0.1, 0.5);
  
  for (int row = 0; row < tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX =tileSize * col;
      float rectY =tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      //float randomVal = random(1);
      //float noiseVal = noise(centerX * noiseMult, centerY * noiseMult);
 
      float noiseVal = noise(centerX * noiseMult, centerY * noiseMult, millis() * yMoveFactor * xMoveFactor);
      
      noFill();
      noStroke();
      rect(rectX, rectY, tileSize, tileSize);
      //fill(255 * randomVal);
      //fill(255 * noiseVal);
      stroke(255);
      circle(centerX, centerY, tileSize);
      pushMatrix();
      translate(centerX, centerY);
      // rotate(radians(30 * randomVal));
      rotate(radians(360 * noiseVal));
      line(0, 0, tileSize * 0.8 * 0.5, 0);
      fill(255);
      circle(tileSize * 0.8 * 0.5, tileSize * 0.8 * 0.5 * 0.05, tileSize * 0.2);
      popMatrix();
    }
  }
}
