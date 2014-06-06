import java.util.*;
import java.io.*;

class Box{
//Global Variables 
PShape cube;  

int size=50;

ArrayList<Integer> rotation=new ArrayList<Integer>();

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


void setRotation(int m){
  rotation.add(m);
}

void display(){
  for (int m = 0; m < rotation.size(); m++){
    if (rotation.get(m) == 1){
      rotateX(PI/2);
    }
    else if (rotation.get(m) == 2){
      rotateY(PI/2);
    }
    else {
      rotateZ(PI/2);
    }
  }
  shape(cube);
}
}

