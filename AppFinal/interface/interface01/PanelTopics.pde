// hacer clases botones panel

void panelTopics(){
    //titles
  panelTitles("TOPICS GREEN");

  //MENU TOPICS
  int panelW = w/4 - gridSpacer*2;
  int panelH = h - gridSpacer*2;
  fill(0, 200, 0);
  noStroke();
  rect(gridSpacer*2, gridSpacer*2, panelW, panelH);

  //STRUCTURE VISUALIZATION
  int visualW = w - (gridSpacer*2 + panelW); 
  int visualH = h/2 - (gridSpacer*2); 
  fill(0);
  noStroke();
  rect(gridSpacer*2 + panelW, gridSpacer*2, visualW, visualH);

  //TEXT LOAD
  int textFrameW = visualW; 
  int textFrameH = panelH;
  fill(80);
  noStroke();
  rect(gridSpacer*2 + panelW, gridSpacer + textFrameH/2, textFrameW, textFrameH/2 + gridSpacer);

}//panelTopics ENDS
