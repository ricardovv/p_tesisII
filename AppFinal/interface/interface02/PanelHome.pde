//

void panelHome(){
    rectMode(CORNER);  //titles

  //Background
  int panelW = w;
  int panelH = h;
  noStroke();
//Blue box
  fill(colorsBg[0]);
  rect(0, 0, panelW, panelH);
//Orange box
  fill(colorsBg[1]);
  rect(gridSpacer, gridSpacer, panelW-gridSpacer*2, panelH-gridSpacer*2);

//TEXT TITLE
  fill(255);
  textAlign(CENTER);
  textFont(fontTitles);
  textSize(80);
  text("THE CONSTITUTION", panelW/2, panelH/2-70);
  textSize(25);
  text("Visual Exploration Trough Chilean Current Contitution", panelW/2, panelH/2-20);

// TITLE ON TOP
panelTitles("HOME press 1 - ");

}
