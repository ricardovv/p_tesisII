// hacer clases botones panel

void panelTopics() {
  rectMode(CORNER);
  int panelW = w/4 - gridSpacer*2;
  int panelH = h - gridSpacer*2;

  //A - MENU TOPICS
  for(int i=0; i<20; i++){
    int topicW = panelW;
    int topicH = panelH/20;
    fill(20, 30, 20);
    stroke(60);
    rect(gridSpacer*2 , gridSpacer*2 + topicH  * i, topicW, topicH );
    fill(120);
    textAlign(LEFT, TOP);
    textSize(14);
    text("Name of Category n " + i, gridSpacer*2 + 25, gridSpacer*2 + topicH  * i + 10);
  }//end for
//END MENU TOPICS

  //B - STRUCTURE VISUALIZATION
  int visualW = w - (gridSpacer*2 + panelW); 
  int visualH = h/2 - (gridSpacer*2); 
//CAJA
  fill(200);
  noStroke();
  rect(gridSpacer*2 + panelW, gridSpacer*2, visualW, visualH);

//ELEMENTS
  fill(200, 0, 0);
  noStroke();
  int visualPosX = gridSpacer*2 + panelW + 60;
  int visualPosY = gridSpacer*2 + visualH/2;
  int visualAreaW = visualW - 80;
  int visualAreaH = visualH - 20;

textSize(12);textAlign(RIGHT);
text("Chapters\nArticles", visualPosX-5, visualPosY-5);
  rect(visualPosX, visualPosY, visualAreaW, 2);//red line

  for(int i=0; i<22; i++){
    for(int j=0; j<10; j++){
      fill(200, 240, 240);
//      stroke(250);
      rect(visualPosX + 4 + 34 *i, 5+visualPosY +20 *j, 33, 18);//red line
//      text();
   }
  }


  //TEXT LOAD
  int textFrameW = visualW; 
  int textFrameH = panelH;
  fill(80);
  noStroke();  

  rect(gridSpacer*2 + panelW, gridSpacer + textFrameH/2, textFrameW, textFrameH/2 + gridSpacer);


  //titles
  panelTitles("TOPICS GREEN");

}//panelTopics ENDS

