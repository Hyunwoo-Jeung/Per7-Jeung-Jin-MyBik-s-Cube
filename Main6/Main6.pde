
Box[] permanent;

float ninety = 0.0;

void setup(){
  size(500,500,P3D);
  background(125);
  
  permanent=new Box[28];
  int n=1;
  translate(250,250,-250);;
  for ( int y = -1; y < 2; y++ ){
      for ( int z = -1; z < 2; z++ ){
        for ( int x = -1; x < 2; x++ ){
          permanent[n] = new Box( x*100, y*100, z*100 );
          pushMatrix();
          translate(permanent[n].translateX,permanent[n].translateY,permanent[n].translateZ);
          shape(permanent[n].cube);
          popMatrix();
          n++;
        }
      }
    }
  
}

void draw(){
 if(keyPressed && ninety>PI/2){
   ninety=0.0;
 }
 else if(ninety<=PI/2){
   background(125);
   translate(250,250,-250);
   for(int i=1;i<permanent.length;i++){
     Box temp=permanent[i];
     pushMatrix();
     rotateY(temp.rotate);
     translate(temp.translateX,temp.translateY,temp.translateZ);
     shape(temp.cube);
     popMatrix();
     temp.rotate+=PI/90;
     println(temp.rotate);
   }
   ninety+=PI/90;
 }
}
