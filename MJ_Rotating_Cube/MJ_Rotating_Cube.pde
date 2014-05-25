void setup(){
  size(600,600,P3D);
  background(150);
  translate(300,300,0);
  noFill();
  box(100);
}

float x=PI/2;
boolean c = false;

void draw(){
  if(x<PI/2){
  background(150);
  translate(300,300,0);
  rotateY(x);
  noFill();
  box(100);
  x+=PI/180;
  }
}

void mouseClicked(){
  if(x>=PI/2)
  x=0;
}

