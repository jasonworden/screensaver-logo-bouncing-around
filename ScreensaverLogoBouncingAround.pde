/**
 * Logo bouncing around screen like the DVD bouncing logo "screensaver"
 * Based on the processing example "Circle Collision with Swapping Velocities"
 * by Ira Greenberg, which was based on Keith Peter's ActionScript animation
 * "Making Things Move!"
 */

int DRAWING_MODE = CORNER;
int BACKGROUND_COLOR = 0;
 
PImage logoImage;
ScreensaverLogo logo;

void setup() {
  size(640, 480);
  
  rectMode(DRAWING_MODE);
  imageMode(DRAWING_MODE);
  
  logoImage = loadImage("assets/dvd-logo-white.png");
  logo = new ScreensaverLogo(logoImage);
  
  tint(200, 0, 200);
}

void draw() {
  background(BACKGROUND_COLOR);

  logo.update();
  logo.display();
  logo.checkBoundaryCollision();
}