void setup()
{
  size(600, 600, P3D);
}

void draw()
{
  float angle = atan2(mouseY-100, mouseX-100);
  
  background(255);
  lights();
  pushMatrix();
  translate(300, 300);
  if(mousePressed){
  rotateY(angle);
  rotateX(angle);
  rotateZ(angle);
  }  
  box(150);
  popMatrix();
}
