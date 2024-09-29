//망점효과 https://www.youtube.com/watch?v=TUKNqfzJXH0 참고

float sqSize = random(5, 30);
float sqThickness = random(2, 10);
float r = random(255);
float g = random(255);
float b = random(255);
float x = random(width);
float y = random(height);
float distance;

void setup() {
  size(640, 480);
  background(0);
  rectMode(CENTER);
}

void mousePressed() {
  sqSize = random(5, 30);
  sqThickness = random(2, 10);
  r = random(255);
  g = random(255);
  b = random(255);
  background(0);
}

void draw() {
  sqSize = random(5, 30);
  sqThickness = random(2, 10);
  strokeWeight(sqThickness);
rect(mouseX-40, mouseY-40,mouseX-40, mouseY-40, sqSize-50);
rect(mouseX+40, mouseY+40,mouseX+40, mouseY+40, sqSize-50);
rect(mouseX-40, mouseY+40,mouseX-40, mouseY+40, sqSize-50);
rect(mouseX+40, mouseY-40,mouseX+40, mouseY-40, sqSize-50);
  rect(mouseX, mouseY,mouseX, mouseY, sqSize);
  for(int y=0; y<=height; y+=20){
    for(int x=0; x<=width; x+=20){
      distance=dist(x,y,mouseX,mouseY);
      fill(distance/5, 255-distance/5);
      ellipse(x,y,distance/10,distance/10);
    }
  }
  fill(r, g, b, 20);
  stroke(r/5, g, b, 20);
   r = random(255);
  g = random(255);
  b = random(255);
  

  x = random(width);
  y = random(height);
  circle(x, y, y/5);
}
