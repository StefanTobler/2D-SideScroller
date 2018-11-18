// This sprite class only works with the specific stickmanrun images in the folder.
// TODO: Find a sprite image pack whose images are all the same size, or compile stickmanrun folder into one image and cut each image out.

class Sprite{
  
  // Images 
  private PImage[] imgs = new PImage[12]; // Sprite animations facing right
  private PImage[] imgsf = new PImage[12]; // Sprite animations facing left
  private PImage stand = loadImage("Assets/stickmanrun/Standing.png"); // Sprite when not moving
  
  // The index of what sprite is too be displayed next, to be moduloed by imgs.length
  private float index = 0;
  
  private float x;
  private float y;
  private float speed;
  private float yVelocity;
  final float GRAVITY = .7;
  

  private float ground;
  private float[] size;
  
  
  private boolean left = false;
  private boolean motion = false;
  private boolean jumping = false;
  
//-----------------------------------------------  
  
// Constructor
// Adds all the sprite images to the local memory so that they can be displayed to the screen. Finds the max width of all
// the sprites so that if they are not the same size the animation will play more smoothly.
  Sprite(float speed){
    
    this.speed = speed;
    
    for(int i = 1; i <= 12; i++){
      
      imgs[i-1] = loadImage("Assets/stickmanrun/Layer " + i + ".png");
      imgsf[i-1] = loadImage("Assets/stickmanrun/Layer " + i + "f.png");
      
    }
    
    x = width/2; 
    y = height;
    
    size = new float[]{stand.width, stand.height};
    ground = y - stand.height/2;
      
  }
  
//-----------------------------------------------  

// moveLeft()
// Changes the sprite's x position by -3 as well as checks if the sprite is on the edge of the screen
  void moveLeft(){
    
    x -= map(speed, 0, 1, 0, 10);
    
    index += speed;
    
  }
  
//-----------------------------------------------  

// moveRight()
// Changes the sprites x position by 3 as well as checks if the sprite is on the edge of the screen
  void moveRight(){
    
    x += map(speed, 0, 1, 0, 10);
 
    index += speed;
    
  }
  
//-----------------------------------------------  

// returnLeft()
// Returns the sprite to the left side of the screen
  void returnLeft(){
    
    x = 0 + size[0]/2;
    
  }
  
  
// returnRight()
// Returns the sprite to the left side of the screen
  void returnRight(){
    
    x = width - size[0];
    
  }
 
//-----------------------------------------------

// jump()
// Changes the yVelocity of the sprite.

  void jump(){
    
    y -= yVelocity;
    yVelocity -= GRAVITY;
    
    if(y - stand.height/2 > ground){
      
      y = height;
      this.jumping = false;
    
    }
    
  }

//-----------------------------------------------  

// show()
// Displays the sprite at the current index to the screen.
  void show(){
    imageMode(CENTER);
    
    if(!motion)
      image(stand, x, y - imgs[floor(index % imgs.length)].height/2);
    else if(!left)
      image(imgs[floor(index % imgs.length)], x, y - imgs[floor(index % imgs.length)].height/2);
    else
      image(imgsf[floor(index % imgs.length)], x, y - imgs[floor(index % imgs.length)].height/2);
     
    if(jumping)
      jump();
    

    imageMode(CORNER);
  }
  
  
//-----------------------------------------------  
//
//            GETTERS
//
//-----------------------------------------------  
  
// getX()
// Returns the x position of the sprite
  float getX(){
    return this.x;
  }
  
// getY()
// Returns the y position of the sprite
  float getY(){
    return this.y;
  }
  
// getIndex()
// Returns the value of index
  float getIndex(){
    return this.index;
  }
  
// getSize()
// returns the size array of the sprite index 0 is the width index 1 is the height
  float[] getSize(){
    return this.size;
  }
  
  
//-----------------------------------------------  
//
//            Setters
//
//-----------------------------------------------  


// inMotion(boolean value)
// @param boolean value
// Sets the motion variable so that animations will play if the sprite is moving or make it stand still if it is not
  void inMotion(boolean value){
    this.motion = value;
  }
  
// goingLeft(boolean value)
// @param boolean value
// Sets the left variable so that when animations are being played it can be determined whether the player is going left or right.
  void goingLeft(boolean value){
    this.left = value;
  }
  
// setJumping(boolean value)
// @param boolean value
// Sets jump boolean to true or false to know if the character needs to be updated.
  void setJumping(boolean value){
    
   if(value && !this.jumping){
     yVelocity = 10;
   }
   
   this.jumping = value;
   
  }
  
// setSpeed(float speed)
// @param float speed
// Sets the speed of the sprite to that a sprint can be achieved.
  void setSpeed(float speed){
    this.speed = speed;
  }
  
}
