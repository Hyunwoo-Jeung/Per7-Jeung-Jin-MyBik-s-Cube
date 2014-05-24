void setup()
{
  size(200, 200, P3D);
}

void draw()
{
  float angle = atan2(mouseY-100, mouseX-100);
  
  background(255);
  lights();
  pushMatrix();
  translate(100, 100);
  if(mousePressed){
  rotateY(angle);
  rotateX(angle);
  rotateZ(angle);
  }  
  box(50);
  popMatrix();
}
