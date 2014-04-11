void myNavs() {
  //grid();
  navBarTop();
  textPressed();
}


void navBarTop() {//Beacground of nav bar top in sectionsx`
  noStroke();
  fill(colorsBg[0], 200);//color bg orange
  rectMode(CORNER);
  rect(0, 0, w, gridUnit*3);//color bg orange

  //Button1
  buttonsTop(0, 0, "C");
  //Button2
  buttonsTop(w-gridUnit*9, 0, "T");
  //Button3
  buttonsTop(w-gridUnit*6, 0, "H");
  //Button4
  buttonsTop(w-gridUnit*3, 0, "I");

}//CLOSE navBarTop



//TITLES BAR TOP
void panelTitles(String _title) {
  pushMatrix();
  fill(colorsTypo[0]);//WHITE
  textSize(22);
  textAlign(LEFT, BOTTOM);
  text(_title, gridUnit*5, gridUnit*2);
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




void buttonsTop(int _x, int _y, String _t) {
  int x1 = _x;
  int x2 = _x + gridUnit*3;
  int y1 = _y;
  int y2 = _y + gridUnit*3;
  int found = -1;
  int onOver = colorsButton[0];

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
  rect(x1, y1, x2-1, y2);
  fill(colorsBg[0]);
  textSize(26);  textAlign(CENTER);
  text(_t, 32 + _x, 38+_y);

}//END BUTTONS


void grid() {
  for (int i=0; i<w; i++) {
    stroke(220);
    line(gridUnit *i, 0, gridUnit *i, h );
    for (int j=0; j<h; j++) {
      line(0, gridUnit *j, w, gridUnit *j );
    }
  }
}//CLOSE GRID


