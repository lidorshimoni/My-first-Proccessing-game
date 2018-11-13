      //text//

Text score = new Text();
Text FPS = new Text();
Text currentplayerskintext = new Text();
Text currentenemyskintext = new Text();
Text money = new Text();

      //ellipse//

Ellipse pl = new Ellipse();
Ellipse[] en = new Ellipse[3];

      //image//

Image menuimage = new Image();
Image bg = new Image();
Image go = new Image();
Image ghost = new Image();
Image play = new Image();
Image difflevel = new Image();
Image leaderboard = new Image();
Image shop = new Image();
Image padawan = new Image();
Image jedi = new Image();
Image knight = new Image();
Image[] enemy_skin = new Image[20];
Image[] player_skin = new Image[20];

      //music//

Music nine = new Music();
Music click = new Music();
Music failsound = new Music();

      //int//

int scor = 0;
int x=7;
int size = 0;
int spid = 0;
int v = 10;
int boost = 0;
int time = 0;
int btime=0;
int bgtime=0;
int i=0;
int t=0;
int diflevelint = 2;
int skinint = 0;
int currentenemyskin = 5;
int currentplayerskin = 15;
int moneyint = 0;
int cost = 0;
int bgint=1;


      //boolean//
      
boolean up = false;
boolean down = false;
boolean right = false;
boolean left = false;
boolean menuflag = true;
boolean diflevelflag = false;
boolean leaderboardflag = false;
boolean shopflag = false;
boolean goflag = false;
boolean showFPS = false;

void setup() {
  
          //general//
      
 size (1600,800);
 
          //setImage//
         
 menuimage.setImage("menu.png");        
 bg.setImage("gamebg 1.png");
 ghost.setImage("ghost.png");
 play.setImage("Gameon.png");
 difflevel.setImage("diflevel.png");
 shop.setImage("shop.png");
 leaderboard.setImage("TopScore.png");
 jedi.setImage("Jedi.png");
 knight.setImage("Jedi Knight.png");
 padawan.setImage("PADAWAN.png");
 go.setImage("gameover2.png");
 
          //musicLoad//
 nine.load("9000.mp3");
 click.load("click_one.wav");
 failsound.load("failsound.wav");
 
          //settings//
      
    //background//
 bg.x=0;
 bg.y=0;
 bg.height=800;
 bg.width=1600;
    //gameover//
 go.x=0;
 go.y=0;
 go.height=800;
 go.width=1600;
   //ghost//
 ghost.x=1800;
 ghost.height=50;
 ghost.width=50;
   //player//
 pl.radiusX=70;
 pl.radiusY=70;
 pl.x=900;
 pl.y=400;
 pl.brush=color(0,0,255);
 pl.penThickness=x;
 pl.pen=color(0,0,255);
   //score text//
 score.textSize = 50;
 score.brush = color(255,0,0);
 score.x = 25;
 score.y = 40;
     //FPS//
 FPS.textSize = 20;
 FPS.brush = color(255,0,0);
 FPS.x = 1534;
 FPS.y = 790;
     //current player skin text//
 currentplayerskintext.textSize = 60;
 currentplayerskintext.brush = color(255,0,0);
 currentplayerskintext.x=50;
 currentplayerskintext.y=250;
 currentplayerskintext.text= ("Player's Skin");
     //current enemy skin text//
 currentenemyskintext.textSize = 60;
 currentenemyskintext.brush = color(255,0,0);
 currentenemyskintext.x=1150;
 currentenemyskintext.y=250;
 currentenemyskintext.text= ("Enemy's Skin");
     //money text//
 money.textSize=60;
 money.brush = color (255,0,0);
 money.x=100;
 money.y=100;
   //play//
 play.x=500;
 play.y=50;
   //difficulty level button//
 difflevel.x=500;
 difflevel.y=250;
   //leaderboard button//
 leaderboard.x=500;
 leaderboard.y=450;
   //shop button//
 shop.x=500;
 shop.y=650;
 
      //loops//
      
    //setup enemys//
 for(int i =0; i<3 ; i++){
  en[i] = new Ellipse();
  en[i].radiusX=70;
  en[i].radiusY=70;
  en[i].x=400;
  en[i].y=600;
  en[i].brush=color(255,0,0);
  en[i].penThickness=x;
  en[i].direction=int(random(0,360));
 }
    //setup enemy skin//
 for(i=0;i<enemy_skin.length;i++) {
   enemy_skin[i]=new Image();
   enemy_skin[i].setImage("skin (" + (i+1) + ").png");
 }
    //setup player skin//
 for(i=0;i<player_skin.length;i++) {
   player_skin[i]=new Image();
   player_skin[i].setImage("skin (" + (i+1) + ").png");
 }
 
}

