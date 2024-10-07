//1. 마우스 위치에 따라 최소 3개에서 최대 16개의 사각 타일로 채운다.
float rectX, rectY, rectW, rectH;
int tileNum;


void setup() {
  size(600, 600);
}

void draw() {
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16 + 1));
  float tileSize = width / float(tileNum);
  for(int row = 0; col < tileNum; row++) {
    for(int col = 0; col < tileNum; col++) {
   float rectX =tileSize * col;
   rect(rectX, 10, tileSize, tileSize);
 }
  }
 
}
