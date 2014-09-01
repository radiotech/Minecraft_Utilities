
int W,H,PX,PY;
 
void setup() {
  
  W=1000;
  H=1000;
 
  PX=100;
  PY=100;
 
  size(W,H);
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
 
  // resize and set initial location a few frames after sketch start. 
  // our window will now be tiny and located at position PX,PY.
 
  if(frameCount==5) {
    frame.resize(W,H);
    frame.setLocation(PX,PY);
  }
 
  // draw window outline
  
 
  
}
 
// the cursor keys may be used to move the window around
void keyPressed() {
  if(key==CODED) {
    if(keyCode==LEFT) frame.setLocation(
      frame.getLocation().x-50,
      frame.getLocation().y);
    if(keyCode==RIGHT) frame.setLocation(
      frame.getLocation().x+50,
      frame.getLocation().y);
    if(keyCode==UP) frame.setLocation(
      frame.getLocation().x,
      frame.getLocation().y-50);
    if(keyCode==DOWN) frame.setLocation(
      frame.getLocation().x,
      frame.getLocation().y+50);
  }  
}
