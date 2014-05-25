void setup(){
  size(500,500,P3D);
  background(150);
  makeCube();
}

String currentSpin="none";

void draw(){
  if(inProgress){
    if(currentSpin=="y"){
      moveTopRowLeft();
    }
    else if(currentSpin=="u"){
      moveTopRowRight();
    }
    else if(currentSpin=="h"){
      moveMidRowLeft();
    }
    else if(currentSpin=="j"){
      moveMidRowRight();
    }
    else if(currentSpin=="n"){
      moveBotRowLeft();
    }
    else if(currentSpin=="m"){
      moveBotRowRight();
    }
  }
  
  else{
    if (keyPressed){
      if(key=='y'){
        currentSpin="y";
        inProgress=true;
      }
      else if(key=='u'){
        currentSpin="u";
        inProgress=true;
      }
      else if(key=='h'){
        currentSpin="h";
        inProgress=true;
      }
      else if(key=='j'){
        currentSpin="j";
        inProgress=true;
      }
      else if(key=='n'){
        currentSpin="n";
        inProgress=true;
      }
      else if(key=='m'){
        currentSpin="m";
        inProgress=true;
      }
    }
  }   
}


void makeCube(){
  noFill();
  //Top Row
  translate(150,150,-350);
  for(int i=0;i<3;i++){
    //Back Left Corner  
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    
    translate(-200,100,-200);
  }
}



boolean inProgress=false;


//Row Rotation Methods start Here

//Top Row Spin
//////////////////////////////////////////////////////////////////////////////////////////////////
float topRowDegree=0;
float topRowNinety=0;

void moveTopRowRight(){
  background(150);
  //Making Mid and Bot Row
  translate(150,250,-350);
  
  for(int i=0;i<2;i++){
    //Back Left Corner  
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    
    translate(-200,100,-200);
  }
  //Make Top Row Rotate
  translate(100,-300,100);
  rotateY(topRowDegree);
  translate(-100,0,-100);
  
  fill(255,0,0);
  box(100);
  noFill();
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
    
  
  if(topRowNinety>PI/2){
    inProgress=false;
    topRowNinety=0;
  }
  else{
  topRowDegree+=PI/180;
  topRowNinety+=PI/180;
  }
}


void moveTopRowLeft(){
  background(150);
  //Making Mid and Bot Row
  translate(150,250,-350);
  
  for(int i=0;i<2;i++){
    //Back Left Corner  
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    
    translate(-200,100,-200);
  }
  //Make Top Row Rotate
  translate(100,-300,100);
  rotateY(topRowDegree);
  translate(-100,0,-100);
  fill(0,255,0);
  box(100);
  noFill();
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
    
  if(topRowNinety>PI/2){
    inProgress=false;
    topRowNinety=0;
  }
  
  else{
    topRowDegree-=PI/180;
    topRowNinety+=PI/180;
  }
}




//Mid Row Spin
//////////////////////////////////////////////////////////////////////////////////////////////////
float midRowDegree=0;
float midRowNinety=0;

void moveMidRowRight(){
  background(150);
  //Making Top and Bot Row
  translate(150,150,-350);
  
  for(int i=0;i<2;i++){
    //Back Left Corner  
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    
    translate(-200,200,-200);
  }
  //Make Mid Row Rotate
  translate(100,-300,100);
  rotateY(midRowDegree);
  translate(-100,0,-100);
  
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
    
  
  if(midRowNinety>PI/2){
    inProgress=false;
    midRowNinety=0;
  }
  else{
    midRowDegree+=PI/180;
    midRowNinety+=PI/180;
  }
}

void moveMidRowLeft(){
  background(150);
  //Making Top and Bot Row
  translate(150,150,-350);
  
  for(int i=0;i<2;i++){
    //Back Left Corner  
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    
    translate(-200,200,-200);
  }
  //Make Mid Row Rotate
  translate(100,-300,100);
  rotateY(midRowDegree);
  translate(-100,0,-100);
  
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
    
  
  if(midRowNinety>PI/2){
    inProgress=false;
    midRowNinety=0;
  }
  else{
    midRowDegree-=PI/180;
    midRowNinety+=PI/180;
  }
}

//Bot Row Spin
//////////////////////////////////////////////////////////////////////////////////////////

float botRowDegree=0;
float botRowNinety=0;

void moveBotRowRight(){
  background(150);
  //Making Mid and Bot Row
  translate(150,150,-350);
  
  for(int i=0;i<2;i++){
    //Back Left Corner  
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    
    translate(-200,100,-200);
  }
  //Make Bot Row Rotate
  translate(100,0,100);
  rotateY(botRowDegree);
  translate(-100,0,-100);
  
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
    
  
  if(botRowNinety>PI/2){
    inProgress=false;
    botRowNinety=0;
  }
  else{
  botRowDegree+=PI/180;
  botRowNinety+=PI/180;
  }
}

void moveBotRowLeft(){
  background(150);
  //Making Mid and Bot Row
  translate(150,150,-350);
  
  for(int i=0;i<2;i++){
    //Back Left Corner  
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(-100,0,0);
    box(100);
    translate(0,0,100);
    box(100);
    translate(100,0,0);
    box(100);
    translate(100,0,0);
    box(100);
    
    translate(-200,100,-200);
  }
  //Make Bot Row Rotate
  translate(100,0,100);
  rotateY(botRowDegree);
  translate(-100,0,-100);
  
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(-100,0,0);
  box(100);
  translate(0,0,100);
  box(100);
  translate(100,0,0);
  box(100);
  translate(100,0,0);
  box(100);
    
  
  if(botRowNinety>PI/2){
    inProgress=false;
    botRowNinety=0;
  }
  else{
  botRowDegree-=PI/180;
  botRowNinety+=PI/180;
  }
}
