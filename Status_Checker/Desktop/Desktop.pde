

import java.awt.*;
import java.awt.event.*;
import java.awt.event.KeyEvent;
 
Robot robot;




int W, H, PX, PY;

boolean inGame = false;

int timer;
int countdownlength = 60;
int countdown = countdownlength;
int timerx;
int timery;

PImage shot;

void setup() {
  
  
  try { 
    robot = new Robot();
    robot.setAutoDelay(0);
  } 
  catch (Exception e) {
    e.printStackTrace();
  }
  
  
  timer = 0;

  W=500;
  H=300;

  PX=0;
  PY=100;

  size(W, H);
}


void init() {



  // trick to make it possible to change the frame properties
  frame.removeNotify(); 

  // comment this out to turn OS chrome back on
  frame.setUndecorated(true); 

  // comment this out to not have the window "float"
  frame.setAlwaysOnTop(true); 

  frame.setResizable(true);  
  frame.addNotify(); 

  // making sure to call PApplet.init() so that things 
  // get  properly set up.
  super.init();
}

void draw() {
  background(0);

  timer += 1;

  // resize and set initial location a few frames after sketch start. 
  // our window will now be tiny and located at position PX,PY.

  if (frameCount==5) {
    frame.resize(W, H);
    frame.setLocation(PX, PY);
  }

  // draw window outline

  if (timer == 1) {
    W=500;
    H=300;
    PY=285;
    
    frame.resize(W, H);
    frame.setLocation(PX, PY);
  }

  if (timer == 3) {
    open("C:/Users/Andrew/Documents/takeShot.vbs");
  }
  if (timer == 150) {
    shot = loadImage("Shot.png");
  }
  if (timer >= 150 && timer < 10000) {
    image(shot, 0, 0, W, H);
  }
  if (timer > 1 && timer <= 200) {
    stroke(255, 255, 0);
    strokeWeight(15);
    noFill();
    rect(0, 0, W, H);
    if (timer >= 150) {
      strokeWeight(3);
      ellipse(W/2, H/2+6, 10, 10);
    }
  }
  if (timer == 200) {
    if (red(get(W/2, H/2+6)) == green(get(W/2, H/2+6)) && red(get(W/2, H/2+6)) == blue(get(W/2, H/2+6)) && red(get(W/2, H/2+6)) == 139) {
      inGame = true;
    } else {
      inGame = false;
    }
  }
  if (timer >= 200 && timer < 10000) {
    if (inGame) {
      stroke(0, 255, 0);
    } else {
      stroke(255, 0, 0);
    }
    strokeWeight(15);
    noFill();
    rect(0, 0, W, H);
    if (timer >= 150) {
      strokeWeight(3);
      ellipse(W/2, H/2+6, 10, 10);
    }
  }
  if(timer == 250){
    if (inGame) {
      timer = 10000;
    }
  }
  if(timer == 252){
    robot.keyPress(KeyEvent.VK_E);
    robot.keyRelease(KeyEvent.VK_E);
  }
  
  if(timer == 260){
    mouseMoveAndClick(800,650);
  }
  
  if(timer == 380){
    mouseMoveAndClick(600,750);
  }
  
  if(timer == 1280){
    robot.keyPress(KeyEvent.VK_E);
    robot.keyRelease(KeyEvent.VK_E);
  }
  
  if(timer == 1340){
    mouseMove(800,650);
  }
  
  if(timer == 1500){
    timer = 0;
  }
  
  
  
  
  
  
  
  
  if(timer == 10000){
    W = 1600;
    H = 900;
    PY = 0;
    
    frame.resize(W, H);
    frame.setLocation(PX, PY);
    
    countdown = countdownlength;
    timerx = W/2;
    timery = H/2;
  }
  
  if(timer >= 10000){
    textSize(140);
    textAlign(CENTER); 
    text(countdown,timerx,timery);
  }
  
  if(timer > 10001+round(frameRate)){
    countdown -= 1;
    
    timer = 10001;
    if(countdown <= 0){
      timer = 0;
    }
    
    if(random(4)<1){
      timerx = round(random(W-200)+100);
      timery = round(random(H-200)+100);
    }
    
  }
  
  
}

// the cursor keys may be used to move the window around
void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) frame.setLocation(
    frame.getLocation().x-10, 
    frame.getLocation().y);
    if (keyCode==RIGHT) frame.setLocation(
    frame.getLocation().x+10, 
    frame.getLocation().y);
    if (keyCode==UP) frame.setLocation(
    frame.getLocation().x, 
    frame.getLocation().y-10);
    if (keyCode==DOWN) frame.setLocation(
    frame.getLocation().x, 
    frame.getLocation().y+10);
  }
  if (key == 't') {
    timer = 0;
  }
}


void mouseMove(int x, int y) {
  robot.mouseMove(x, y);
}
 
void mouseMoveAndClick(int x, int y) {
  robot.mouseMove(x, y);
  robot.mousePress(InputEvent.BUTTON1_DOWN_MASK);
  robot.mouseRelease(InputEvent.BUTTON1_DOWN_MASK);
  robot.waitForIdle();
}

