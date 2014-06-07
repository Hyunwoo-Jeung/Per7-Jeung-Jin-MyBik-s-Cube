import java.util.*;
import java.io.*;

class Box{
//Global Variables 
PShape cube;  

int translateX;
int translateY;
int translateZ;

int size=50;

ArrayList<Float> rotation=new ArrayList<Float>();

//Constructor
public Box(int x, int y, int z){
  translateX=x;
  translateY=y;
  translateZ=z;
  
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

  void display(){
    shape(cube);}
}
