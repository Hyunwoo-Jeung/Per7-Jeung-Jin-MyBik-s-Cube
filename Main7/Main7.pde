Box[] permanent;
Box[] location;
int[] moved=new int[9];

float x = 0;
float y = 0;

float ninety = 0.0;

//Buttons-------------------
int rectX, rectY; //Position of scramble button
int rectW, rectH; //Width and Height of button

boolean rectOver = false;
//--------------------------

boolean solved = false;

int numberOfTurns = 0;

//Timer-------------------
boolean running = false;

long startTime = 0;
long stopTime = 0;

PFont s;
//-------------------------

Stack<Integer> stack;

void setup(){
  size(600,600,P3D);
  background(125);
  
  rectX = 120;
  rectY = 60;
  rectW = 100;
  rectH = 50;
  
  s = createFont("Arial", 16, true);
  
  permanent=new Box[28];
  location=new Box[28];
  
  stack = new Stack<Integer>();
  
  int n=1;
  translate(250,250,-250);
  for ( int y = -1; y < 2; y++ ){
      for ( int z = -1; z < 2; z++ ){
        for ( int x = -1; x < 2; x++ ){
          permanent[n] = new Box( x*100, y*100, z*100 );
          location[n] = new Box( x*100, y*100, z*100 );
          pushMatrix();
          translate(x*100,y*100,z*100);
          popMatrix();
          n++;
        }
      }
    }
    restart();
}

void draw(){
  background(125);
  restart();
  update(mouseX, mouseY);
  textFont(s, 16);
  fill(0);
  text("Scramble", 125, 85, 20);
  fill(255);
  rect(rectX,rectY,rectW,rectH);
  pushMatrix();
  fill(255);
  rotateY(-PI/4);
  textFont(s, 16);
  text("Number of turns: " + numberOfTurns,140,350);
  /*
  if(running = true){
    text(""+elapsedTimeSecs(),200,370);
  }
  */
  popMatrix();
}

void keyReleased(){
  if(key=='q'){
    xPositiveA();
  }
  else if(key=='w'){
    xNegativeA();
  }
  else if(key=='e'){
    xPositiveC();
  }
  else if(key=='r'){
    xNegativeC();
  }
  else if(key=='t'){
    yPositiveA();
  }
  else if(key=='y'){
    yNegativeA();
  }
  else if(key=='u'){
    yPositiveC();
  }
  else if(key=='i'){
    yNegativeC();
  }
  else if(key=='a'){
    zPositiveA();
  }
  else if(key=='s'){
    zNegativeA();
  }
  else if(key=='d'){
    zPositiveC();
  }
  else if(key=='f'){
    zNegativeC();
  }
  numberOfTurns++;
  /*
  else if(key=='z'){
    startTimer();
  }
  */
  println(key);
  restart();
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
 
 moved[0]=1;
 moved[1]=4;
 moved[2]=7;
 moved[3]=10;
 moved[4]=13;
 moved[5]=16;
 moved[6]=19;
 moved[7]=22;
 moved[8]=25;
 
 //changes location
 swapClockwise(7,1,19,25);
 swapClockwise(16,4,10,22);
}

void xNegativeA(){
  //changes color of each cube
 location[1].xNegative();
 location[4].xNegative();
 location[7].xNegative();
 location[10].xNegative();
 location[13].xNegative();
 location[16].xNegative();
 location[19].xNegative();
 location[22].xNegative();
 location[25].xNegative();
 //changes location
 swapClockwise(25,19,1,7);
 swapClockwise(22,10,4,16);
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

void xNegativeC(){
  //changes color of each cube
 location[3].xNegative();
 location[6].xNegative();
 location[9].xNegative();
 location[12].xNegative();
 location[15].xNegative();
 location[18].xNegative();
 location[21].xNegative();
 location[24].xNegative();
 location[27].xNegative();
 //changes location
 swapClockwise(27,21,3,9);
 swapClockwise(24,12,6,18);
}

void yPositiveA(){
  for(int m = 1; m < 10; m++){
    location[m].yPositive();
  }
 swapClockwise(9,3,1,7);
 swapClockwise(2,4,8,6);
}

void yNegativeA(){
  for(int m = 1; m < 10; m++){
    location[m].yNegative();
  }
 swapClockwise(7,1,3,9);
 swapClockwise(6,8,4,2);
}

void yPositiveC(){
  for(int m = 1; m < 10; m++){
    location[m+18].yPositive();
  }
  swapClockwise(27,21,19,25);
  swapClockwise(20,22,26,24);
}

void yNegativeC(){
  for(int m = 1; m < 10; m++){
    location[m+18].yNegative();
  }
  swapClockwise(25,19,21,27);
  swapClockwise(24,26,22,20);
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

void zNegativeA(){
  for(int m = 1; m < 4; m++){
    location[m].zNegative();
    location[m+9].zNegative();
    location[m+18].zNegative();
  }
  swapClockwise(19,21,3,1);
  swapClockwise(10,20,12,2);
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

void zNegativeC(){
  for(int m = 1; m < 4; m++){
    location[m+6].zNegative();
    location[m+15].zNegative();
    location[m+24].zNegative();
  }
  swapClockwise(25,27,9,7);
  swapClockwise(16,26,18,8);
}

void swapClockwise(int a, int b, int c, int d){
Box temp=location[b];
location[b]=location[a];
location[a]=location[c];
location[c]=temp;
temp=location[d];
location[d]=location[a];
location[a]=temp;
}

//void mouseDragged() {
//  float rate = 0.01;
//  x += (pmouseY-mouseY) * rate;
//  y += (mouseX-pmouseX) * rate;
//}

void restart(){
  background(125);
  camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);
  int n=1;
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
 pushMatrix();
  textFont(s, 16);
  fill(0);
  text("Scramble", 125, 85, 20);
  fill(255);
  rect(rectX,rectY,rectW,rectH);
  popMatrix();
 if (isSolved() && solved){
   pushMatrix();
   rotateY(-PI/4);
   textFont(s, 26);
   text("Good Job!",140,250);
   popMatrix();
   solved = false;
 }
}

void restart2(){
  camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);
  int n=1;
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

void update(int x, int y) {
  if ( overRect(rectX, rectY, rectW, rectH) ) {
    rectOver = true;
  }
  else {
    rectOver = false;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

void mousePressed(){
  if(rectOver){
    scramble();
  }
}

void scramble(){
  int m;
  for (int n = 0; n < 40; n++){
    m = (int) (Math.random() * 6);
    if(m == 0)
      xPositiveA();
    else if(m == 1)
      xPositiveC();
    else if(m == 2)
      yPositiveA();
    else if(m == 3)
      yPositiveC();
    else if(m == 4)
      zPositiveA();
    else if(m == 5)
      zPositiveC();
  }
  numberOfTurns = 0;
  solved = true;
  restart();
}
//Timer functions-too laggy-------------------
/*
void startTimer(){
  startTime = millis();
  running = true;
}

void stopTimer(){
  stopTime = millis();
  running =false;
}

long elapsedTimeSecs(){
  long elapsed;
  if (running) {
    elapsed = ((millis() - startTime)/1000);
  }
  else{
    elapsed = ((stopTime -startTime)/1000);
  }
  return elapsed;
}
*/
//-------------------------------------------

boolean isSolved(){
  for(int m = 1; m < 28; m++){
    if(!(permanent[m].equals(location[m]))){
      return false;
    }
  }
  return true;
}


