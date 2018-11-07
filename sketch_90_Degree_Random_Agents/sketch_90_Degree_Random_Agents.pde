float x, y;
int stepSize;
float angle;
int r;

PImage leftHalf, topHalf;

void setup() {
  size(500, 500);
  background(255);

  x = width/2;
  y = height/2;
  stepSize = 3;
}

void draw() {
  strokeWeight(stepSize);
  point(x, y);
  
  if (frameCount % 3 == 0) {
    r = int(random(4));
  }

  if (r == 0) { 
    x+= cos(radians(180)) * stepSize;
  } else if (r == 1) {
    y+= sin(radians(-90)) * stepSize;
  } else if (r == 2) {
    x-= cos(radians(-180)) * stepSize;
  } else if (r == 3) {
    y+= sin(radians(90)) * stepSize;
  }
  
  // if left and top mirrors are active
  if (x < 0) {
    x = width/2;
  } else if (x > width/2) {
    x = 0;
  }
  
  if (y < 0) {
    y = height/2;
  } else if (y > height/2) {
    y = 0;
  }
  
  //else
  //if (x < 0) {
  //  x = width;
  //} else if (x > width) {
  //  x = 0;
  //}
  
  //if (y < 0) {
  //  y = height;
  //} else if (y > height) {
  //  y = 0;
  //}
  
  leftMirror();
  topMirror();
  
}

void leftMirror() {
  leftHalf = get(0, 0, width/2, height);
  translate(width, 0);
  scale(-1, 1);
  image(leftHalf, 0, 0, width/2, height);
}

void topMirror() {
  topHalf = get(0, 0, width, height/2);
  translate(0, height);
  scale(1, -1);
  image(topHalf, 0, 0, width, height/2);
}