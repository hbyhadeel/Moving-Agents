class Point {
  PVector pos;
  PVector newPos;
  float x, y;
  float angle;
  int r, stepSize;
  int radius;
  boolean a = false;
  float r2;
  Point() {
    pos = new PVector(width/2, height/2);
    newPos = new PVector(width/2, height/2);
    angle = 0;
    stepSize = 3;
    radius = stepSize * 5;
    r2 = random(1);
  }

  void display() {
    stroke(0, 50);
    strokeWeight(stepSize);
    if (a) {
      pos.x = (newPos.x - radius) + cos(radians(angle)) * radius;
      pos.y = newPos.y + sin(radians(angle)) * radius;
      point(pos.x, pos.y);
    } else {
      point(pos.x, pos.y);
    }
  }

  void update1() {
    if (a) {
      if (r2 < 0.5) {
        angle += stepSize*1.8;
      } else {
        angle -= stepSize*1.8;
      }
    }
    
    if (angle >= 181
    || angle <= -181){
      a = false;
      newPos.set(pos);
    }
  }

  void update2() {
    if (!a) {

      if (frameCount % 3 == 0) {
        r = int(random(4));
      }

      if (r == 0) { 
        pos.x+= cos(radians(180)) * stepSize;
      } else if (r == 1) {
        pos.y+= sin(radians(-90)) * stepSize;
      } else if (r == 2) {
        pos.x-= cos(radians(-180)) * stepSize;
      } else if (r == 3) {
        pos.y+= sin(radians(90)) * stepSize;
      } 
      
      if (frameCount % 60 == 0) {
        a = true;
        angle = 0;
        r2 = random(1);
      }
    }
  }
  void reachedBorder() {
    if (pos.x < 0) {
      pos.x = width;
    } else if (pos.x > width) {
      pos.x = 0;
    }

    if (pos.y < 0) {
      pos.y = height;
    } else if (pos.y > height) {
      pos.y = 0;
    }
  }
  
  void reacherMirrorBorder() {
    if (pos.x < 0) {
    pos.x = width/2;
  } else if (pos.x > width/2) {
    pos.x = 0;
  }
  
  if (pos.y < 0) {
    pos.y = height/2;
  } else if (pos.y > height/2) {
    pos.y = 0;
  }
  }
}