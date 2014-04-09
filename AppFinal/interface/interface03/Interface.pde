void myNavs() {
  //grid();
  navBarTop();
  navBarLeft();
  textPressed();
}


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
  buttonsLeft(900, 0, "T");
  //Button3
  buttonsLeft(941, 0, "H");
  //Button4
  buttonsLeft(w-42, 0, "I");
}//CLOSE navBarLeft


//TITLES
void panelTitles(String _title) {
  pushMatrix();
  fill(250);
  textSize(20);
  textAlign(LEFT);
  text(_title, 80, 25);
  popMatrix();
}



void textPressed() {
  if (keyPressed) {

    if (key == '1') {
      stroke(250);
      textSize(30);
      text("1 is pressed", 500, 25);
      panel = 1; 
    }// close key 1

    if (key == '2') {
      stroke(250);
      textSize(30);
      text("2 is pressed", 500, 25);
      panel = 2; 
    }// close key 2

    if (key == '3') {
      stroke(250);
      textSize(30);
      text("3 is pressed", 500, 25);
      panel = 3; 
    }// close key 3

    if (key == '4') {
      stroke(250);
      textSize(30);
      text("4 is pressed", 500, 25);
      panel = 4; 
    }// close key 3

  }//close keyPressed
}//CLOSE textPressed




void buttonsLeft(int _x, int _y, String _t) {
  int x1 = _x;
  int x2 = _x + gridSpacer*2;
  int y1 = _y;
  int y2 = _y + gridSpacer*2;
  int found = -1;
  int onOver = 80;

  //check mouse over
  if (mouseX>_x && mouseX<x2 && mouseY>y1 && mouseY<y2 ) {//if the mouse position is inside the specific rect. 
    found = 1;//select that specific rect
  }

  if (found >=0) {//check if there is a specific rect available.
    if (mousePressed) {
      onOver = 150;
      //rect(x1, y1, x2, y2);//select the specific rect founded
      //test buttons for loading sections
      if (_t == "T") {
        rect(200, 200, 200, 200);
      }
    }
    else {
      onOver = 80;
    }    //close if mousePressed
  }//close if found

  rectMode(CORNERS);
  fill(onOver);
  rect(x1, y1, x2, y2);
  fill(200);
  textSize(20);  textAlign(CENTER);
  text(_t, 20 + _x, 26+_y);

}//END BUTTONS


void grid() {
  for (int i=0; i<w; i++) {
    stroke(220);
    line(gridSpacer *i, 0, gridSpacer *i, h );
    for (int j=0; j<h; j++) {
      line(0, gridSpacer *j, w, gridSpacer *j );
    }
  }
}//CLOSE GRID


