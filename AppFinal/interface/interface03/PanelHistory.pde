// hacer clases botones panel



void panelHistory() {
  rectMode(CORNER);  //titles

  //Background
  int panelW = w - gridUnit*2;
  int panelH = h - gridUnit*2;
  fill(200, 0, 0);
  noStroke();

  rect(gridUnit*2, gridUnit*2, panelW, panelH);
  panelTitles("HISTORY RED");
}

