Box one;
Box two;
Box twentyseven;

Box[] permanent;
Box[] location;
Box[] temporary;

boolean inProgress=false;
String currentSpin="none";
int ninety=0;
boolean goPositive=true;

void setup(){
  size(500,500,P3D);
  background(125);    
  
  //Initialize arrays;
  //We don't use spot 0;
  permanent = new Box[28];
  location = new Box[28];
  
  //Create Box and put into permanent and location
  one = new Box(-100,-100,-100);
  permanent[1] = one;
  location[1] = one;
  two = new Box(100,0,0);
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
    //myDraw();
    //add/subtract to temp[] ArrayList
    //prints out cubes
    }
    else{
      ninety=0;
      inProgress=false;
    }
  }
  else{
  //listen for key
  //each key calls a differnt method: 
  //that finds location
  //puts them into temp;
  //moves boxes to next location
  //adds to ArrayList
  //tells if going back or going forward
  }
}

void myDraw(){
 //Last Step
 //don't forget PI/180
}
