import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Big_Box extends PApplet {


int W,H,PX,PY;
 
public void setup() {
  
  W=1000;
  H=1000;
 
  PX=100;
  PY=100;
 
  size(W,H);
}
 

public void init() {
 
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
 
public void draw() {
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
public void keyPressed() {
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Big_Box" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
