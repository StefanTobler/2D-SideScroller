class PurpleRain{
 
  PFont newFont = createFont("Ariel", 10);
  
  private Drop[] drops;
  
  PImage umbrella = loadImage("Assets/Other/Umbrella.png");
  
  private float umX;
  private float umY;
  
  private Bird b;
  
  private float playerX;
  private float playerY;
  
  private boolean trigger = false;
   boolean light = false;
   int count = 0;

//-----------------------------------------------

// Constructor
// Initalizes all the drops (default 250) to be displayed
  PurpleRain(){
    
    textFont(newFont);   
    
    drops = new Drop[250];
    
    for(int i = 0; i < drops.length; i++){
      drops[i] = new Drop();
    }
    
    umbrella.resize(floor(umbrella.width * .21), floor(umbrella.height * .21));
    
    umX = width - umbrella.width/2 - 20;
    umY = height - umbrella.height/2;
    
    b = new Bird(0,0, umX, umY - umbrella.height/2, Speed.MODERATE);
  }
  
  
// Constructor
// Initalizes n drops to be displayed
  PurpleRain(int n){
    
    textFont(newFont);   
    
    drops = new Drop[n];
    
    for(int i = 0; i < drops.length; i++){
      drops[i] = new Drop();
    }
    
    umbrella.resize(floor(umbrella.width * .21), floor(umbrella.height * .21));
    
    umX = width - umbrella.width/2 - 20;
    umY = height - umbrella.height/2;
    
    b = new Bird(0,0, umX, umY - umbrella.height/2, Speed.MODERATE);
  }
  
//-----------------------------------------------

// pRain()
// Adds all the drops to the screen and calls their update funtion
  void pRain(){
    background(230,230,250);
   
    image(umbrella, width - umbrella.width - 20, height - umbrella.height);
    
    for(Drop d : drops){  
      d.fall();
      d.show();
      
      if(dist(umX,umY,d.getX(),d.getY()) < 77 & d.getThickness() > 1.25 && count < 32){
        d.kill();
      }
      
      if(d.ps.length > 0){
        for(Particle p : d.ps){
          p.update();
          p.show();
        }
        
      }
      
    }
    
    
    if(dist(umX, umY, playerX, playerY) < 115 && !trigger){
      textAlign(CENTER, CENTER);
      fill(127);
      textSize(12);
      text("Press 'e' to interact", width - umbrella.width/2 - 20, height - umbrella.height - 10);
    }
    
    
    if(trigger){
      b.show();
      b.update();
    }
    
    if(light && b.isStill()){
      
      lightning();
      
    }
    
  }
  
//-----------------------------------------------

// setPlayerLocation(float x, float y)
// This passes through player coordinates so that the player can interact with objects in the Purple Rain scene
  void setPlayerLocation(float x, float y){
    
    playerX = x;
    playerY = y;
    
  }
  
//-----------------------------------------------

// trigger()
// turns on trigger if player in distance.
  void trigger(){
    
    if(dist(umX, umY, playerX, playerY) < 115){
      trigger = true;
      
      if (b.isStill()){
        light = true;
        b.setSpeed(Speed.FAST);
        b.flyTo(width + 10, 100);
      }
      
    }
    
  }
  
//-----------------------------------------------

// ligntning()
// triggers a lightning event
  void lightning(){
    
    count ++;
    stroke(255);
    strokeWeight(3);
    
    if(count < 15){
      
      line(width/1.75, 0, width/1.5, height/6);
      
    }
    else if (count < 10){
      
      line(width/1.75, 0, width/1.5, height/6);
      
      line(width/1.5, height/6, width/1.6, height/4);
      line(width/1.6, height/4, width/1.58, height/3.5);
      line(width/1.5, height/6, width/1.40, height/3.3);
      
    }
    else if (count < 15){
      
      line(width/1.75, 0, width/1.5, height/6);
      
      line(width/1.5, height/6, width/1.6, height/4);
      line(width/1.6, height/4, width/1.58, height/3.5);
      line(width/1.5, height/6, width/1.40, height/3.3);
      
      line(width/1.40, height/3.3, width/1.2, height/3);
      
    }
    else if (count < 20){
      
      line(width/1.75, 0, width/1.5, height/6);
      
      line(width/1.5, height/6, width/1.6, height/4);
      line(width/1.6, height/4, width/1.58, height/3.5);
      line(width/1.5, height/6, width/1.40, height/3.3);
      
      line(width/1.40, height/3.3, width/1.2, height/3);
      
      line(width/1.2, height/3, width/1.15, height/2.15);
      line(width/1.2, height/3, width/1.1, height/2);
      line(width/1.2, height/3, width/1.3, height/2.2);
      
    }
    else if (count < 25){
      
      line(width/1.75, 0, width/1.5, height/6);
      
      line(width/1.5, height/6, width/1.6, height/4);
      line(width/1.6, height/4, width/1.58, height/3.5);
      line(width/1.5, height/6, width/1.40, height/3.3);
      
      line(width/1.40, height/3.3, width/1.2, height/3);
      
      line(width/1.2, height/3, width/1.15, height/2.15);
      line(width/1.2, height/3, width/1.1, height/2);
      line(width/1.2, height/3, width/1.3, height/2.2);
      
      line(width/1.15, height/2.15, width/1.17, height/1.7);
      line(width/1.1, height/2, width/1.12, height/1.7);
      
    }
    else if (count < 30){
      
      line(width/1.75, 0, width/1.5, height/6);
      
      line(width/1.5, height/6, width/1.6, height/4);
      line(width/1.6, height/4, width/1.58, height/3.5);
      line(width/1.5, height/6, width/1.40, height/3.3);
      
      line(width/1.40, height/3.3, width/1.2, height/3);
      
      line(width/1.2, height/3, width/1.15, height/2.15);
      line(width/1.2, height/3, width/1.1, height/2);
      line(width/1.2, height/3, width/1.3, height/2.2);
      
      line(width/1.15, height/2.15, width/1.17, height/1.7);
      line(width/1.1, height/2, width/1.12, height/1.7);
      
      line(width/1.17, height/1.7, umX, umY - umbrella.height/2);
      
    }
    else if(count < 35){
      
      background(255, 255 - (35 - count) * 10);
      
    }
    else{
      umbrella = loadImage("Assets/Other/Umbrella Struck.png");
      
      umbrella.resize(floor(umbrella.width * .21), floor(umbrella.height * .21));

      
      light = false;
    }
    
    
    
  }

}
