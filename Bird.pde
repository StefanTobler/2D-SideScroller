
static enum Speed {SLOW, MODERATE, FAST};

class Bird{
  
  PImage[] flying = new PImage[4];
  PImage still = loadImage("Assets/bird/Bird still.png");
    
  private float x;
  private float y;
  private float endX;
  private float endY;
  
  private float xDist;
  private float yDist;
  
  private float index = 0;
  
  private Speed speed;
 
//----------------------------------------------- 

// Constructor
// Initalizes the bird without any points 
  Bird(){
    
    this.x = 0;
    this.y = 0;
    
    for(int i = 1; i <= 3; i ++){
      
      flying[i-1] = loadImage("Assets/bird/Bird " + i + ".png");
      
    }
      
    flying[3] = loadImage("Assets/bird/Bird 2.png");
    
  }

// Constructor
// @param float startX, float startY, float endX, float endY, Speed speed
// Initalizes the bird with a start and end coords as well as a speed.
  Bird(float startX, float startY, float endX, float endY, Speed speed){
    
    for(int i = 1; i <= 3; i ++){
      
      flying[i-1] = loadImage("Assets/bird/Bird " + i + ".png");
      
    }
      
    flying[3] = loadImage("Assets/bird/Bird 2.png");
    
    x = startX;
    y = startY;
    this.endX = endX;
    this.endY = endY;
    
    xDist = endX - x;
    yDist = endY - y;
    
    this.speed = speed;
  }
  
//----------------------------------------------- 

// flyTo(float endX, float endY)
// @param float endX, float endY
// sets where the bird should fly to.
  void flyTo(float endX, float endY){
    
    this.endX = endX;
    this.endY = endY;
    
    xDist = endX - x;
    yDist = endY - y;
    
  }
  
//-----------------------------------------------

// update()
// Updates the birds position based on where it is flying to
  void update(){
    if (abs(x - endX) > .5 || abs(y - endY) > .5){
      switch(speed){
        
        case SLOW:
          y += .001 * (yDist);
          x += .001 * (xDist);
          index += .1;
          break;
        case MODERATE:
          y += .002 * (yDist);
          x += .002 * (xDist);
          index += .15;
          break;
        case FAST:
          y += .005 * (yDist);
          x += .005 * (xDist);
          index += .25;
          break; 
        
      }
    }
    
  }
  
//-----------------------------------------------

// show()
// shows either the birds animation on the screen or the bird standing
  void show(){
    imageMode(CENTER);
    
    if (abs(x - endX) > .5 && abs(y - endY) > .5){
      
      image(flying[floor(index % flying.length)], x, y);
      
    }
    else{
      
      image(still, x, y - still.height/2);
      
    }
    
  }
  
//-----------------------------------------------

// isStill()
// Returns a boolean whether the bird is still or not
  boolean isStill(){
    return abs(x - endX) < .5 && abs(y - endY) < .5;
  }
  
//-----------------------------------------------

// setSpeed(Speed speed)
// @param Speed speed
// Changes the birds speed

  void setSpeed(Speed speed){
    
    this.speed = speed;
    
  }
}
