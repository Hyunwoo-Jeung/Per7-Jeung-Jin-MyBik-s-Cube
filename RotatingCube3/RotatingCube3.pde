long lastTime = 0;
void setup()
{
  size(600, 600, P3D);
  lastTime = millis();
}

float value = PI/360;

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
    int n = 0;
    if(key == 'x' || key == 'X'){
      while (n < 90){
        if(millis() - lastTime >= 1000){
          rotateX(value);
          lastTime = millis();
          n++;
        }
      }
    }
    else if (key == 'y' || key == 'Y')
      rotateY(value);
    else if (key == 'z' || key == 'Z')
      rotateZ(value);  
  }
  box(150);
  popMatrix();
}

