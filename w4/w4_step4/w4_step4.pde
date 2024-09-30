float tileSize;
float spacing;

void setup() {
  size(640, 480);

  tileSize = 10;
  spacing = 10;

  rectMode(CENTER);
  strokeWeight(1);
}

void draw() {
  background(0);

  for (int row = 0;
    row < height;
    row += spacing) {


    for (int column = 0;
      column < width;
      column += spacing ) {
      int x = column;
      int y = row;
      noFill();
      // stroke(255);

      //square(x + spacing * .5,
      //  y + spacing * 0.5,
      //  spacing);
      stroke(255, 0, 0);
      //square(x + spacing * .5,
      //  y + spacing * 0.5,
      //  tileSize);
      if (random(1) < 0.5) {
        line(x + spacing * .5 - tileSize * .5, y + spacing * .5 - tileSize * .5,
          x + spacing * .5 + tileSize * .5, y + spacing * .5 + tileSize * .5);
      } else {
        line(x + spacing * .5 + tileSize * .5, y + spacing * .5 - tileSize * .5,
          x + spacing * .5 - tileSize * .5, y + spacing * .5 + tileSize * .5);
      }
    }
  }
  noLoop();
}
