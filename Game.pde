Sprite stickMan;
  
boolean animateLeft = false;
boolean animateRight = false;

String[] scenes = new String[]{"purpleRain", "house"};
int index = 0;

float stickWidth;
float stickHeight;

PurpleRain purpleRain;
House house;
  
void setup(){
  size(1280, 720);
  
  stickMan = new Sprite(.3);
  
  purpleRain = new PurpleRain();
  house = new House();
  
  stickWidth = stickMan.getSize()[0];
  stickHeight = stickMan.getSize()[1];
}

void keyPressed(){

  if(key == CODED){
    if (keyCode == LEFT){
      stickMan.goingLeft(true);
      animateLeft = true;
      stickMan.inMotion(true);
    }
    
    else if (keyCode == RIGHT){
      stickMan.goingLeft(false);
      animateRight = true;
      stickMan.inMotion(true);
    }
    else if (keyCode == UP){
      stickMan.setJumping(true); 
    }
    else if (keyCode == SHIFT){
      stickMan.setSpeed(.6);
    }
    else if (keyCode == ESC){
      exit();
    }
  }
  else if (key == 'e' || key == 'E'){
    purpleRain.trigger();
  }
  else if (key == 'w' || key == 'W'){
    stickMan.setJumping(true);
  }
  else if (key == 'a' || key == 'A'){
    stickMan.goingLeft(true);
    animateLeft = true;
    stickMan.inMotion(true); 
  }
  else if (key == 'd' || key == 'D'){    
    stickMan.goingLeft(false);
    animateRight = true;
    stickMan.inMotion(true);
  }
  
  
}

void keyReleased(){
  
  if (key == CODED){
    if (keyCode == LEFT){
      if(!animateRight)
        stickMan.inMotion(false);
      stickMan.goingLeft(false);
      animateLeft = false;
    }
    
    else if (keyCode == RIGHT){
      if(!animateLeft)
        stickMan.inMotion(false);
      animateRight = false;
    }
    else if (keyCode == SHIFT){
      stickMan.setSpeed(.3);
    }
  }
  else if (key == 'a' || key == 'A'){
    if(!animateRight)
        stickMan.inMotion(false);
      stickMan.goingLeft(false);
      animateLeft = false;
  }
  else if (key == 'd' || key == 'D'){    
    if(!animateLeft)
        stickMan.inMotion(false);
      animateRight = false;
  }
  
}


void draw(){
  
  // Checks if the stickMan walks through the wall to change scene
  if (!(stickMan.getX() <= width + stickWidth) && index < scenes.length - 1){
      index ++;
      stickMan.returnLeft();
  }
  else if(stickMan.getX() >= width - stickWidth && index == scenes.length-1){
    stickMan.returnRight();
  }
  else if((stickMan.getX() <= 0 - stickWidth) && index > 0){
    index --;
    stickMan.returnRight();
  }
  else if(stickMan.getX() <= 0 + stickWidth/2 && index == 0){
    stickMan.returnLeft();
  }
    
    
    
    
  // Checks which scene should be displayed
  if(scenes[index].equals("purpleRain")){
    purpleRain.setPlayerLocation(stickMan.getX(), stickMan.getY());
    purpleRain.pRain();
  }
  else if(scenes[index].equals("house")){
    house.show();
  }
 
  stickMan.show();

  if(animateLeft)
    stickMan.moveLeft();
  else if (animateRight)
    stickMan.moveRight();
  
}
