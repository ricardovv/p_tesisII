// hacer clases botones panel

void panelInfo() {
    rectMode(CORNER);
  //titles

  //Background
  int panelW = w - gridSpacer*2;
  int panelH = h - gridSpacer*2;
  fill(0, 0, 200);
  noStroke();

  rect(gridSpacer*2, gridSpacer*2, panelW, panelH);

  //TEXT
  fill(200);
  textAlign(CENTER);
  textSize(40);
  text("INFORMATION ABOUT THE PROJECT\nBla\nBla", panelW/2, panelH/2);

  //TITLE ON TOP
  panelTitles("INFO AZUL");
}

