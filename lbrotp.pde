float radius = 150;
float fontHeight = 20;

void annotate(String line1, String line2, float th) {
  float baseX = radius * cos(th);
  float x = radius * cos(th);
  float y = radius * sin(th);
  
  boolean hAlign = abs(x) < 0.1;
  
  if (x > 0.9) {
    x -= 0.5 * fontHeight;
  }
  
  if (x < -0.9) {
    x -= textWidth(line2);
    x += 0.5 * fontHeight;
  }
  
  if (hAlign) {
    x = baseX - (0.5 * textWidth(line1));
  }
  
  if (y < -0.9) {
    y -= 0.5 * fontHeight;
  }
  
  text(line1, x, y);
  y += fontHeight;

  if (hAlign) {
    x = baseX - (0.5 * textWidth(line2));
  }
  
  text(line2, x, y);
}

void setup() {
  size(500, 500);
  background(255);
  translate(width/2, height/2);
  noFill();
  float weight = 10;
  strokeWeight(weight);
  ellipseMode(RADIUS);
  
  ellipse(0, 0, radius, radius);
  radius -= weight;
  
  beginShape();
  for (float th = 1.5 * PI; th <= 10 * PI; th += 4 * PI/5) {
    vertex(radius * cos(th), radius * sin(th));    
  }
  endShape();

  fill(0);
  textSize(fontHeight);
  radius += fontHeight * 2;

//  line(-100, 0, 100, 0);

  annotate("Raphael", "(east)", 1.5 * PI);
  annotate("Michael", "(south)", 0);
  annotate("Gabriel", "(west)", HALF_PI);
  annotate("Uriel", "(north)", PI);

  saveFrame("lbrotp.png");

  noLoop();
}
