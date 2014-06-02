PShape cube;

float x = 0;
float y = 0;

float value = PI/4;
float rotx = 0;
float roty = 0;
float rotz = 0;

int size = 50;
void setup(){
  size(600, 600, P3D);
  smooth();
  cube = createShape();
  cube.beginShape(QUADS);
  cube.fill(255,0,0);
  cube.vertex(-size, -size,  size);
  cube.vertex( size, -size,  size);
  cube.vertex( size,  size,  size);
  cube.vertex(-size,  size,  size);
  cube.endShape();
  // Back
  cube.beginShape(QUADS);
  cube.fill(255,150,0);
  cube.vertex( size, -size, -size);
  cube.vertex(-size, -size, -size);
  cube.vertex(-size,  size, -size);
  cube.vertex( size,  size, -size);
  cube.endShape();
  // Bottom
  cube.beginShape(QUADS);
  cube.fill( 255,255,255);
  cube.vertex(-size,  size,  size);
  cube.vertex( size,  size,  size);
  cube.vertex( size,  size, -size);
  cube.vertex(-size,  size, -size);
  cube.endShape();
  // Top
  cube.beginShape(QUADS);
  cube.fill(255,255,0);
  cube.vertex(-size, -size, -size);
  cube.vertex( size, -size, -size);
  cube.vertex( size, -size,  size);
  cube.vertex(-size, -size,  size);
  cube.endShape();
  // Right
  cube.beginShape(QUADS);
  cube.fill(0,255,0);
  cube.vertex( size, -size,  size);
  cube.vertex( size, -size, -size);
  cube.vertex( size,  size, -size);
  cube.vertex( size,  size,  size);
  cube.endShape();
  // Left
  cube.beginShape(QUADS);
  cube.fill(0,0,255);
  cube.vertex(-size, -size, -size);
  cube.vertex(-size, -size,  size);
  cube.vertex(-size,  size,  size);
  cube.vertex(-size,  size, -size);
  cube.endShape(CLOSE);
}

void draw()
{ 
  camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);
  background(255);
  pushMatrix();
  translate(300, 300);
    rotate(x);
  rotate(y);
  shape(cube);
  translate(-300,-300);
  translate(200,300);
  shape(cube);
  translate(-200,-300);
  translate(400,300);
  shape(cube);
  translate(-400,-300);
  translate(300,300,100);
  shape(cube);
  translate(-300,-300,-100);
  translate(200,300,100);
  shape(cube);
  translate(-200,-300,-100);
  translate(400,300,100);
  shape(cube);
  translate(-400,-300,-100);
  translate(300,300,-100);
  shape(cube);
  translate(-300,-300,100);
  translate(200,300,-100);
  shape(cube);
  translate(-200,-300,100);
  translate(400,300,-100);
  shape(cube);
  translate(-400,-300,100);
  translate(300,300);
  popMatrix();
}

void mouseDragged() {
  float rate = 0.01;
  x += (pmouseY-mouseY) * rate;
  y += (mouseX-pmouseX) * rate;
}

void keyReleased(){
  if(key == 'x' || key == 'X'){
    rotateX(value);
    if (rotx == 2 * PI)
      rotx = 0;
    rotx += value;
  }
  else if (key == 'y' || key == 'Y'){
    rotateY(value);
    if (roty == 2 * PI)
      roty = 0;
    roty += value;
  }
  else if (key == 'z' || key == 'Z'){
    rotateZ(value);
    if (rotz == 2 * PI)
      rotz = 0;
    rotz += value;
  }
}  
