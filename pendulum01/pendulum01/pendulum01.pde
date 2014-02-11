int c;
int w, h;

void setup() {
  w = displayWidth;
  h = displayHeight;
  background(0);
  size(w, 800);
  smooth();
}

void draw() {
//  fill(250);
//  rect(0, 0, displayWidth, displayHeight);
  translate(width/2, height/2);

  for (float i=0; i<360; i += 0.9) {
    pushMatrix();
    rotate(radians(i));
    translate(150, 50);
    rotate(radians(i*3));
    scale(map(sin(radians(i*9)), -1, 1, .5, 1), map(sin(radians(i*3)), -1, 1, .5, 1));
    stroke(20, 20, 10+i);

    drawEllipse(0, 50);
    popMatrix();

    if (c>200) {
      c = c*-1;
    }
    else {    
      c = c+1;
    }
  }
}

void drawEllipse(int posX, int posY) {
  rotate(2-c);
  noFill();
  stroke(200, 40*c, 10+c, 10);
  line(10, 80, 5+c, 20);
  rotate(5*c);
  stroke(250*c, 150+c, 10+c, 10);
  line(90, 100, 10, 10);
  stroke(50*c, 50+c, 150+c, 5);
  line(150, 50, 50, 50);

}

