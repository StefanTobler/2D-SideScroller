class Particle{
  private float x;
  private float y;
  private float yVelocity = random(1, 1.5);
  private float xVelocity = random(-1, 1);
  private float alpha = random(170, 255);
  private float size;
  private float gravity;
  
//-----------------------------------------------  
  
  // Constructor
  // @param float x, float y,  float size
  // x and y are the coords for where the splash should originate from and size is the size of the splash.
  Particle(float x, float y, float size){
    
    this.size = size;
    this.x = x;
    this.y = y;
    
    gravity = map(size, 1.25, 1.5, .05, .1);
  }
  
//-----------------------------------------------

  // show()
  // adds the splash particle to the screen
  void show(){
    
    stroke(138, 43, 226, alpha);
    ellipse(x, y, size, size);
    
  }
  
//-----------------------------------------------

  // update()
  // updates the particles position based on its velocities and gravity
  void update(){
    
    x += xVelocity;
    yVelocity -= gravity;
    y -= yVelocity;
    if(y > height + size){
      yVelocity = 0;
    }
    
  }
  
}
