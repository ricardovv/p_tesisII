// hacer clases botones panel

void panelTopics() {
  int panelW = w/4 - gridSpacer*2;
  int panelH = h - gridSpacer*2;

//Size and position panel topics
    int topicW = panelW;
    int topicH = panelH/20;


//CAJA BG COLOR 
  rectMode(CORNER);
  fill(colorsBg[2]);
  noStroke();
  rect(0, gridSpacer*2, w, h);



  //A - MENU TOPICS
  for(int i=0; i<20; i++){
      fill(30, 40, 50);
    //bg cajas de cada topic
    stroke(60);
    rect(0, gridSpacer*2 + topicH  * i, topicW, topicH );
    fill(170);
    textAlign(LEFT, TOP);
    textSize(14);
    text("Name of Category n " + i, 25, gridSpacer*2 + topicH  * i + 10);
  }//end for
//END MENU TOPICS




  //B - STRUCTURE VISUALIZATION
  int visualW = 400; 
  int visualH = h - (gridSpacer*2); 
  //CAJA BG
  fill(40, 50, 60);// bg for visualization area 
  noStroke();
  rect(topicW+2, gridSpacer*2, visualW, visualH);

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
  fill(55, 65, 80);
  noStroke();  
  rect(panelW*2.865, gridSpacer*2+1, textFrameW, textFrameH);
  //titles
  panelTitles("TOPICS");

}//panelTopics ENDS

