float c=0;
int bgColor;
float myX, myY;
float myRandom;
float posX, posY, posNewX, posNewY;

void setup() {
  size(800, 600);
  frameRate(90);
  colorMode(HSB, 100);
  background(100);
  posX = width/2;
  posY = height/2;
}

void draw() {
  noStroke();
fill(100, 1);
rect(0, 0, width, height);
  // Check if initial mouse is on the corner.
  if (pmouseX == 0 && pmouseY == 0) {
    pmouseX = mouseX;
    pmouseY = mouseY;
  }

  myRandom = random(50);
  bgColor = 100;
  myX = pmouseX;
  myY = pmouseY;
  c = noise(5);

  //Line Random Positin
  posX = posX + random(-10, 10);
  posY = posY + random(-10, 10);

  posNewX = posX + random(-10, 10);
  posNewY = posY + random(-10, 10);

// DRAW LINE
  stroke(10+myRandom);
  strokeWeight(abs(c));
// line(posX, posY, posNewX, posNewY);
 line(posX, posY, posNewX, posNewY);

  /// End Line Random

  //  line(myX+random(10), myY+ random(10), myX+random(10), myY+random(10));
  //  line(myX, myY, mouseX, mouseY);
  //  line(myRandom, myRandom, myRandom, myRandom);
  //  stroke(200, posY*5, posNewX*2);

// TEST IF IS INSID SCREEN
if (posX < 0 || posX > width){
posX = width/2;
}

// INTERACTION
  if (mousePressed == true) {
    //    line(pmouseX, pmouseY, mouseX, mouseY);
    fill(5, 100, mouseY/3, 50);
    ellipse(mouseX, mouseY, c, c);
  }

  if (keyPressed == true) {
    background(bgColor);
  }
}



