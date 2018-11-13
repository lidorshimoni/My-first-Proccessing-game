Text score = new Text();
Image bg = new Image();
Ellipse pl = new Ellipse();
Ellipse[] en = new Ellipse[3];
int scor = 0;
Rect backgroundrect = new Rect();
Image go = new Image();
int fin=0;
int x=70;
int size = 0;
int spid = 0;
int v = 10;
Music nine = new Music();
int boost = 0;
Image ghost = new Image();
int time = 0;
int btime=0;
int i=0;
int t=0;
boolean up = false;
boolean down = false;
boolean right = false;
boolean left = false;

void setup() {
 size (1600,800);
 bg.setImage("gamebg.png");
 bg.x=0;
 bg.y=0;
 bg.height=800;
 bg.width=1600;
 nine.load("9000.mp3");
 ghost.setImage("ghost.png");
 
 go.setImage("gameover2.png");
 go.x=0;
 go.y=0;
 go.height=800;
 go.width=1600;
ghost.x=1800;
  ghost.height=50;
  ghost.width=50;
  
pl.radiusX=x;
pl.radiusY=x;
pl.x=900;
pl.y=400;
pl.brush=color(0,0,255);
pl.penThickness=7;

for(int i =0; i<3 ; i++){
en[i] = new Ellipse();
en[i].radiusX=x;
en[i].radiusY=x;
en[i].x=400;
en[i].y=600;
en[i].brush=color(255,0,0);
en[i].penThickness=7;
en[i].direction=int(random(0,360));}
 en[1].x=1000;
 en[1].y=500;
 en[2].x=300;
 en[2].y=500;
 score.textSize = 50;
 score.brush = color(255,0,0);
 score.x = 25;
 score.y = 40;

 backgroundrect.width=1800;
 backgroundrect.height=800;
 backgroundrect.x=0;
 backgroundrect.y=0;
}

