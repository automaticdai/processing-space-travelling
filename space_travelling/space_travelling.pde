Star[] stars;

float speed = 0.05; // base_speed
float speed_p = speed; // actual speed
float x = 0;
PImage img;

float phase_shift = PI/2*3;


void setup() {

  fullScreen(P2D);
  //size(1920,1080);
  
  noCursor();
  frameRate(25); // limit the fps to have a nice light trail
  
  // load the background image
  img = loadImage("blue-nebula-wallpaper-new.jpg");
  
  // initilize stars
  stars = new Star[200];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }  
}

void draw() {
  background(0);
  
  // wavelength red shift
  colorMode(HSB, 360, 100, 100);
  tint(sin(x+phase_shift)*50+300, 100, 90-10*sin(x+phase_shift));
  
  // load background
  image(img, 0, 0);
  
  // move the center to the screen center
  translate(width/2, height/2);
  
  // speed follows a sin wave
  speed_p = (sin(x+phase_shift) + 1.01) / 1.5 * speed;
  x = x + 0.005;
  
  // update stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  }  
}
