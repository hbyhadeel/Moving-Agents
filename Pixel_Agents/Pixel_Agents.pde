Agent[] agents = new Agent[1000];
int[] pix = new int[1000];
PImage img;
PImage leftHalf, topHalf;

int x, y;

void setup() {
  size(500, 500, P2D);
  noStroke();

  img = loadImage("image.jpg");
  image(img, 0, 0);
  for (int i = 0; i < agents.length; i++) {
    x = int(random(width));
    y = int(random(height));
    pix[i] = get(x, y);
    agents[i] = new Agent();
  }
  background(#FBE7E6);
  
}

void draw() {
  
  for (int i = 0; i < agents.length; i++) {
    agents[i].updateLines(pix[i]);
  }
  
  leftMirror();
  topMirror();
}

void leftMirror() {
  leftHalf = get(0, 0, width/2, height);
  translate(width, 0);
  scale(-1, 1);
  image(leftHalf, 0, 0);
}

void topMirror() {
  topHalf = get(0, 0, width, height/2);
  translate(0, height);
  scale(1, -1);
  image(topHalf, 0, 0);
}