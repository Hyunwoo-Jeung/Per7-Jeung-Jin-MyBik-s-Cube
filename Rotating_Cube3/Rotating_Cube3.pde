void setup(){
  size(600, 600, P3D);
}

float value = PI/4;
float x = 0;
float y = 0;
float z = 0;

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
  rotateX(x);
  rotateY(y);
  rotateZ(z);
  box(100);
  popMatrix();
}

  void keyReleased(){
    if(key == 'x' || key == 'X'){
      rotateX(value);
      if (x == 2 * PI)
        x = 0;
      x += value;
    }
    else if (key == 'y' || key == 'Y'){
      rotateY(value);
      if (y == 2 * PI)
        y = 0;
      y += value;
    }
    else if (key == 'z' || key == 'Z'){
      rotateZ(value);
      if (z == 2 * PI)
        z = 0;
      z += value;
    }
  }  
