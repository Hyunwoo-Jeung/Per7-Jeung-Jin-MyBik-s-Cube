void setup(){
size(500,500);
background(150);

//Top Layer
rect(100,100,100,100);
rect(200,100,100,100);
rect(300,100,100,100);

//Mid Layer
rect(100,200,100,100);
rect(200,200,100,100);
rect(300,200,100,100);

//Bot Layer
rect(100,300,100,100);
rect(200,300,100,100);
rect(300,300,100,100);
}


void draw(){
  background(150);
  int a=0;
  int b=0;
  int c=0;
  for(int i=0;i<3;i++){
   for(int w=0;w<3;w++){
     fill(a,b,c);
     
     rect(w*100+100,i*100+100,100,100);
   } 
  }
}

