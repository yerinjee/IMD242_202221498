let cp;
let canvasW, canvasH;
let scale;
let cpW, cpH;

function setup() {
  canvasW = 640;
  canvasH = 480;

  scale = 0.1;
  cpW = canvasW * scale;
  cpH = canvasH * scale;
  createCanvas(canvasW, canvasH);
  cp = createCapture(VIDEO);
  cp.size(cpW, cpH);
  cp.hide();
}

function draw() {
  background(0);
  //image(cp, 0, 0, width, height);
  //console.log(cp.get(10, 10));
  noStroke();
  for (let y = 0; y < cpH; y++) {
    for (let x = 0; x < cpW; x++) {
      let colour = cp.get(x, y);
      let b = brightness(colour);
      fill(255);
      let diameter = map(b, 0, 255, 0, 40);
      circle(10 * x + 5, 10 * y + 5, diameter);

      //map(t, min, max, tMin, tMax)이다.
      //colour(r,g,b,a) 이다.
      // fill(colour[0], colour[1], colour[2]);
      // circle(10 * x + 5, 10 * y + 5, 10);
    }
  }
}
