Box one;
Box two;
Box twentyseven;

Box[] permanent;
Box[] location;
Box[] temporary;

boolean inProgress=false;
float ninety=0.0;
boolean goPositive=true;

void setup(){
  size(500,500,P3D);
  background(125);    
  
  //Initialize arrays;
  //We don't use spot 0;
  permanent = new Box[28];
  location = new Box[28];
  temporary = new Box[9];
  
  //Create Box and put into permanent and location
  one = new Box(-100,-100,-100);
  permanent[1] = one;
  location[1] = one;
  
  two = new Box(0,-100,-100);
  permanent[2] = two;
  location[2] = two;
  
  twentyseven = new Box(100,0,0);
  permanent[27] = twentyseven;
  location[27] = twentyseven;
}

void draw(){
  //if camera
  if(inProgress){
    if(ninety<=PI/2){
      myDraw();
    }
    else{
      ninety=0.0;
      inProgress=false;
    }
  }
  else{
  //listen for key
  //each key calls a differnt method: 
  //that finds location
  //puts them into temp;
  //adds to ArrayList
  //tells if going back or going forward
  //moves boxes to next location 
  
  if (keyPressed){
      if(key=='e'){
        xPositiveA();
        inProgress=true;
      }
      else if(key=='d'){
        xNegativeA();
        inProgress=true;
      }
    }
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Functions
//X Right A to Left C
//Y Top to Bottom
//Z Front to Back
//xPositive 1-90
//yPositive 91-180
//zPostive 181-270
//xNegative -1 to -90
//yNegative -91 to -180
//zNegative -181 to -270

////////////////////////////////////////////////////////////////////////////////////
void xPositiveA(){
  goPositive =true;
  
  for (int i=0;i<9;i++){
     temporary[i]=location[1+(i*3)];
     temporary[i].rotation.add(temporary[i].rotation.size(),PI/18);
  }
  
  //manually moving boxes to next location
  Box temp=location[7];
  Box temp2=location[25];
  
  location[7]=location[1];
  location[25]=temp;
  temp=location[19];
  location[19]=temp2;
  location[1]=temp;
  
  temp=location[16];
  location[16]=location[4];
  temp2=location[22];
  location[22]=temp;
  temp=location[10];
  location[10]=temp2;
  location[4]=temp;
}
////////////////////////////////////////////////////////////////////////////////////
void xNegativeA(){
  goPositive =false;
  
  for (int i=0;i<9;i++){
     temporary[i]=location[1+(i*3)];
     temporary[i].rotation.add(temporary[i].rotation.size(),PI/18);
  }
  
  //manually moving boxes to next location
  Box temp=location[19];
  Box temp2=location[25];
  
  location[19]=location[1];
  location[25]=temp;
  temp=location[7];
  location[7]=temp2;
  location[1]=temp;
  
  temp=location[10];
  location[10]=location[4];
  temp2=location[22];
  location[22]=temp;
  temp=location[16];
  location[16]=temp2;
  location[4]=temp;
}
////////////////////////////////////////////////////////////////////////////////////

void myDraw(){
 //Last Step
 //don't forget PI/180
 
  //myDraw();
    //prints out cube
    //add/subtract to temp[] ArrayList.size()-1
    //adds to ninety
    background(125);
    translate(250,250,-250);
    
    //Print cube
    for(int i=1;i<28;i++){
      Box temp = permanent[i];
      
      for (int r=0;r<temp.rotation.size();r++){
        if(temp.rotation.get(r)>0.0){
          if(temp.rotation.get(r)<=PI/2){
            rotateX(temp.rotation.get(r));
          }
          else if(temp.rotation.get(r)<=PI){
            rotateY(temp.rotation.get(r)-PI/2);
          }
          else{
            rotateZ(temp.rotation.get(3)-PI);
          }
        }
        else{
          if(temp.rotation.get(r)>=-PI/2){
            rotateX(temp.rotation.get(r));
          }
          else if(temp.rotation.get(r)>=-PI){
            rotateY(temp.rotation.get(r)+PI/2);
          }
          else{
            rotateZ(temp.rotation.get(3)+PI);
          }
        }
      }
      
      translate(temp.translateX,temp.translateY,temp.translateZ);
      shape(temp.cube);
      translate(-temp.translateX,-temp.translateY,-temp.translateZ);
      
      for (int r=temp.rotation.size()-1;r>=0;r--){
        if(temp.rotation.get(r)>0.0){
          if(temp.rotation.get(r)<=PI/2){
            rotateX(-temp.rotation.get(r));
          }
          else if(temp.rotation.get(r)<=PI){
            rotateY(-temp.rotation.get(r)-PI/2);
          }
          else{
            rotateZ(-temp.rotation.get(3)-PI);
          }
        }
        else{
          if(temp.rotation.get(r)>=-PI/2){
            rotateX(-temp.rotation.get(r));
          }
          else if(temp.rotation.get(r)>=-PI){
            rotateY(-temp.rotation.get(r)+PI/2);
          }
          else{
            rotateZ(-temp.rotation.get(3)+PI);
          }
        }
      }
    
    }
    
    //Add/Subract temporary[]
    float n = PI/18;
    ninety+=n;
    if(!goPositive){
      n*=-1;
    }
    
    Box temp=temporary[0];
    for (int i=0;i<9;i++){
      temp=temporary[i];
      temp.rotation.set(temp.rotation.size()-1,temp.rotation.get(temp.rotation.size()-1)+n);
    }
    
}
