Box[] permanent;
Box[] location;

float x = 0;
float y = 0;

long lastTime = 0;

//Box
void setup(){
  size(600,600,P3D);
  permanent = new Box[27];
  location = new Box[27];
  for (int m = 0; m < 27; m++){
    permanent[m] = new Box();
  }
  lastTime = millis();
}

void draw(){
  background(0);
    camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);

  pushMatrix();
  translate(450,450,-150);
  rotateX(x);
  rotateY(y);
  //rotateY(PI/4);
  int n = 0;
  for ( int y = -1; y < 2; y++ ){
    for ( int z = -1; z < 2; z++ ){
      for ( int x = -1; x < 2; x++ ){
          pushMatrix();
          translate(x*100,y*100,z*100);
          permanent[n].display();
          popMatrix();      
        n++;
      }
    }
  }

  popMatrix();
}



void keyReleased(){
    if(key == 'e'){
      zPositiveA();
    }
    else if(key == 'r'){
      zPositiveB();
    }
    else if(key == 't'){
      zPositiveC();
    }
    else if(key == 'd'){
      yPositiveA();
    }
    else if(key == 'f'){
      yPositiveB();
    }
    else if(key == 'g'){
      yPositiveC();
    }
    else if(key == 'h'){
      permanent[1].setRotation(2);
      swapClockwise(1,3,7,5);
    }
}

void zPositiveA(){
  
  for(int m = 0; m < 3; m++){
    permanent[m].setRotation(3);
    permanent[m+9].setRotation(3);
    permanent[m+18].setRotation(3);
  }
  swapClockwise(0,2,18,20);
  swapClockwise(1,11,19,9);

}

void zPositiveB(){
  
  for(int m = 0; m < 3; m++){
    permanent[m+3].setRotation(3);
    permanent[m+12].setRotation(3);
    permanent[m+21].setRotation(3);
  }
  swapClockwise(3,5,21,23);
  swapClockwise(4,14,22,12);
}

void zPositiveC(){
  
  for(int m = 0; m < 3; m++){
    permanent[m+6].setRotation(3);
    permanent[m+15].setRotation(3);
    permanent[m+24].setRotation(3);
  }
  swapClockwise(6,8,24,26);
  swapClockwise(7,17,25,15);
}

void yPositiveA(){
   
  for(int m = 0; m < 9; m++){
    permanent[m].setRotation(2);
  }
  swapClockwise(0,6,8,2);
  swapClockwise(1,3,7,5); 
}

void yPositiveB(){
 
  for(int m = 0; m < 9; m++){
    permanent[m+9].setRotation(2);
  }
   swapClockwise(9,15,17,11);
  swapClockwise(10,12,16,14);
}

void yPositiveC(){
  
  for(int m = 0; m < 9; m++){
    permanent[m+18].setRotation(2);
  }
  swapClockwise(18,24,26,20);
  swapClockwise(19,21,25,23);
}

void swapClockwise(int a, int b, int c, int d){
//  Box temp = permanent[a];
//  Box temp2 = permanent[b];
//  Box temp3 = permanent[c];
//  Box temp4 = permanent[d];
//  permanent[a] = temp4;
//  permanent[b] = temp;
//  permanent[c] = temp2;
//  permanent[d] = temp3;
Box temp=location[b];
location[b]=location[a];
location[a]=location[c];
location[c]=temp;
temp=location[d];
location[d]=location[a];
location[a]=temp;
}
void mouseDragged() {
  float rate = 0.01;
  x += (pmouseY-mouseY) * rate;
  y += (mouseX-pmouseX) * rate;
}
