// import processing.video.*;

//MovieMaker mm; 
float thold = 5;
float spifac = 1.05;
int outnum;
float drag = 0.01;
int big = 500;
ball bodies[] = new ball[big];
float mX;
float mY;
int[] xPath = new int[3000];
int[] yPath = new int[3000];
int xCounter = 0;
int yCounter = 0;
int xSpotCounter = 0;
int ySpotCounter = 0;

void setup() {
  noCursor();
  fullScreen();
  strokeWeight(1);
  fill(255, 255, 255);
  stroke(255, 255, 255, 5);
  background(0, 0, 0);   
  smooth();
  for(int i = 0; i < big; i++) {
    bodies[i] = new ball();
  }
  

  for(int y = 0; y<200; y++){
      yPath[y] = y;
    }
    ySpotCounter+= 200;
  
  for(int i=0; i<100; i++){
           xPath[i] = i;
  }
   xSpotCounter+= 100;
  
  for(int i=0; i<200; i=i+2){
      xPath[xSpotCounter+i/2] = i;
  }
    xSpotCounter+= 100;

  
  for(int i=0; i<400; i=i+2){
      xPath[xSpotCounter+i/2] = i;
  }
      xSpotCounter+= 200;

  
  for(int h = 450; h > 0; h= h-3){
    yPath[ySpotCounter] = h;
    ySpotCounter+=1;
  }
  
  for(int v = 200; v < 200; v++){
    xPath[xSpotCounter] = v;
    xSpotCounter+=1;
  } 
  
  
  for(int h = 450; h > 0; h= h-3){
    yPath[ySpotCounter] = h;
    ySpotCounter+=1;
  }
  
  for(int v = 900; v > 450; v=v-10){
    xPath[xSpotCounter] = v;
    xSpotCounter+=1;
  } 
  
   for(int h = 1000; h > 400; h= h-5){
    yPath[ySpotCounter] = h;
    ySpotCounter+=1;
  }
  
  for(int v = 1500; v > 450; v=v-5){
    xPath[xSpotCounter] = v;
    xSpotCounter+=1;
  } 
  
  for(int h = 1000; h > 400; h= h-5){
    yPath[ySpotCounter] = h;
    ySpotCounter+=1;
  }
  
  for(int v = 0; v < 450; v=v+10){
    xPath[xSpotCounter] = v;
    xSpotCounter+=1;
  } 
}


void setBackground(int x, int y){
    background(0, 0, 0);
    mX += 0.3 * (x - mX);
    mY += 0.3 * (y - mY);
}

void setMxMy(int x, int y){
      mX += 0.3 * (x - mX);
      mY += 0.3 * (y - mY);
}



void draw() {
    if(xCounter<xPath.length && yCounter<yPath.length){
    setMxMy(xPath[xCounter], yPath[yCounter]);
    xCounter++;
    yCounter++;}
    //mX += 0.3 * (mouseX - mX);
    //mY += 0.3 * (mouseY - mY);
  for(int i = 0; i < big; i++) {
    bodies[i].render();
  }
  //saveFrame("frames/####.png");
}

class ball {
  float X;
  float Y;
  float Xv;
  float Yv;
  float pX;
  float pY;
  float w;
  ball() {
    X = random(1000);
    Y = random(800);
    w = random(1 / thold, thold);
  }
  void render() {
    if(!mousePressed) {
      Xv /= spifac;
      Yv /= spifac;
    }
    Xv += drag * (mX - X) * w;
    Yv += drag * (mY - Y) * w;
    X += Xv;
    Y += Yv;
    line(X, Y, pX, pY);
    pX = X;
    pY = Y;
  }
}