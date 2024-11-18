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
  background(255, 0, 0);

  cp.loadPixels();
  //x,y 말고 0, 1, 2, 3 이렇게 불러올 수 있음. 2차원 어레이 접근 방식
  //pixel[0] = [r,g,b,a] 여야하는데 프로세싱에서만 이렇고 p5.js에서는 pixel[n+0]=R pixel[n+1]=G 이런식으로 되어 있음. 그래서 두번째의 rgb 값을 보려면 4부터 시작한다.
  // for (let idx = 0; idx < cp.pixels.length; idx++) {
  for (let idx = 0; idx < cp.pixels.length / 4; idx++) {
    // let colour = cp.pixels[idx];
    let g = cp.pixels[4 * idx + 1];
    let b = cp.pixels[4 * idx + 2];
    let r = cp.pixels[4 * idx];
    let a = cp.pixels[4 * idx + 3];
    let br = brightness([r, g, b]);
    let dia = map(br, 0, 255, 0, 20);
    let x = idx % cpW;
    let y = floor(idx / cpW);
    //여기서 x는 0,1,2,3 y는 0,0,0,0
    fill(255);
    circle(10 * x + 5, 10 * y + 5, dia);
  }
}
