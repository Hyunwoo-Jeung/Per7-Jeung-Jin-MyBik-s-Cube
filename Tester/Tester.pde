float n=0;

void setup(){
 size(500,500,P3D);
 translate(250,250,-250); 
rotateX(PI/2);
rotateY(PI/2);
rotateZ(PI/2);
translate(-100,-100,-100);
box(100);
}

void draw(){
  if(n>=PI*-2){
  background(0);
 translate(250,250,-250); 
  rotateX(n);
  //rotateY(n);
  //rotateZ(n);
   translate(-100,-100,-100);
  box(100);
  translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
  n-=PI/180;
  }
}
