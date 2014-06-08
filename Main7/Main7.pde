import java.util.*;
import java.io.*;

Box[] permanent;
Box[] location;

boolean doneSolve=true;

float x = 0;
float y = 0;

//Buttons-------------------
int rectX, rectY; //Position of scramble button
int rectW, rectH; //Width and Height of button

int rectX2, rectY2, rectZ2; //Position of scramble button
int rectW2, rectH2; 

boolean rectOver = false;
//--------------------------

int numberOfTurns = 0;

//Timer-------------------
boolean running = false;
boolean time = false;
boolean timerPressed = false;

long startTime = 0;
long stopTime = 0;

PFont s;
//-------------------------

Stack<Integer> stack;

void setup(){
    size(600,600,P3D);
    background(0);
    
    rectX = 120;
    rectY = 60;
    rectW = 110;
    rectH = 55;
    
    rectX2 = 0;
    rectY2 = 0;
    rectZ2 = 300;
    rectW2 = 250;
    rectH2 = 125;
    
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
    location[n].setupCube();
    n++;
      }
  }
    }
}

void draw(){
  
    if(!doneSolve){
  solve();
    }
    background(0);
    restart();
    update(mouseX, mouseY);
    textFont(s, 16);
    fill(0);
    text("Scramble", 125, 85, 20);
    fill(255,0,0);
    rect(rectX,rectY,rectW,rectH);
    pushMatrix();
    fill(255);
    rotateY(-PI/4);
    textFont(s, 16);
    text("  Number of turns: " + numberOfTurns,140,350);
    displayTime();
    popMatrix();
    if(isSolved()){
      displayRect();
    }
}

void keyReleased(){
    if(!doneSolve){
  //don't accept any key
    }
    else if(key=='q'){
  xPositiveA();
  stack.push(1);
    }
    else if(key=='a'){
  xNegativeA();
  stack.push(2);
    }
    else if(key=='e'){
  xPositiveC();
  stack.push(3);
    }
    else if(key=='d'){
  xNegativeC();
  stack.push(4);
    }
    else if(key=='t'){
  yPositiveA();
  stack.push(5);
    }
    else if(key=='r'){
  yNegativeA();
  stack.push(6);
    }
    else if(key=='b'){
  yPositiveC();
  stack.push(7);
    }
    else if(key=='v'){
  yNegativeC();
  stack.push(8);
    }
    else if(key=='u'){
  zPositiveA();
  stack.push(9);
    }
    else if(key=='y'){
  zNegativeA();
  stack.push(10);
    }
    else if(key=='m'){
  zPositiveC();
  stack.push(11);
    }
    else if(key=='n'){
  zNegativeC();
  stack.push(12);
    }
    else if(key=='z'){
      totalReset();
  startTimer();
  numberOfTurns=0;
  numberOfTurns--;
    }
    else if(key=='x'){
  solve();
  doneSolve=false;
  numberOfTurns=0;
  numberOfTurns--;
  startTimer();
    }
    else if(key=='c'){
      timerPressed = !timerPressed;
      if(timerPressed){
        time = true;
        startTimer();
        numberOfTurns--;
      }
      else{
        time = false;
        stopTimer();
        numberOfTurns--;
      }
    }
    else if(key=='p'){
    x=0;
    y=0;
    numberOfTurns--;
    }
    
    else{
  numberOfTurns--;
    }
    numberOfTurns++;
}

void xPositiveA(){
    //changes color of each cube
    for (int m=1;m<26;m+=3){
  location[m].xPositive();
  location[m].setupCube();
    }
  swapClockwise(7,1,19,25);
  swapClockwise(16,4,10,22);
}

void xNegativeA(){
    for (int m=1;m<26;m+=3){
  location[m].xNegative();
  location[m].setupCube();
    }
 swapClockwise(25,19,1,7);
 swapClockwise(22,10,4,16);
}

void xPositiveC(){
    for (int m=3;m<28;m+=3){
  location[m].xPositive();
  location[m].setupCube();
    }
 swapClockwise(9,3,21,27);
 swapClockwise(18,6,12,24);
}

void xNegativeC(){
    for (int m=3;m<28;m+=3){
  location[m].xNegative();
  location[m].setupCube();
    }
 swapClockwise(27,21,3,9);
 swapClockwise(24,12,6,18);
}

void yPositiveA(){
    for(int m = 1; m < 10; m++){
  location[m].yPositive();
  location[m].setupCube();
    }
 swapClockwise(9,3,1,7);
 swapClockwise(2,4,8,6);
}

void yNegativeA(){
    for(int m = 1; m < 10; m++){
  location[m].yNegative();
  location[m].setupCube();
    }
 swapClockwise(7,1,3,9);
 swapClockwise(6,8,4,2);
}

