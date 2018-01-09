
PImage img;

void setup() {
  size(1000,800);
  img = loadImage("shadesofindigo.jpg");

}
 
void draw() {
  loadPixels();
  image(img, 0, 0, 1000, 800);
  
}
 
void drawCircle(float x, float y, float radius) {
  stroke(random(255), random(255), random(255));
  noFill();
  ellipse(x, y, radius, radius);
  if(radius > 2) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
 
  }
}