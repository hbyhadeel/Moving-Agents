Agent[] agents = new Agent[1000];

void setup() {
  size(500, 500, P3D);
  background(#FBE7E6);

  for (int i = 0; i < agents.length; i++) {
    agents[i] = new Agent();
  }

  //noStroke();
  //ellipse(width/2, height/2, 400, 400);
}

void draw() {


  //for (int i = 0; i < agents.length; i++) {
  //  agents[i].updateLines();
  //}

  for (int i = 0; i < agents.length; i++) {
    agents[i].updateCircle();
  }
}

class Agent {
  float x, y, z;
  int r, c;

  float x2, y2;
  float radius, theta;

  Agent() {
    x = random(width);
    y = random(height - 10, height);
    z = 0;

    radius = 200;
    x2 = width/2 + cos(random(TWO_PI)) * radius;
    y2 = height/2 + sin(random(TWO_PI)) * radius;
  }

  void updateLines() {
    point(x, y, z);

    c = int(random(3));

    if (z < 0 && z > -800) {
      if (c == 0) {
        stroke(117, 137, 250);
      } else if (c == 1) {
        stroke(113, 171, 199);
      } else if (c == 2) {
        stroke(16, 29, 97);
      }
    } else if (z < -800) {
      if (c == 0) {
        stroke(#FF91C3);
      } else if (c == 1) {
        stroke(#FF786A);
      } else if (c == 2) {
        stroke(#B37BFF);
      }
    }

    r = int(random(4));

    if (r == 0) {
      x++;
      y++;
    } else if (r == 1) {
      x--;
      y--;
    } else if (r == 2) {
      x++;
      y--;
    } else {
      x--;
      y++;
    }

    z-=2;
  }

  void updateCircle() {
    point(x2, y2, z);

    c = int(random(3));

    if (z < 0 && z > -800) {
      if (c == 0) {
        stroke(117, 137, 250);
      } else if (c == 1) {
        stroke(113, 171, 199);
      } else if (c == 2) {
        stroke(16, 29, 97);
      }
    } else if (z < -800) {
      if (c == 0) {
        stroke(#FF91C3);
      } else if (c == 1) {
        stroke(#FF786A);
      } else if (c == 2) {
        stroke(#B37BFF);
      }
    }

    r = int(random(4));

    if (r == 0) {
      x2++;
      y2++;
    } else if (r == 1) {
      x2--;
      y2--;
    } else if (r == 2) {
      x2++;
      y2--;
    } else {
      x2--;
      y2++;
    }

    z--;
  }
}