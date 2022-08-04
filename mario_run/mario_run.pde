final int START_STATE = 1;
final int PLAY_STATE = 2;
final int BOSS_STATE = 3;
final int GAMEOVER_STATE = 4;
final int WIN_STATE = 5;
int state = START_STATE;
color sky = color(85,217,255);
color dirt = color(126,103,9);
color grass = color(39,216,67);
color lumbaman = color(163,118,92);
PImage marioplay;
PImage marioplay2;
PImage mariostart;
PImage mariotext;
PImage marioclouds;
PImage lumba;
PImage bowser;
int mariox = 590;
int marioy = 560;
float accy1 = 0.2;
float speedy1 = 1;
float accy2 = 0.2;
float speedy2 = 1;
int cloudx1 = 850;
int cloudx2 = 400;
int cloudy = 10;
int lumbax = 1300;
int lumbay = 560;
int score = 0;
int bowserx = 1000;
int bowsery = 425;
int bossscore = 5;
float speedy3 = 1;
float speedx3 = 1;
float accy3 = 0.5;
int ballx1 = mariox+20;
int bally1 = marioy+50;
int ballx2 = mariox+20;
int bally2 = marioy+50;
int ballx3 = mariox+20;
int bally3 = marioy+50;
boolean fireball1 = false;
boolean fireball2 = false;
boolean fireball3 = false;
int bowserhp = 20;

void setup(){
  size(1280,720);
  marioplay = loadImage("mario man.png");
  marioplay2 = loadImage("mario man2.png");
  mariostart = loadImage("mario start.png");
  mariotext = loadImage("mario text.png");
  marioclouds = loadImage("mario clouds.png");
  lumba = loadImage("lumba.png");
  bowser = loadImage("BOWSER.png");
}

void draw(){
  switch(state){
    case START_STATE: drawStart();
    break;
    case PLAY_STATE: drawPlay();
    break;
    case BOSS_STATE: drawBoss();
    break;
    case GAMEOVER_STATE: drawGameOver(); 
    break;
    case WIN_STATE: drawWin();
    break;
  }
}

void drawPlay(){
  background(sky);
  fill(grass); 
  rect(0,650,1280,670);
  fill(dirt);
  rect(0,670,1280,720);
  fill(0);
  text("Score: " +score,50,20);
  speedy1 += accy1; 
  speedy2 += accy2;
  marioy += speedy1+1;
  lumbay += speedy2+1;
  cloudx1 = cloudx1-2;
  if(cloudx1+100<0){
    cloudx1 = width;
  }
  image(marioclouds, cloudx1, cloudy);
  
  cloudx2 = cloudx2-2;
  if(cloudx2+100<0){
    cloudx2 = width;
  }
  image(marioclouds, cloudx2, cloudy);
  
  if(marioy>560){
    marioy=560;
      if(keyPressed){
        if(keyCode==UP){
          speedy1 = -10;
      }
    }
  }
  if(keyPressed){
    if(keyCode==UP){    
      image(marioplay,mariox,marioy);
    }
  }
  
 
  if(get(mariox,marioy+90)==grass){
    accy1 = 0.2;
  }
  
  if(keyPressed){
    if(keyCode==RIGHT){
      image(marioplay,mariox,marioy);
      if(keyCode==RIGHT && mariox<width-80){
        mariox=mariox+3;
      }
    }
  }
  
  if(keyPressed){
    if(keyCode==LEFT){
      image(marioplay2,mariox,marioy);
      if(keyCode==LEFT && mariox>0){
        mariox=mariox-3;
      }
    }
  }
    else{
      image(marioplay,mariox,marioy);
    }
   
  lumbax = lumbax-2;
  
  if(lumbax+100<0){
    lumbax = width;
    score = score+1;
  }
  
  if(lumbay>560){
    lumbay = 560;
    if(lumbay == 560){
      speedy2 = -7.5;
    }
  }
 if(get(lumbax,lumbay+90)==grass){
    accy2 = 0.2;
  }
  image(lumba,lumbax,lumbay); 
  
  if(get(mariox,marioy)==lumbaman){
    state=GAMEOVER_STATE;
  }
  if(score>=bossscore){
    fill(0);
    text("Boss nivå upplåst!\nTryck på musknappen för att gå vidare", width/2, height/2);
    if(mousePressed){
      state=BOSS_STATE;
      }
  }
  
}
void drawBoss(){
  background(sky);
  fill(grass); 
  rect(0,650,1280,670);
  fill(dirt);
  rect(0,670,1280,720);
  speedy1 += accy1; 
  speedy2 += accy2;
  marioy += speedy1+1;
  cloudx1 = cloudx1-2;
  cloudx2 = cloudx2-2;
  speedy3 += accy3;
  bowsery += speedy3+3;
  bowserx += speedx3;
  
  if(cloudx1+100<0){
    cloudx1 = width;
  }
  image(marioclouds, cloudx1, cloudy);
  
  if(cloudx2+100<0){
    cloudx2 = width;
  }
  image(marioclouds, cloudx2, cloudy);
  
  if(marioy>560){
    marioy=560;
      if(keyPressed){
        if(keyCode==UP){
          speedy1 = -10;
      }
    }
  }
  if(keyPressed){
    if(keyCode==UP){    
      image(marioplay,mariox,marioy);
    }
  }
   if(get(mariox,marioy+90)==grass){
    accy1 = 0.2;
  }
  if(keyPressed){
    if(keyCode==RIGHT){
      image(marioplay,mariox,marioy);
      if(keyCode==RIGHT && mariox<width-80){
        mariox=mariox+3;
      }
    }
  }
  if(keyPressed){
    if(keyCode==LEFT){
      image(marioplay2,mariox,marioy);
      if(keyCode==LEFT && mariox>0){
        mariox=mariox-3;
      }
    }
  }
  else{
      image(marioplay,mariox,marioy);
    }
    if (bowsery>425){
      bowsery=425;
    }
    if (bowsery==425){
      speedy3 = -25;
      speedx3= speedx3*-1;
    }
    
    image(bowser,bowserx,bowsery);
   
  if(fireball1){
    if(ballx1 > width){
      fireball1 = false;
    }
    fill(250,28,28);
    ellipse(ballx1,bally1,20,20);
    ballx1+=7;
  }
  if(fireball2){
    if(ballx2 > width){
      fireball2 = false;
    }
    fill(250,28,28);
    ellipse(ballx2,bally2,20,20);
    ballx2+=7;
  }
  if(fireball3){
    if(ballx3 > width){
      fireball3 = false;
    }
    fill(250,28,28);
    ellipse(ballx3,bally3,20,20);
    ballx3+=7;
  }
  
 if(bowserx<ballx1 && ballx1<bowserx+280 && bowsery<bally1 && bally1<bowsery+248){
    bowserhp-=1;
    fireball1 = false;
    ballx1 = mariox+20;
   } 
 if(bowserx<ballx2 && ballx2<bowserx+280 && bowsery<bally2 && bally2<bowsery+248){
    bowserhp-=1;
    fireball2 = false;
    ballx2 = mariox+20;
 }
 if(bowserx<ballx3 && ballx3<bowserx+280 && bowsery<bally3 && bally3<bowsery+248){
    bowserhp-=1;
    fireball3 = false;
    ballx3 = mariox+20;
 }
   fill(0);
   text("HP: "+bowserhp, bowserx+100, bowsery);
   
   if(bowserhp==0){
     state=WIN_STATE;
   }
     
 }

