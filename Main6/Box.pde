import java.util.*;
import java.io.*;

class Box{
//Global Variables 
PShape cube;  

int translateX;
int translateY;
int translateZ;

int size=50;

color red = color(255,0,0);
color orange = color(255,150,0);
color yellow = color(255,255,0);
color blue = color(0,255,0);
color green = color(0,0,255);
color white = color(255);

color[] cc=new color[6];



//Constructor
public Box(int x, int y, int z){
  translateX=x;
  translateY=y;
  translateZ=z;
  cc[0]=yellow;
  cc[1]=red;
  cc[2]=white;
  cc[3]=orange;
  cc[4]=blue;
  cc[5]=green;
}
//Functions

void display(){
  setupCube();
  shape(cube);
}
void setupCube(){
  cube = createShape();
  cube.beginShape(QUADS);
  cube.fill(cc[1]);
  cube.vertex(-size, -size,  size);
  cube.vertex( size, -size,  size);
  cube.vertex( size,  size,  size);
  cube.vertex(-size,  size,  size);
  cube.endShape();
  // Back
  cube.beginShape(QUADS);
  cube.fill(cc[3]);
  cube.vertex( size, -size, -size);
  cube.vertex(-size, -size, -size);
  cube.vertex(-size,  size, -size);
  cube.vertex( size,  size, -size);
  cube.endShape();
  // Bottom
  cube.beginShape(QUADS);
  cube.fill(cc[2]);
  cube.vertex(-size,  size,  size);
  cube.vertex( size,  size,  size);
  cube.vertex( size,  size, -size);
  cube.vertex(-size,  size, -size);
  cube.endShape();
  // Top
  cube.beginShape(QUADS);
  cube.fill(cc[0]);
  cube.vertex(-size, -size, -size);
  cube.vertex( size, -size, -size);
  cube.vertex( size, -size,  size);
  cube.vertex(-size, -size,  size);
  cube.endShape();
  // Right
  cube.beginShape(QUADS);
  cube.fill(cc[4]);
  cube.vertex( size, -size,  size);
  cube.vertex( size, -size, -size);
  cube.vertex( size,  size, -size);
  cube.vertex( size,  size,  size);
  cube.endShape();
  // Left
  cube.beginShape(QUADS);
  cube.fill(cc[5]);
  cube.vertex(-size, -size, -size);
  cube.vertex(-size, -size,  size);
  cube.vertex(-size,  size,  size);
  cube.vertex(-size,  size, -size);
  cube.endShape(CLOSE);
}

void xPositive(){
  color temp1=cc[0];
  color temp2=cc[3];
  color temp3=cc[2];
  color temp4=cc[1];
  cc[1]=temp3;
  cc[0]=temp4;
  cc[3]=temp1;
  cc[2]=temp2;
}

void yPositive(){
  color temp1=cc[3];
  color temp2=cc[4];
  color temp3=cc[1];
  color temp4=cc[5];
  cc[1]=temp4;
  cc[5]=temp1;
  cc[3]=temp2;
  cc[4]=temp3;
}

void zPositive(){
  color temp1=cc[2];
  color temp2=cc[5];
  color temp3=cc[0];
  color temp4=cc[4];
  cc[0]=temp2;
  cc[4]=temp3;
  cc[2]=temp4;
  cc[5]=temp1;
}
}
