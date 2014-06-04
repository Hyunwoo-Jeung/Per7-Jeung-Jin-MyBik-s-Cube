void setup(){
 size(500,500,P3D);
 translate(250,250,-250);
 pushMatrix();
rotateX(PI);
//rotateY(PI/2);
translate(-100,-100,-100);
box(100);
popMatrix();
pushMatrix();
rotate(PI/2);
translate(-100,-100,-100);
box(100);
popMatrix();
}
