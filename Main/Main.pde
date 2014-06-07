import java.util.*;
import java.io.*;

Box[] permanent;
Box[] location;
Box[] temporary;

boolean inProgress=false;
float ninety=0.0;
boolean goPositive=true;

void setup(){
  size(500,500,P3D);
  background(125);    
  
  //Initialize arrays;
  //We don't use spot 0;
  permanent = new Box[28];
  location = new Box[28];
  temporary = new Box[9];
  
  int n=1;
  translate(250,250,-250);
  rotateX(-PI/4);
  rotateY(PI/4);
  for ( int y = -1; y < 2; y++ ){
      for ( int z = -1; z < 2; z++ ){
        for ( int x = -1; x < 2; x++ ){
          permanent[n] = new Box( x*100, y*100, z*100 );
          location[n]=permanent[n];
          pushMatrix();
          translate(permanent[n].translateX,permanent[n].translateY,permanent[n].translateZ);
          shape(permanent[n].cube);
          popMatrix();
          n++;
        }
      }
    }
}

void draw(){
  
  
  myDraw();
}

void keyReleased(){
      if(key=='e'){
        xPositiveA();
      }
      else if(key=='d'){
        yPositiveA();
      }
    }


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////
void xNegativeA(){
  goPositive =false;
  for (int i=0;i<9;i++){
     temporary[i]=location[1+(i*3)];
     temporary[i].rotation.add(temporary[i].rotation.size(),-PI/2);
  }
  CounterClockwise(1,7,25,19);
  CounterClockwise(4,16,22,10);
  //manually moving boxes to next location
}
////////////////////////////////////////////////////////////////////////////////////
void xPositiveA(){
  goPositive =true;
  for (int i=0;i<9;i++){
     temporary[i]=location[1+(i*3)];
     temporary[i].rotation.add(temporary[i].rotation.size(),PI/2);
  }
  
  //manually moving boxes to next location
  Box temp=location[19];
  Box temp2=location[25];
  
  location[19]=location[1];
  location[25]=temp;
  temp=location[7];
  location[7]=temp2;
  location[1]=temp;
  temp=location[10];
  location[10]=location[4];
  temp2=location[22];
  location[22]=temp;
  temp=location[16];
  location[16]=temp2;
  location[4]=temp;
}
////////////////////////////////////////////////////////////////////////////////////
void yPositiveA(){
  for (int i=0;i<9;i++){
     temporary[i]=location[i+1];
     temporary[i].rotation.add(temporary[i].rotation.size(),PI);
  }
 CounterClockwise(1,7,9,3);
 CounterClockwise(2,4,8,6);
}

void CounterClockwise(int a, int b, int c, int d){
  Box temp1=location[a];
  Box temp2=location[b];
  Box temp3=location[c];
  Box temp4=location[d];
  
  location[a]=temp4;
  location[b]=temp1;
  location[c]=temp2;
  location[d]=temp3;
}
////////////////////////////////////////////////////////////////////////////////////
void myDraw(){
  
    background(125);
    translate(250,250,-250);
    rotateY(PI/4);
  rotateX(-PI/4);
    //Print cube
    for(int i=1;i<28;i++){
      Box temp = permanent[i];
      ArrayList<Float> rotate=temp.rotation;
      pushMatrix();
      for (int r=0;r<temp.rotation.size();r++){
          if(temp.rotation.get(r)==PI/2){
            rotateX(temp.rotation.get(r));
          }
          else if(temp.rotation.get(r)==PI){
            rotateY(temp.rotation.get(r)-PI/2);
          }
          else if(temp.rotation.get(r)==3*PI/2){
            rotateZ(temp.rotation.get(r)-PI);
          }
        
        else if(temp.rotation.get(r)==-PI/2){
            rotateX(temp.rotation.get(r));
          }
          else if(temp.rotation.get(r)==-PI){
            rotateY(temp.rotation.get(r)+PI/2);
          }
          else{
            rotateZ(temp.rotation.get(r)+PI);
          }
        }
      
      translate(temp.translateX,temp.translateY,temp.translateZ);
      shape(temp.cube);
      popMatrix();
    }
}
