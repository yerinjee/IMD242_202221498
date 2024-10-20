// int ramdomSeed = 6543;
int randomSeed = int(random(100000000));

float h;
float budD;
float pettalD;

void mousePressed() {
 randomSeed = int(random(100000000));
println(randomSeed);
}

void setup() {
  size(800, 800);
  h = height * 0.5;
  budD = 20;
  pettalD = 200;
}

//void mousePressed() {
//  randomSeed = int(random(10000));
//}

void draw() {
  randomSeed(randomSeed);
  background(255);
 
  pushMatrix();
  translate(width * 0.5, height);
  rotate(radians(5));
 line(0, 0,  0, -h);
 pushMatrix();
 translate(0, -h);
 
int petalNum = int(random(5, 21));
 float petalArcA = 0.25 * 360 / float(petalNum);
 
 for(int n = 0; n < petalNum; n++){
   pushMatrix();
   rotate(radians(n * 360 / float(petalNum) - 90));
 arc(0, 0,pettalD, pettalD, radians(-petalArcA), radians(petalArcA), PIE );
 popMatrix();
 }

 circle(0, 0, budD);
 popMatrix();
 popMatrix();
}
