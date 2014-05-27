void setup()
{
  size(600, 600, P3D);
}

float value = PI/4;

void draw()
{
  float angle = atan2(mouseY-100, mouseX-100);
  
  background(255);
  lights();
  camera(0, 0, (height/2)/tan(PI/6),
         width/2, height/2, 0, 
         0, 1, 0);
  pushMatrix();
  translate(300, 300);
  if (keyPressed){
    if(key == 'x' || key == 'X')
      rotateX(value);
    else if (key == 'y' || key == 'Y')
      rotateY(value);
    else if (key == 'z' || key == 'Z')
      rotateZ(value);  
  }
  box(150);
  popMatrix();
}

