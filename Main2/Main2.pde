Box a;
Box b;
Box[] permanent;

float x = 0;
float y = 0;
//Box
void setup(){
  size(600,600,P3D);
  a = new Box(0,0,0);
  b = new Box(100,0,0);
  permanent = new Box[27];
  int n = 0;
  for ( int x = 0; x < 3; x++ ){
    for ( int y = 0; y < 3; y++ ){
      for ( int z = 0; z < 3; z++ ){
        permanent[n] = new Box( x*100, y*100, z*100 );
        n++;
      }
    }
  }
}

void draw(){
    camera(0, 0, (height/2),
         width/2, height/2, 0, 
         0, 1, 0);
  pushMatrix();
  translate(300,300,-300);
  for(int m=0;m<27;m++){
    shape(permanent[m].cube);
  }
  popMatrix();
}

void mouseDragged() {
  float rate = 0.01;
  x += (pmouseY-mouseY) * rate;
  y += (mouseX-pmouseX) * rate;
}
//void myDisplay(){
 //Last Step 
  
  
  //don't forget PI/180
//}
