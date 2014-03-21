// hacer clases botones panel

void panelInfo() {
  //titles
  panelTitles("INFO AZUL");

  //Background
  int panelW = w - gridSpacer*2;
  int panelH = h - gridSpacer*2;
  fill(0, 0, 200);
  noStroke();
  rect(gridSpacer*2, gridSpacer*2, panelW, panelH);
}

