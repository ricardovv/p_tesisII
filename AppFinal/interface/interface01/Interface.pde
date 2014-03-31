void myNavs() {
  //grid();
  navBarTop();
  navBarLeft();
  textPressed();
}

void grid() {
  for (int i=0; i<w; i++) {
    stroke(220);
    line(gridSpacer *i, 0, gridSpacer *i, h );
    for (int j=0; j<h; j++) {
      line(0, gridSpacer *j, w, gridSpacer *j );
    }
  }
}//CLOSE GRID

void navBarTop() {
  noStroke();
  fill(250, 100, 0);
  rectMode(CORNER);
  rect(gridSpacer*2, 0, w-gridSpacer*2, gridSpacer*2);
}//CLOSE navBarTop

void navBarLeft() {
  //BG
  noStroke();
  fill(50, 50, 0);
  rectMode(CORNER);
  rect(0, 0, gridSpacer*2, h);

  //Button1
  buttonsLeft(0, 0, "C");
  //Button2
  buttonsLeft(0, 150, "H");
  //Button3
  buttonsLeft(0, 200, "B");
  //Button4
  buttonsLeft(0, h-40, "I");
}//CLOSE navBarLeft


void buttonsLeft(int _x, int _y, String _t) {
  fill(80);
  rect(0 + _x, 0 + _y, gridSpacer*2, gridSpacer*2);
  fill(200);
  textSize(20);
  textAlign(CENTER);
  text(_t, 20 + _x, 26+_y);
}

void panelTitles(String _title) {
  pushMatrix();
  fill(250, 200, 0);
  textSize(24);
  textAlign(LEFT);
  text(_title, 60, 28);
  popMatrix();
}



void textPressed() {
  if (keyPressed) {
    if (key == '1') {
      stroke(250);
      textSize(30);
      text("1 is pressed", 500, 25);
    }// close key 1
    if (key == '2') {
      stroke(250);
      textSize(30);
      text("2 is pressed", 500, 25);
    }// close key 2
    if (key == '3') {
      stroke(250);
      textSize(30);
      text("3 is pressed", 500, 25);
    }// close key 3

  }//close keyPressed

}//CLOSE textPressed

