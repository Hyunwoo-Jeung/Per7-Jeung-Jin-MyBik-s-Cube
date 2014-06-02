import java.util.*;
import java.io.*;

class Box{
//Global Variables 
PShape cube;  

int x;
int y;
int z;

int size=50;

ArrayList<Float> rotation=new ArrayList<Float>();

//Constructor
public Box(int x, int y, int z){
  this.x=x;
  this.y=y;
  this.z=z;
  
  cube = createShape();
  cube.beginShape(QUADS);
  cube.fill(255,0,0);
  cube.vertex(x-size, y-size,  z+size);
  cube.vertex(x+size, y-size,  z+size);
  cube.vertex(x+size, y+size, z+size);
  cube.vertex(x-size, y+size, z+size);
  cube.endShape();
  // Back
  cube.beginShape(QUADS);
  cube.fill(255,150,0);
  cube.vertex(x+size, y-size, z-size);
  cube.vertex(x-size, y-size, z-size);
  cube.vertex(x-size, y+size, z-size);
  cube.vertex(x+size, y+size, z-size);
  cube.endShape();
  // Bottom
  cube.beginShape(QUADS);
  cube.fill( 255,255,255);
  cube.vertex(x-size, y+ size, z+size);
  cube.vertex(x+size, y+ size, z+size);
  cube.vertex(x+size, y+ size, z-size);
  cube.vertex(x-size, y+ size, z-size);
  cube.endShape();
  // Top
  cube.beginShape(QUADS);
  cube.fill(255,255,0);
  cube.vertex(x-size, y-size, z-size);
  cube.vertex(x+size, y-size, z-size);
  cube.vertex(x+size, y-size, z+size);
  cube.vertex(x-size, y-size, z+size);
  cube.endShape();
  // Right
  cube.beginShape(QUADS);
  cube.fill(0,255,0);
  cube.vertex(x+size, y-size, z+size);
  cube.vertex(x+size, y-size, z-size);
  cube.vertex(x+size, y+size, z-size);
  cube.vertex(x+size, y+size, z+size);
  cube.endShape();
  // Left
  cube.beginShape(QUADS);
  cube.fill(0,0,255);
  cube.vertex(x-size, y-size, -size);
  cube.vertex(x-size, y-size,  size);
  cube.vertex(x-size, y+size,  size);
  cube.vertex(x-size, y+size, -size);
  cube.endShape(CLOSE);
  }

//Functions
void display(){

  shape(cube);
}
}

