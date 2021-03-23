class Star{
  // parameters:
  float Z_MAX = 3;
  float Z_MIN = 0.001;
  float RADIUS_MAX = 10;
  float RADIUS_MIN = 0.5;
  
  // variables
  float x = random(-width/2, width/2);
  float y = random(-height/2, height/2);
  float z = random(Z_MIN, Z_MAX);
  float r;

  void update() {
    z = z - speed_p;
    
    if (z < Z_MIN) {
      x = random(-width/2, width/2);
      y = random(-height/2, height/2);
      z = random(Z_MIN, Z_MAX);   // respawn a new star
    }
  }
  
  void show() {
    r = map(z, Z_MIN, Z_MAX, RADIUS_MAX, RADIUS_MIN);
    float f = map(z, Z_MIN, Z_MAX, 255, 100); // the further the lighter
    
    // star
    fill(f);
    noStroke();
    ellipse(x/z, y/z, r, r);
    
    // halo effect
    fill(f, 80);
    ellipse(x/z, y/z, r*1.5, r*1.5);
    
    // the star light trail (optional):
    stroke(200);
    strokeWeight(r);
    
    float x_trail = x/(z+speed_p);
    float y_trail = y/(z+speed_p);
    
    if (abs(x) < width/2 && abs(y) < height/2 && abs(x_trail) < width/2 && abs(y_trail) < height/2) {
      line(x/z, y/z, x_trail, y_trail);
    }
  }
}