void yPositiveC(){
    for(int m = 1; m < 10; m++){
  location[m+18].yPositive();
  location[m+18].setupCube();
    }
  swapClockwise(27,21,19,25);
  swapClockwise(20,22,26,24);
}

void yNegativeC(){
    for(int m = 1; m < 10; m++){
  location[m+18].yNegative();
  location[m+18].setupCube();
    }
  swapClockwise(25,19,21,27);
  swapClockwise(24,26,22,20);
}

void zPositiveA(){
    for(int m = 1; m < 4; m++){
  location[m].zPositive();
  location[m+9].zPositive();
  location[m+18].zPositive();
  location[m].setupCube();
  location[m+9].setupCube();
  location[m+18].setupCube();
    }
  swapClockwise(1,3,21,19);
  swapClockwise(2,12,20,10);
}

void zNegativeA(){
    for(int m = 1; m < 4; m++){
  location[m].zNegative();
  location[m+9].zNegative();
  location[m+18].zNegative();
  location[m].setupCube();
  location[m+9].setupCube();
  location[m+18].setupCube();
    }
  swapClockwise(19,21,3,1);
  swapClockwise(10,20,12,2);
}

void zPositiveC(){
    for(int m = 1; m < 4; m++){
  location[m+6].zPositive();
  location[m+15].zPositive();
  location[m+24].zPositive();
  location[m+6].setupCube();
  location[m+15].setupCube();
  location[m+24].setupCube();
    }
  swapClockwise(7,9,27,25);
  swapClockwise(8,18,26,16);
}

void zNegativeC(){
    for(int m = 1; m < 4; m++){
  location[m+6].zNegative();
  location[m+15].zNegative();
  location[m+24].zNegative();
  location[m+6].setupCube();
  location[m+15].setupCube();
  location[m+24].setupCube();
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

void mouseDragged() {
    float rate = 0.01;
    x += (pmouseY-mouseY) * rate;
    y += (mouseX-pmouseX) * rate;
}

void restart(){
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
    
//    if (isSolved() && solved){
//    pushMatrix();
//    rotateY(-PI/4);
//    textFont(s, 26);
//    //text("Good Job!",140,250);
//    popMatrix();
//    
//    solved = false;
//    }
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
  startTimer();
    }
}

void scramble(){
    int m;
    for (int n = 0; n < 40; n++){
  m = (int) (Math.random() * 6);
  if(m == 0){
      xPositiveA();
      stack.push(1);
  }
  else if(m == 1){
      xPositiveC();
      stack.push(3);}
  else if(m == 2){
      yPositiveA();
      stack.push(5);}
  else if(m == 3){
      yPositiveC();
      stack.push(7);}
  else if(m == 4){
      zPositiveA();
      stack.push(9);}
  else if(m == 5){
      zPositiveC();
      stack.push(11);}
    }
    numberOfTurns = 0;
}

//Timer functions

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

void displayTime(){
  if(running && time){
    text(" "+elapsedTimeSecs(),205,370);
  }
  else{
    text("Presse C to start/reset timer", 120, 370);
  }
}
//-------------------------------------------
void displayRect(){
    pushMatrix();
    translate(700,150,0);
    rotateY(PI/2);
    fill(0,0,255);
    rect(rectX2, rectY2, rectW2, rectH2);
    fill(255);
    popMatrix();
}

boolean isSolved(){
    for(int m = 1; m < 28; m++){
  if(!(permanent[m].equals(location[m]))){
      return false;
  }
    }
    return true;
}

void solve(){
  if(isSolved()){
    doneSolve=true;
  }
  
  else if(!(stack.empty())){
  int n = stack.pop();
  if(n==1){
      xNegativeA();
  }
  else if(n==2){
      xPositiveA();
  }
  else if(n==3){
      xNegativeC();
  }
  else if(n==4){
      xPositiveC();
  }
  else if(n==5){
      yNegativeA();
  }
  else if(n==6){
      yPositiveA();
  }
  else if(n==7){
      yNegativeC();
  }
  else if(n==8){
      yPositiveC();
  }
  else if(n==9){
      zNegativeA();
  }
  else if(n==10){
      zPositiveA();
  }
  else if(n==11){
      zNegativeC();
  }
  else if(n==12){
      zPositiveC();
  }
    }
  else{
      doneSolve=true;
  }
}

void totalReset(){
  int n=1;
    translate(250,250,-250);
    for ( int y = -1; y < 2; y++ ){
  for ( int z = -1; z < 2; z++ ){
      for ( int x = -1; x < 2; x++ ){
    location[n] = new Box( x*100, y*100, z*100 );
    location[n].setupCube();
    n++;
      }
  }
    }
    stack=new Stack<Integer>();
}
