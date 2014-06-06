Box[] permanent;
Box[] location;

float ninety = 0.0;

void setup(){
  size(500,500,P3D);
  background(125);
  
  permanent=new Box[28];
  location=new Box[28];
  
  int n=1;
  int w=1;
  translate(250,250,-250);
  rotateY(PI/4);
  rotateX(-PI/4);
  for ( int y = -1; y < 2; y++ ){
      for ( int z = -1; z < 2; z++ ){
        for ( int x = -1; x < 2; x++ ){
          permanent[n] = new Box( x*100, y*100, z*100 );
          location[n] = new Box( x*100, y*100, z*100 );
          pushMatrix();
          translate(permanent[n].translateX,permanent[n].translateY,permanent[n].translateZ);
          permanent[n].display();
          popMatrix();
          n++;
        }
      }
    }
}

void draw(){
// restart(); 
}

void keyReleased(){
  if(key=='q'){
    xPositiveA();
  }
  else if(key=='t'){
    yPositiveA();
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
 swapClockwise(4,1,19,25);
 swapClockwise(16,4,10,22);
}

void yPositiveA(){
  for(int m = 1; m < 10; m++){
    location[m].yPositive();
  }
  swapClockwise(0,6,8,2);
  swapClockwise(1,3,7,5);
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


