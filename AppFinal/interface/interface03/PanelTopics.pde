// revisar panelW, lo necesito? 
void panelTopics() {
  int panelW = gridUnit*11;//width bg panel topics
  int panelH = h - gridUnit*2;

  //Topic Panel position 
  int topicX = 0;
  int topicY = gridUnit*6;//position from top

  //Each Topics Panel Size
  int topicW = panelW;//width each panel
  int topicH = 40;//height each topic 

  //IMPORTANT
  rectMode(CORNER);

  //A - MENU TOPICS - TEXT AND BOX
  for (int i=0; i<20; i++) {
    fill(30, 40, 50);
    //bg cajas de cada topic
    stroke(colorsBg[2]);
    rect(topicX, topicY + topicH  * i, topicW, topicH ); //Each box for category text
    fill(170);
    textAlign(LEFT, TOP);
    textSize(14);
    text("Name of Category n " + i, topicX + 20, topicY + topicH  * i + 11);//Each category text
  }//end for
  //END MENU TOPICS


  //B - VISUALIZATION STRUCTURE, SMALL SQUARES SECOND PANEL 
  //Visualizatyion Panel position 
  int visualX = topicW;
  int visualY = gridUnit*6;
  //Visual Size
  int visualW = gridUnit * 20; 
  int visualH = h - (gridUnit*2); 
  //Visual BG
  fill(40, 50, 60);// bg for visualization area 
  stroke(colorsBg[2]);
  rect(visualX, visualY, visualW, visualH);

  //ELEMENTS, BOXES 
  fill(200, 0, 0);
  noStroke();
  int visualPosX = visualX + gridUnit;
  int visualPosY = visualY + gridUnit;
  int visualAreaW = visualW - gridUnit*2;//Width elements
  int visualAreaH = visualH - 20;//Height Elements
  //TO TEST AREA
  fill(250, 0, 0, 50);
  rect(visualPosX, visualPosY, visualAreaW, visualAreaH-visualY  );

  //Boxes
  for (int i=0; i<9; i++) {
    for (int j=0; j<16; j++) {
      if (i == 0) {//select first columt to color
        fill(colorsBg[0]);
      }else {
        fill(200, 240, 240);
      }
      rect(visualPosX + 40 *i, visualPosY +36 *j, 39, 35);//boxes each article
    }
  }

  //Txt chapters & articles, Put here the Legend???
  textSize(12);
  textAlign(LEFT);
  text("Chapters Articles", visualPosX, h-(gridUnit+10));
 

  //TEXT PANEL  
  int textPanelX = topicW + visualW;  
  int textPanelY = topicY;//Same posiiton from top than panel topics
  int textPanelW = gridUnit * 20;  
  int textPanelH = panelH;
  fill(55, 65, 80);
    stroke(colorsBg[2]);
  rect(textPanelX, textPanelY, textPanelW, textPanelH);

//quesitons
  questions(topicX, topicY/2, 2);

  //titles
  panelTitles("TOPICS & STRUCTURE");
}//panelTopics ENDS

