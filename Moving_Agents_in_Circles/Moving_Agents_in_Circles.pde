ArrayList<Point> p = new ArrayList<Point>();
PImage leftHalf, topHalf;

void setup() {
  size(500, 500);
  background(255);

  p.add(new Point());
  
}

void draw() {
  
  p.get(0).display();
  p.get(0).update1();
  p.get(0).update2();
  
  //p.get(0).reachedBorder();
  p.get(0).reacherMirrorBorder();
  
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