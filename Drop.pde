
class Drop{
  
  private float x = random(0, width);
  private float y = random(-400, height);
  private float z = random(0, 20);
  private float yspeed = map(z, 0, 20, 2, 6);
  private float gravity = map(z, 0, 20,.01, .05);
  // len is mapped to a value between 10 and 20 depending on the depth it has (z)
  private float len = map(z, 0, 20, 10, 20);
  // thicknessness is mapped to a value between 1 and 1.5 depending on the depth it has (z)
  private float thickness = map(z, 0, 20, .5, 1.5);
  // Patricle array for when the rain drops hit the ground
  private Particle[] ps = new Particle[0];
  
//-----------------------------------------------

// fall()
// updates the location as if gravity were acting on the raindrops pulling them down
  void fall(){
    y += yspeed;
    yspeed += gravity;
    
    if(y > height){
      
      kill();
      
    }
  }
  
//-----------------------------------------------

// show()
// To be implemented in the draw function show() adds the raindrop to the display
  void show(){
    
    strokeWeight(thickness);
    stroke(138, 43, 226);    
    line(x,y,x, y+len);
     
  }
  
//-----------------------------------------------

// splash()
// Creates a new array of splash particles for when the raindrop hits the ground
  void splash(){
    
    int n = floor(random(3,6));
    
    ps = new Particle[n]; 
    
    for(int i = 0; i < n; i++){
      if(y > height)
        y = height-1;
      
      ps[i] = new Particle(x, y, thickness);
      
    }
    
  }
//-----------------------------------------------

// kill()
// removes the drop and respawns it. this is to be used when drops hit objects that are not the ground.
  void kill(){
    
    if(thickness > 1.25){
        
        splash();
        
    }
    
    x = random(0, width);
    y = random(-200, -100);
    z = random(0, 20);
    yspeed = map(z, 0, 20, 6, 12);
    len = map(z, 0, 20, 10, 20);
    thickness = map(z, 0, 20, 1, 1.5);

  }
  
//-----------------------------------------------  
//
//            GETTERS
//
//-----------------------------------------------  
  
// getX()
// Returns the x position of the drop
  float getX(){
    return this.x;
  }
  
// getY()
// Returns the y position of the drop
  float getY(){
    return this.y;
  }
  
// getThickness()
// Returns the thicknessness of a drop, ranges between 1 and 1.5
  float getThickness(){
    return this.thickness;
  }
  
}