void drawStart(){
  background(sky);
  fill(grass);
  rect(0,650,1280,670);
  fill(dirt);
  rect(0,670,1280,720);
  textAlign(CENTER,CENTER);
  textSize(20);
  fill(0);
  image(mariostart,width/2+150, 100);
  image(mariotext,415,100);
  text("Tryck på ENTER för att starta spelet", width/2, height/2);
  text("© Nintendo 1982", 1180, 690);
  if(keyPressed){
    if(key==ENTER){
      state=PLAY_STATE;
    }
  }
}

void drawGameOver(){
  textAlign(CENTER,CENTER);
  textSize(20);
  fill(0);
  text("Game Over\nTryck på musknappen för att starta om",width/2, height/2);
  if(mousePressed){
    state=START_STATE;
    init();
  }
}

void keyReleased() {
    if(keyCode==SHIFT && state==BOSS_STATE){
      image(marioplay,mariox,marioy);
      if(!fireball1){
        ballx1 = mariox+20;
        bally1 = marioy+50;
        fireball1 = true;
        }
      else if(!fireball2){
        ballx2 = mariox+20;
        bally2 = marioy+50;
        fireball2 = true;
        }
      else if(!fireball3){
        ballx3 = mariox+20;
        bally3 = marioy+50;
        fireball3 = true;
      }
    }
  }

void drawWin(){
  strokeWeight(1);
  background(sky);
  fill(grass);
  rect(0,650,1280,670);
  fill(dirt);
  rect(0,670,1280,720);
  fill(0);
  image(mariostart,440, 120);
  cloudx1 = cloudx1-2;
  cloudx2 = cloudx2-2;
  
  if(cloudx1+100<0){
    cloudx1 = width;
  }
  image(marioclouds, cloudx1, cloudy);
  
  if(cloudx2+100<0){
    cloudx2 = width;
  }
  image(marioclouds, cloudx2, cloudy);
  
  textSize(35);
  text("VICTORY!",630,80);
  
  stroke(0);
  strokeWeight(5);
  fill(255);
  rect(490,530,300,60);
  rect(490,620,300,60);
  
  fill(0);
  textSize(25);
  text("Back to Menu",640, 557);
  text("Play Again", 640, 647);
  
  if(790>mouseX && mouseX>490 && 530<mouseY && mouseY<590){
    fill(216,214,214);
    rect(490,530,300,60);
    fill(0);
    text("Back to Menu",640, 557);
    if(mousePressed){
      init();
      state=START_STATE;
    }
  }
  if(790>mouseX && mouseX>490 && 620<mouseY && mouseY<680){
    fill(216,214,214);
    rect(490,620,300,60);
    fill(0);
    text("Play Again", 640, 647);
    if(mousePressed){
      init();
      state=PLAY_STATE;
    }
  }
      
}

void init() {
  mariox = 590;
  marioy = 560;
  accy1 = 0.2;
  accy2 = 0.2;
  score = 0;
  cloudx1 = 850;
  cloudx2 = 400;
  cloudy = 10;
  lumbax = 1300;
  lumbay = 560;
  score = 0;
  bowserx = 1000;
  bowsery = 425;
  bossscore = 1;
  speedy3 = 1;
  speedx3 = 1;
  accy3 = 0.5;
  ballx1 = mariox+20;
  bally1 = marioy+50;
  ballx2 = mariox+20;
  bally2 = marioy+50;
  ballx3 = mariox+20;
  bally3 = marioy+50;
  fireball1 = false;
  fireball2 = false;
  fireball3 = false;
  bowserhp = 10;
  strokeWeight(1);
  stroke(0);
  textSize(20);
  
}
