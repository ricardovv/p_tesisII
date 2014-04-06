// hacer clases botones panel



void panelHistory() {
  rectMode(CORNER);  //titles

  //Background
  int panelW = w - gridSpacer*2;
  int panelH = h - gridSpacer*2;
  fill(200, 0, 0);
  noStroke();

  rect(gridSpacer*2, gridSpacer*2, panelW, panelH);
  panelTitles("HISTORY RED");
}

