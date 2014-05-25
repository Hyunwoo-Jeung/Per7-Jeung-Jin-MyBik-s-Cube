void setup(){
  size(500,500,P3D);
  background(150);
  translate(250,250,-250);
  makeBox();
  
}

boolean progress=false;
float y=0;
float ydifference=0;

boolean c = false;

void draw(){
  if(progress && ydifference<=PI/2){
  background(150);
  
  translate(250,250,-250);
  rotateY(y);
  makeBox();

  y+=PI/180;
  ydifference+=PI/180;
  }
  else
  progress=false;
}

void mouseClicked(){
  if(!progress){
  progress=true;
  ydifference=0;
  }
}

void makeBox(){
  noFill();
  //Mid Row
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,-100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  
  translate(100,-100,-100);
  //Top Row
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,-100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  
  translate(100,200,-100);
  //Bottom Row
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,-100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
}
