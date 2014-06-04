import java.util.*;
import java.io.*;

class Box{
//Global Variables 
PShape cube;  
float Xrotation = 0;
float Yrotation = 0;
float Zrotation = 0;

int size=50;

ArrayList<Float> rotation=new ArrayList<Float>();

//Constructor
public Box(){
  setupCube();
  }

void setupCube(){
  cube = createShape();
  cube.beginShape(QUADS);
  cube.fill(255,0,0);
  cube.vertex(-size, -size, size);
  cube.vertex(size, -size, size);
  cube.vertex(size, size, size);
  cube.vertex(-size, size, size);
  cube.endShape();
  // Back
  cube.beginShape(QUADS);
  cube.fill(255,150,0);
  cube.vertex(size, -size, -size);
  cube.vertex(-size, -size, -size);
  cube.vertex(-size, size, -size);
  cube.vertex(size, size, -size);
  cube.endShape();
  // Bottom
  cube.beginShape(QUADS);
  cube.fill( 255,255,255);
  cube.vertex(-size, size, size);
  cube.vertex(size, size, size);
  cube.vertex(size, size, -size);
  cube.vertex(-size, size, -size);
  cube.endShape();
  // Top
  cube.beginShape(QUADS);
  cube.fill(255,255,0);
  cube.vertex(-size, -size, -size);
  cube.vertex(size, -size, -size);
  cube.vertex(size, -size, size);
  cube.vertex(-size, -size, size);
  cube.endShape();
  // Right
  cube.beginShape(QUADS);
  cube.fill(0,255,0);
  cube.vertex(size, -size, size);
  cube.vertex(size, -size, -size);
  cube.vertex(size, size, -size);
  cube.vertex(size, size, size);
  cube.endShape();
  // Left
  cube.beginShape(QUADS);
  cube.fill(0,0,255);
  cube.vertex(-size, -size, -size);
  cube.vertex(-size, -size, size);
  cube.vertex(-size, size, size);
  cube.vertex(-size, size, -size);
  cube.endShape(CLOSE);
}


void setRotation(float a, float b, float c){
  Xrotation += a;
  Yrotation += b;
  Zrotation += c;
}

void display(){
  pushMatrix();
  rotateX(Xrotation);
  rotateY(Yrotation);
  rotateZ(Zrotation);
  shape(cube);
  popMatrix();
}
}

