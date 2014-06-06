Box[] permanent;
Box[] location;

float x = 0;
float y = 0;

float ninety = 0.0;

void setup(){
  size(600,600,P3D);
  background(125);
  
  permanent=new Box[28];
  location=new Box[28];
  
  int n=1;
  int w=1;
  translate(250,250,-250);
  for ( int y = -1; y < 2; y++ ){
      for ( int z = -1; z < 2; z++ ){
        for ( int x = -1; x < 2; x++ ){
          permanent[n] = new Box( x*100, y*100, z*100 );
          location[n] = new Box( x*100, y*100, z*100 );
          pushMatrix();
          translate(x*100,y*100,z*100);
          permanent[n].display();
          popMatrix();
          n++;
        }
      }
    }
}

void draw(){
  restart(); 
}

void keyReleased(){
  if(key=='q'){
    xPositiveA();
  }
  else if(key=='e'){
    xPositiveC();
  }
  else if(key=='t'){
    yPositiveA();
  }
  else if(key=='u'){
    yPositiveC();
  }
  else if(key=='a'){
    zPositiveA();
  }
  else if(key=='d'){
    zPositiveC();
  }
}

void xPositiveA(){
  //changes color of each cube
 location[1].xPositive();
 location[4].xPositive();
 location[7].xPositive();
 location[10].xPositive();
 location[13].xPositive();
 location[16].xPositive();
 location[19].xPositive();
 location[22].xPositive();
 location[25].xPositive();
 
 //changes location
 swapClockwise(7,1,19,25);
 swapClockwise(16,4,10,22);
}

void xPositiveC(){
  //changes color of each cube
 location[3].xPositive();
 location[6].xPositive();
 location[9].xPositive();
 location[12].xPositive();
 location[15].xPositive();
 location[18].xPositive();
 location[21].xPositive();
 location[24].xPositive();
 location[27].xPositive();
 
 //changes location
 swapClockwise(9,3,21,27);
 swapClockwise(18,6,12,24);
}

void yPositiveA(){
  for(int m = 1; m < 10; m++){
    location[m].yPositive();
  }
 swapClockwise(9,3,1,7);
 swapClockwise(2,4,8,6);
}

void yPositiveC(){
  for(int m = 1; m < 10; m++){
    location[m+18].yPositive();
  }
  swapClockwise(27,21,19,25);
  swapClockwise(20,22,26,24);
}

void zPositiveA(){
  for(int m = 1; m < 4; m++){
    location[m].zPositive();
    location[m+9].zPositive();
    location[m+18].zPositive();
  }
  swapClockwise(1,3,21,19);
  swapClockwise(2,12,20,10);
}

void zPositiveC(){
  for(int m = 1; m < 4; m++){
    location[m+6].zPositive();
    location[m+15].zPositive();
    location[m+24].zPositive();
  }
  swapClockwise(7,9,27,25);
  swapClockwise(8,18,26,16);
}
void swapClockwise(int a, int b, int c, int d){
  Box temp = location[a];
  Box temp2 = location[b];
  Box temp3 = location[c];
  Box temp4 = location[d];
  location[a] = temp4;
  location[b] = temp;
  location[c] = temp2;
  location[d] = temp3;
}

void mouseDragged() {
  float rate = 0.01;
  x += (pmouseY-mouseY) * rate;
  y += (mouseX-pmouseX) * rate;
}

void restart(){
  background(125);
  camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);
  int n=1;
  int w=1;
  pushMatrix();
  translate(450,450,-150);
  rotateX(x);
  rotateY(y);
  for ( int y = -1; y < 2; y++ ){
      for ( int z = -1; z < 2; z++ ){
        for ( int x = -1; x < 2; x++ ){
          pushMatrix();
          translate(x*100,y*100,z*100);
          location[n].display();
          popMatrix();
          n++;
        }
      }
    }
 popMatrix();
}


