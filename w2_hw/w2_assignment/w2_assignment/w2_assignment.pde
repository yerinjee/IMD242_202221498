void setup() {
  size(640, 480);
  background(255, 130, 36);
}

void draw() {

  //발
  strokeWeight(6.5);
  stroke(#212023);
  fill(#F2BBC5);
  circle(270, 356, 40);
 
    //발2
  strokeWeight(6.5);
  stroke(#212023);
  fill(#F2BBC5);
  circle(350, 356, 40);

  //몸통
  strokeWeight(6.5);
  stroke(#212023);
  fill(#F2BBC5);
  circle(313, 290, 150);


  //얼굴형
  strokeWeight(6.5);
  stroke(#212023);
  fill(#F2BBC5);
  bezier(320, 130, 175, 130, 175, 335, 320, 320);
  bezier(320, 130, 450, 130, 450, 335, 320, 320);

  noStroke();
  fill(255);

  ellipse(270, 230, 50, 50);//오른쪽 눈 흰자

  ellipse(363, 230, 50, 50);//왼쪽 눈 흰자

  fill(0);

  float lx=map(mouseX, 0, 3000, 253, 313);//왼쪽 눈동자 범위 x축

  float y=map(mouseY, 0, 1700, 220, 280);//왼쪽 눈동자 범위 y축

  float rx=map(mouseX, 0, 3000, 363, 423);//오른쪽 눈동자 범위 x축

  fill(#212023);
  ellipse(lx+10, y, 35, 35);//왼쪽 눈동자

  ellipse(rx-10, y, 35, 35);//오른쪽 눈 흰자

  fill(255);
  ellipse(lx-5, y, 15, 15);//왼쪽 안광

  ellipse(rx-25, y, 15, 15);//오른쪽 안광

  //눈썹
  fill(#956149);
  ellipse(276, 186, 24, 14);
  ellipse(353, 186, 24, 14);



  //코선
  strokeWeight(5);
  stroke(#212023);
  line(316, 246, 316, 260);

  //코
  noStroke();
  fill(#956149);
  bezier(317, 230, 295, 231, 310, 250, 317, 248);
  bezier(317, 230, 340, 231, 325, 250, 317, 248);

  //입
  strokeWeight(5);
  stroke(#212023);
  fill(#E07570);

  bezier(296, 260, 293, 285, 338, 289, 337, 260);
  line(296, 260, 337, 260);
  noStroke();
  fill(255);
  rect(310, 263, 13, 6.3, 1, 1, 13, 13);

  //귀
  strokeWeight(6.5);
  stroke(#212023);
  fill(#F2BBC5);
  beginShape();
  vertex(302, 135);
  bezierVertex(300, 132, 248, 20, 235, 31);
  bezierVertex(210, 60, 225, 118, 260, 148);
  endShape();

  //오른쪽 귀귀
  strokeWeight(6.5);
  stroke(#212023);
  fill(#F2BBC5);
  beginShape();
  vertex(323, 135);
  bezierVertex(324, 134, 380, 5, 390, 33);
  bezierVertex(430, 70, 368, 132, 360, 142);
  endShape();
 
  //
   strokeWeight(5);
  stroke(#212023);
  line(369,335,369,330);
  line(256,340,257,330);
 
}
