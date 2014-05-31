

Box[] permanent;
//Box
void setup(){
  size(500,500,P3D);
  permanent = new Box[27];
  int n = 0;
  for ( int x = 0; x < 3; x++ ){
   for ( int y = 0; y < 3; y++ ){
    for ( int z = 0; z < 3; z++ ){
      permanent[n] = new Box( x*100, y*190, z*100 );
      n++;
    }
   }
  }
}

void draw(){
  pushMatrix();
  translate(250,250,0);
  for(int m = 0; m < 27; m++){
    shape(permanent[9].cube);
  }
  popMatrix();
}

//void myDisplay(){
 //Last Step 
  
  
  //don't forget PI/180
//}
