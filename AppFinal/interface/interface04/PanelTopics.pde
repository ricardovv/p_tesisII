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


///*
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
//*/

  //TITLES AT THE TOP
  panelTitles("TOPICS & STRUCTURE"); 
  //QUESITONS AT THE TOP
  questions(topicX, topicY/2, 2);
  //VISUALIZATION STRUCTURE
  visualizationStructure(0, gridUnit*6, w, h-(gridUnit*2));
  //TEXT PANEL WITH CONTENTS
  textContentPanel();

}//panelTopics ENDS





void visualizationStructure(int _visualX, int _visualY, int _visualW, int _visualH){
 //B - VISUALIZATION STRUCTURE, SMALL SQUARES SECOND PANEL 
  int visualX = _visualX;
  int visualY = _visualY;
  int visualW = _visualW; 
  int visualH = _visualH; 
  //Visual BG
  fill(40, 50, 60);// bg for visualization area 
  noStroke();
  rect(visualX, visualY, visualW, visualH);

  //ELEMENTS, BOXES 
  fill(200, 0, 0);
  noStroke();
  int visualPosX = visualX + gridUnit*10;
  int visualPosY = visualY + gridUnit*6;
  int visualAreaW = visualW - gridUnit*12;//Width elements
  int visualAreaH = visualH - gridUnit*9;//Height Elements
  int boxW = visualAreaW/16;
  //BG AREA
  fill(250, 0, 0, 150);
  rect(visualPosX, visualPosY, visualAreaW, visualAreaH-visualY  );

// CHAPTERS AND ARTIVLES MATRIX
   
 int[] chaptersArticles = { 
  1,
  2, 2, 
  3, 3, 3, 
  4, 4, 4, 4,
  5, 5, 5, 5, 5,
  6, 6, 6, 6, 6, 6,
  7, 7, 7, 7, 7, 7, 7, 
  8, 8, 8, 8, 8, 8, 8, 8,
  9, 9, 9, 9, 9, 9, 9, 9, 9, 
  10,10,10,10,10,10,10,10,10,10, 
  9, 9, 9, 9, 9, 9, 9, 9, 9,
  8, 8, 8, 8, 8, 8, 8, 8, 
  7, 7, 7, 7, 7, 7, 7, 
  6, 6, 6, 6, 6, 6, 
  5, 5, 5, 5, 5, 
  4, 4, 4, 4, 
  3, 3, 3,
  2, 2, 
  1 
};


  //BOXES BUTTONS
  for (int i=0; i<10; i++) {
    for (int j=0; j<10; j++) {
      //BOXES CHAPTERS
      fill(200, 100, 20);
      rect(visualPosX + boxW*i, visualPosY - 48, boxW-2, 46);//boxes each section
      fill(250);
      text(i+1, 25 + visualPosX + boxW*i, visualPosY - 18);//boxes each article

      //BOXES ARTICLES
      if (i == 15) {//select first columt to color
        fill(150, 200, 250);
      }else {
        fill(200, 240, 240);
      }
      rect(visualPosX + boxW*i, visualPosY +48 *j, boxW-2, 46);//boxes each article
    }
  }

 
//  visualizationLabels( visualPosX, h-(gridUnit+10) );
   visualizationLabels( gridUnit*2, gridUnit*10 );

}//END visualizationStructure


void visualizationLabels(int _x, int _y){
  int posX = _x;
  int posY = _y +20;
  textSize(14);
  textAlign(LEFT);
  
  //TITLES
  text("Chapters", posX, posY);
  text("Articles", posX, posY+40);
  text("Transitory Dispositions", posX, posY+500);
  text("Label 1", posX, posY+520);
  
}// END visualizationLabels 










void textContentPanel() {
  //TEXT PANEL  
//  int textPanelX = topicW + visualW; // previous
//  int textPanelY = topicY;//Same posiiton from top than panel topics
//  int textPanelW = gridUnit * 20;  
//  int textPanelH = panelH;
  int textPanelX = gridUnit*3;  
  int textPanelY = gridUnit*7;//Same posiiton from top than panel topics
  int textPanelW = gridUnit * 45;  
  int textPanelH = h - gridUnit*8;

//TEXT PANEL
pushMatrix();
//  translate(0, mouseY);
  translate(0, h-10);
  noStroke();
  //BG BLACK TRANSLUCENT  
  fill(20, 175);
  rect(0, textPanelX, w, h);

  //BG BOX CONTENT
  fill(55, 65, 80);
  rect(textPanelX, textPanelY, textPanelW, textPanelH);
  //BG TEXT TOP
  fill(25, 35, 50);
  rect(textPanelX, textPanelY, textPanelW, gridUnit*5);
  myText(textPanelX+gridUnit*5, textPanelY+40, 20, "CENTER", 255, "ARTICLE 93"); 
  //CLOSE BUTTON
  fill(50, 140, 250);
  ellipse(textPanelW+30, textPanelY+30, 40, 40);
  myText(textPanelW+31, textPanelY+33, 14, "CENTER", 255, "close"); 
//TEXT MAIN CONTENT
  
  textAlign(LEFT);
  textSize(14);
  text("MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT, MAIN TEXT",
  textPanelX+440, textPanelY+gridUnit*6, 420, 500);  

popMatrix();

}

