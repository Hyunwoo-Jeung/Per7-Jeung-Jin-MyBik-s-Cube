float x = 0;
float y = 0;

void setup(){
  size(600, 600, P3D);
  smooth();
}

void draw()
{ 
  camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);
  background(255);
  lights();
  pushMatrix();
  translate(300, 300);
  rotateX(x);
  rotateY(y);
  beginShape(QUADS);
  fill(255,0,0);
  vertex(-100, -100,  100);
  vertex( 100, -100,  100);
  vertex( 100,  100,  100);
  vertex(-100,  100,  100);
  endShape();
  // Back
  beginShape(QUADS);
  fill(255,150,0);
  vertex( 100, -100, -100);
  vertex(-100, -100, -100);
  vertex(-100,  100, -100);
  vertex( 100,  100, -100);
  endShape();
  // Bottom
  beginShape(QUADS);
  fill( 255,255,255);
  vertex(-100,  100,  100);
  vertex( 100,  100,  100);
  vertex( 100,  100, -100);
  vertex(-100,  100, -100);
  endShape();
  // Top
  beginShape(QUADS);
  fill(255,255,0);
  vertex(-100, -100, -100);
  vertex( 100, -100, -100);
  vertex( 100, -100,  100);
  vertex(-100, -100,  100);
  endShape();
  // Right
  beginShape(QUADS);
  fill(0,255,0);
  vertex( 100, -100,  100);
  vertex( 100, -100, -100);
  vertex( 100,  100, -100);
  vertex( 100,  100,  100);
  endShape();
  // Left
  beginShape(QUADS);
  fill(0,0,255);
  vertex(-100, -100, -100);
  vertex(-100, -100,  100);
  vertex(-100,  100,  100);
  vertex(-100,  100, -100);
  endShape();
  popMatrix();
}

void mouseDragged() {
  float rate = 0.01;
  x += (pmouseY-mouseY) * rate;
  y += (mouseX-pmouseX) * rate;
}