void draw() {
  println(frameRate);
  btime=btime-1;
  time=time+1;
  for(i=0; i<3; i++){ 
  en[i].speed=v;
  en[i].radiusX=x;
  en[i].radiusY=x; 
  }
  background (255,255,255);
  bg.draw();
   score.text = "Score:"+scor;
  score.draw();
  pl.draw();
  if (fin==0){
  scor=scor+1;
  size=size+1;
  spid=spid+1;
  pl.radiusX=x;
  pl.radiusY=x;
}
for(i=0;i<3;i++){
    en[i].draw();
  if((pl.pointInShape(en[i].x,en[i].y) || pl.pointInShape(en[i].x+x,en[i].y) || pl.pointInShape(en[i].x-x,en[i].y) || pl.pointInShape(en[i].x,en[i].y+x) || pl.pointInShape(en[i].x,en[i].y-x)) && (btime<=0)){
    fin=1;
   en[i].speed=0;
   pl.speed=0;
   time=0;
    go.draw();  
  }
  if ((pl.pointInShape(en[i].x,en[i].y) || pl.pointInShape(en[i].x+x,en[i].y) || pl.pointInShape(en[i].x-x,en[i].y) || pl.pointInShape(en[i].x,en[i].y+x) || pl.pointInShape(en[i].x,en[i].y-x)) && (btime<=600&&btime>0) && (x>=40)){
 x=x-1;
  }
  if (fin==1){
    go.draw();  
  }
  if(en[i].x - x <= 0 || en[i].x + x >= width) {
    en[i].direction = 180 - en[i].direction;
    if (en[i].x-x<=0){
    en[i].x=10+x;
   }
   if (en[i].x+x>=width){
     en[i].x=1590-x;
   }
  }
  if(en[i].y - x <= 0 || en[i].y + x >= height) {
    en[i].direction *= -1;
    if(en[i].y-x<=0){
      en[i].y=10+x;
    }
    if (en[i].y+x>=height){
      en[i].y=790-x;
    }
  }
  
  /*if (en.x-x<=0&&en.direction>180){
  en.x=10+x;
  en.direction=en.direction+90;
  }
    if (en.x-x<=0&&en.direction<180){
  en.x=10+x;
  en.direction=en.direction-90;
    }
      if (en.x+x>=1600&&en.direction>180){
  en.x=1590-x;
  en.direction=en.direction-90;
  }
    if (en.x+x>=1600&&en.direction<180){
  en.x=1590-x;
  en.direction=en.direction+90;
    }*/
 /* if (en.y+x>=800) {
  en.y=790-x;
  en.direction=en.direction*(-1);
  }
  if (en.y-x<=0) {
   en.y=10+x;
   en.direction=en.direction*(-1); 
  }
  */
  if (pl.x-x<=0){
    pl.x=x+10;
    pl.speed=0;
  }
  if (pl.x+x>=1600){
    pl.x=1600-x-10;
    pl.speed=0;
}
  if (pl.y-x<=0){
    pl.y=x+10;
    pl.speed=0;
  }
  if (pl.y+x>=800){
    pl.y=800-x-10;
    pl.speed=0;
}
if(size>=50&& x<=150){
  x=x+1;
  size=0;
}
if(spid>=200 && v<=30){
  v=v+1;
  spid=0;
}
if(time==1000){
   ghost.x= int(random(50,1550));
  ghost.y= int(random(50,750));
}

  if(pl.pointInShape(ghost.x,ghost.y) || pl.pointInShape(ghost.x+50,ghost.y) || pl.pointInShape(ghost.x-50,ghost.y) || pl.pointInShape(ghost.x,ghost.y+50) || pl.pointInShape(ghost.x,ghost.y-50)){
  boost=1;
  time=0;
  ghost.x=1800;
  }
}
  if (btime<=0||btime<=120&&btime>100||btime<80&&btime>60||btime<40&&btime>20){
    en[1].alpha=250;
    en[0].alpha=250;
    en[2].alpha=250;
  }
  if (btime<=600&&btime>120){
    en[0].alpha=100;
    en[2].alpha=100;
    en[1].alpha=100;
  }
 if ((btime<=100&&btime>=80||btime<=60&&btime>=40||btime<=20&&btime>=0)&&(btime>0)){
  en[0].alpha=100;
  en[2].alpha=100;
  en[1].alpha=100;
 }
 score.draw();
if (time>=1000){
  ghost.draw();
}


if(up==true && left==true){
 pl.direction=Direction.UPLEFT; 
   pl.speed=v+5;
}
else if(up==true && right==true){
  pl.direction=Direction.UPRIGHT;
  pl.speed=v+5;
}
else if(down==true && left==true){
  pl.direction=Direction.DOWNLEFT;
  pl.speed=v+5;
}
else if(down==true && right==true){
pl.direction=Direction.DOWNRIGHT;
pl.speed=v+5;
}
else if(up == true) {
 pl.direction=Direction.UP; 
   pl.speed=v+5;
}
else if(down == true) {
 pl.direction=Direction.DOWN; 
   pl.speed=v+5;
}
else if(left == true) {
 pl.direction=Direction.LEFT; 
   pl.speed=v+5;
}
else if(right == true) {
 pl.direction=Direction.RIGHT; 
   pl.speed=v+5;
}

}
void keyPressed () {
  if (key=='w'){
    up=true;
  }
  if (key=='a'){
    left=true;


}
   if (key=='d'){

    right=true;
  }
  if (key=='s'){

    down=true;

  }
  if(key=='r'){
pl.x=900;
pl.y=400;
en[0].x=300;
en[0].y=600;
en[1].x=300;
en[1].y=600;
en[2].x=300;
en[2].y=600;
en[0].direction=int(random(0,360));
en[1].direction=int(random(0,360));
en[2].direction=int(random(0,360));
v=10;
x=70;
spid=0;
fin=0;
scor=0;
size=0;
time=0;
boost=0;
ghost.x=1800;
en[1].alpha=250;
en[2].alpha=250;
en[0].alpha=250;
btime=0;
pl.speed=0;
  }
  if (key=='f'){
       if(boost>=1){
    pl.speed=v+20;
    nine.play();
    btime=600;
    en[1].alpha = 100;
    en[0].alpha = 100;
    en[2].alpha = 100;
   }
   boost=0;
 }
 if (key== '6'){
   boost=1;
   time=time+500;
 }
}
void keyReleased (){
   if (key=='w'){
     up=false;
   }
   if (key=='s'){
     down=false;
   }
   if (key=='a'){
     left=false;
   }
   if (key=='d'){
     right=false;
   }
}
   