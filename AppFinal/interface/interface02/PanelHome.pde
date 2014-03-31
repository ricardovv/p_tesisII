//

void panelHome(){
    rectMode(CORNER);  //titles

  //Background
  int panelW = w;
  int panelH = h;
  fill(20, 50, 10);
  noStroke();

 // rect(0, 0, panelW, panelH);
//TEXT
  fill(200);
  textAlign(CENTER);
  textSize(40);
  text("CONSTITUTION\nUnderstanding the text\nBla\nBla\nPRess 1, 2, 3, 4", panelW/2, panelH/2);

// TITLE ON TOP
panelTitles("HOME");

}