void draw() {
 money.text= ("Money : " + moneyint);
 pl.penThickness=x;
     
  if(menuflag==true){
    menuimage.draw();
    play.draw();
    leaderboard.draw();
    difflevel.draw();
    shop.draw();
    currentplayerskintext.draw();
    currentenemyskintext.draw();
    money.draw();
    
  enemy_skin[currentenemyskin].x =currentenemyskintext.x +120;
  enemy_skin[currentenemyskin].y = currentenemyskintext.y +70;
  enemy_skin[currentenemyskin].draw();
  
  player_skin[currentplayerskin].x =currentplayerskintext.x +120;
  player_skin[currentplayerskin].y = currentplayerskintext.y +70;
  player_skin[currentplayerskin].draw();
  

 }
  
 if (shopflag==false && leaderboardflag==false && diflevelflag==false && menuflag==false){
  
  println(moneyint);

 if(bgtime>=1000 && bgint<5){
   bgint=bgint+1;
   bg.setImage("gamebg "+bgint+".png"); 
   bgtime=0;
 }
  
  btime=btime-1;
  time=time+1;
  bgtime=bgtime+1;
  
  for(i=0; i<3; i++){ 
  en[i].speed=v;
  en[i].penThickness=x;
  en[i].pen=color(255,0,0);

  }
  
  background (255,255,255);
  bg.draw();
  pl.draw();
 
  for(i=0;i<diflevelint;i++){
  enemy_skin[currentenemyskin+i].x =en[i].x -70;
  enemy_skin[currentenemyskin+i].y = en[i].y -70;
 }
   player_skin[currentplayerskin].x = pl.x -70;
  player_skin[currentplayerskin].y = pl.y -70;
 
 /*   for(i=0; i<enemy_skin.length; i++){
      
                  
                 enemy_skin[i].width = 2*x;
                 enemy_skin[i].height = 2*x;
  
                 player_skin[i].width = 2*x;
                 player_skin[i].height = 2*x;
                 

 
  enemy_skin[1].x =en[1].x -70;
  enemy_skin[1].y = en[1].y -70;
  
  enemy_skin[i].x =en[2].x -70;
  enemy_skin[i].y = en[2].y -70;
  
  enemy_skin[7].x =en[0].x -70;
  enemy_skin[7].y = en[0].y -70;

  player_skin[currentplayerskin].x = pl.x -70;
  player_skin[currentplayerskin].y = pl.y -70;

  }
*/
  score.text = "Score:"+scor;
  FPS.text = "FPS:" +(frameRate);
  FPS.draw();
  score.draw();
  
  if (goflag== false){
  scor=scor+1;
  size=size+1;
  spid=spid+1;

}
for(i=0;i<diflevelint;i++){
    en[i].draw();
  
  if((pl.pointInShape(en[i].x,en[i].y) || pl.pointInShape(en[i].x+x+70,en[i].y) || pl.pointInShape(en[i].x-x-70,en[i].y) || pl.pointInShape(en[i].x,en[i].y+x+70) || pl.pointInShape(en[i].x,en[i].y-x-70)) && (btime<=0)){
   moneyint= moneyint + scor - cost;
   cost=0;
   en[i].speed=0;
   pl.speed=0;
   time=0;
   menuflag=true;
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
   x=7;
   spid=0;
   goflag=false;
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
   failsound.play();

  }


  if ((pl.pointInShape(en[i].x,en[i].y) || pl.pointInShape(en[i].x+x,en[i].y) || pl.pointInShape(en[i].x-x,en[i].y) || pl.pointInShape(en[i].x,en[i].y+x) || pl.pointInShape(en[i].x,en[i].y-x)) && (btime<=600&&btime>0) && (x>=40)){
 x=x-1;
  }
  if (goflag== true){
    go.draw();  
  }
  if(en[i].x - x -70 <= 0 || en[i].x + x + 70 >= width) {
    en[i].direction = 180 - en[i].direction;
   
    if (en[i].x-x-70<=0){
    en[i].x=10+x+70;
   }
   if (en[i].x+x+70>=width){
     en[i].x=1590-x-70;
   }
  }
  

  if(en[i].y - x -70<= 0 || en[i].y + x +70 >= height) {
    en[i].direction *= -1;
    if(en[i].y-x-70<=0){
      en[i].y=10+x+70;
    }
    if (en[i].y+x+70>=height){
      en[i].y=790-x-70;
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
  en.direction=en.direction*(-1);a
   en.y=10+x;
   en.direction=en.direction*(-1); 
  }
  */
  if (pl.x-x-70<=0){
    pl.x=x+70;
    pl.speed=0;
  }
  if (pl.x+x+70>=1600){
    pl.x=1600-x-70;
    pl.speed=0;
}
  if (pl.y-x-70<=0){
    pl.y=x+70;
    pl.speed=0;
  }
  if (pl.y+70+x>=800){
    pl.y=800-x-70;
    pl.speed=0;
}
if(size>=50 && x<=150){
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
  }
}
if(boost==1){
 ghost.x = 50;
 ghost.y = 50;
 ghost.alpha=time;
 ghost.draw();
}

 for(i=0;i<diflevelint;i++){
   
  enemy_skin[currentenemyskin+i].draw(); 
 }
 player_skin[currentplayerskin].draw();
 
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

}
void keyPressed () {
  if (key=='w' || keyCode == UP){
    up=true;
  }
  if (key=='a' || keyCode == LEFT){
    left=true;


}
   if (key=='d' || keyCode == RIGHT){

    right=true;
  }
  if (key=='s' || keyCode == DOWN){

    down=true;

  }
  
  
 if(key=='r' || keyCode == ENTER){
  menuflag=true;
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
  x=7;
  spid=0;
  goflag=false;
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
  
  if (key=='f' || key==' '){
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
   if (key=='w' || keyCode == UP){
     pl.speed=0;
     up=false;
   }
   if (key=='s' || keyCode == DOWN){
     pl.speed=0;
     down=false;
   }
   if (key=='a' || keyCode == LEFT){
     pl.speed=0;
     left=false;
   }
   if (key=='d' || keyCode == RIGHT){
     pl.speed=0;
     right=false;
   }
}
void mouseClicked (){
  if(play.pointInShape(mouseX,mouseY)) {
        if(menuflag==true){
      click.play();
    }
   menuflag=false; 
  }
  
  
    if(difflevel.pointInShape(mouseX,mouseY)) {
          if(menuflag==true){
      click.play();
    }
   diflevelflag=true;
   menuflag=false;  
   padawan.x=500;
   padawan.y=100;
   jedi.x=500;
   jedi.y=325;
    knight.x=500;
    knight.y=550;
    menuimage.draw();
   jedi.draw();
   knight.draw();
   padawan.draw();
    }
    
    
    if(knight.pointInShape(mouseX,mouseY)) {
      if(diflevelflag==true){
      click.play();
    }
   diflevelflag=false; 
   diflevelint=3;
  }
  
    if(padawan.pointInShape(mouseX,mouseY)) {
    if(diflevelflag==true){
      click.play();
    }
   diflevelflag=false; 
   diflevelint=1;
  }
  
    if(jedi.pointInShape(mouseX,mouseY)) {
     if(diflevelflag==true){
      click.play();
    }
   diflevelflag=false; 
   diflevelint=2;
  }
  
  if(leaderboard.pointInShape(mouseX,mouseY)){
    if(menuflag==true){
      click.play();
    }
   leaderboardflag=true;
   menuflag=false;
   
  }
  
  if(shop.pointInShape(mouseX,mouseY)){
        if(menuflag==true){
      click.play();
    }
   shopflag=true;
   menuflag=false;

  }
}