class Box{
 
//Global Variables 
PShape cube;  

int translateX;
int translateY;
int translateZ;

float rotateInTheX=0;
float rotateInTheY=0;
//Constructor
Box(int x, int y, int z){
  translateX=x;
  translateY=y;
  translateZ=z;
  
  //What is size?
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




//Functions 
  
}
