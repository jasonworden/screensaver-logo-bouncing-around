class ScreensaverLogo {
  PVector position;
  PVector velocity;
  PImage logo;

  float w;
  float h;
  
  //chagnes color each time it hits a boundary
  color[] colors = {
    color(200, 0, 200),
    color(0, 200, 200),
    color(200, 200, 0),
    color(240, 140, 0)
  };
  int colorIndex = 0;

  ScreensaverLogo(PImage _logo, float v) {
    logo = _logo;
    position = new PVector(0, 0);
    velocity = new PVector(v, v);
    w = logo.width;
    h = logo.height;
  }
  
  ScreensaverLogo(PImage _logo) {
    logo = _logo;
    position = new PVector(0, 0);
    
    float v = 0.9; //DEFAULT VELOCITY
    velocity = new PVector(v, v);
    
    w = logo.width;
    h = logo.height;
  }

  void update() {
    position.add(velocity);
  }

  void checkBoundaryCollision() {
    boolean hitBoundary = false;
    if (position.x > width-w) {
      hitBoundary = true;
      position.x = width-w;
      velocity.x *= -1;
    } 
    else if (position.x < 0) {
      hitBoundary = true;
      position.x = 0;
      velocity.x *= -1;
    } 
    else if (position.y > height-h) {
      hitBoundary = true;
      position.y = height-h;
      velocity.y *= -1;
    } 
    else if (position.y < 0) {
      hitBoundary = true;
      position.y = 0;
      velocity.y *= -1;
    }
    
    if(hitBoundary) {
      colorIndex = ++colorIndex % colors.length;
      tint(colors[colorIndex]);
    }
  }

  void display() {
    ////testing with rectangle:
    //noStroke();
    //fill(200, 200, 200, 100);
    //rect(position.x, position.y, w, h);
    
    image(logo, position.x, position.y);
  }
}