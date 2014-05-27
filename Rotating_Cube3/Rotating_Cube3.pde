void setup(){
  size(600, 600, P3D);
  smooth();
}

float value = PI/4;
float x = 0;
float y = 0;
float z = 0;

void draw()
{
  float angle = atan2(mouseY-100, mouseX-100);
  
  background(255);
  lights();
  camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);
  pushMatrix();
  translate(300, 300);
  rotateX(x);
  rotateY(y);
  rotateZ(z);
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

  void keyReleased(){
    if(key == 'x' || key == 'X'){
      rotateX(value);
      if (x == 2 * PI)
        x = 0;
      x += value;
    }
    else if (key == 'y' || key == 'Y'){
      rotateY(value);
      if (y == 2 * PI)
        y = 0;
      y += value;
    }
    else if (key == 'z' || key == 'Z'){
      rotateZ(value);
      if (z == 2 * PI)
        z = 0;
      z += value;
    }
  }  
