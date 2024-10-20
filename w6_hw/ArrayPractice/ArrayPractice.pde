//int fruitAmt;
//String fruitName;
int[] fruitAmts;
String[] frArrayPracticeArrayPracticeArrayPracticeuitNames = {"apple",
  "orange",
  "banana",
  "kiwi",
  "peach",
  "plum",
  "tangerine"};
color[] fruitColors;


void setup() {
  size(960,720);
  // fruitAmt = int(random(5, 100));
  //fruitName = "Banana";
  fruitAmts = new int[fruitNames.length];
  fruitColors = new color[fruitNames.length];

  for (int n = 0; n < fruitAmts.length; n++) {
    if (n == 0) {
      fruitAmts[n] = 50;
      fruitColors[n] = color(random(100, 255), random(100, 255), random(100, 255));
    } else {
      fruitAmts[n] = int(random(5, 100));
      fruitColors[n] = color(random(100, 255), random(100, 255), random(100, 255));
    }
  }
}


float barGap = 88;
float barWidth = 24;
float fixedHeight = 200;

void draw () {
  background(0);
  strokeWeight(barWidth);

  float yBase = height * 0.6;
 float totalWidth = (fruitNames.length - 1) * barGap;
  float xStart = (width - totalWidth) / 2;
 
  //stroke(255);
  //strokeCap(SQUARE);
  //textAlign(CENTER);
  //textSize(24);
  //fill(255, 0, 0);
  //line(x, height * 0.5, x, height * 0.5 - 2 * fruitAmts[0]);
  //text(fruitNames[0], x, height * 0.5 + 30);
  //text(fruitAmts[0], x, height * 0.5 - 2 * fruitAmts[0] - 20);

  //   stroke(255);
  //strokeCap(SQUARE);
  //textAlign(CENTER);
  //textSize(24);
  //fill(255, 0, 0);
  //line(x + barGap, height * 0.5, x+ barGap, height * 0.5 - 2 * fruitAmts[1]);
  //text(fruitNames[1], x+ barGap, height * 0.5 + 30);
  //text(fruitAmts[1], x+ barGap, height * 0.5 - 2 * fruitAmts[1] - 20);

  for (int n =0; n < fruitNames.length; n++) {
 float xPos = xStart + barGap * n;
   
    stroke(fruitColors[n]);
    strokeWeight(24);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(24);
    fill(fruitColors[n]);

     line(xPos, yBase, xPos, yBase - 2 * fruitAmts[n]);
     text(fruitNames[n], xPos, yBase + 30);
    text(fruitAmts[n], xPos, yBase - fixedHeight / 2 - 110);


    strokeWeight(1);
    noFill();
    rectMode(CENTER);
   rect(xPos, yBase - fixedHeight / 2, barWidth * 1, fixedHeight);
  }
}
