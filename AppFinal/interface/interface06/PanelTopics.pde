// revisar panelW, lo necesito? 
void panelTopics() {
  int panelW = gridUnit*11;//width bg panel topics
  int panelH = h - gridUnit*2;
  //Topic Panel position 
  int menuX = 0;//position from left
  int menuY = gridUnit*6;//position from top
  //IMPORTANT
  rectMode(CORNER);

  //QUESITONS AT THE TOP
  questions(gridUnit*8, 0, 2);
  //VISUALIZATION STRUCTURE
  menuTopics(menuX, menuY);
  //TEXT PANEL WITH CONTENTS
  textContentPanel();
}//panelTopics ENDS



//1-MenuTOPICS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void menuTopics(int _x, int _y){
  int menuTopicX = _x;
  int menuTopicY = _y;
  int menuItemW = gridUnit*8;
  int menuItemH = 25;
  int menuTitleY = menuTopicY;
  int menuTitleH = gridUnit*2;

  //MENU TITLE
  fill(35, 35, 60);
    rect(menuTopicX, menuTitleY, menuItemW, menuTitleH);//rect bg title
  fill(200);
    textAlign(LEFT, TOP);  textSize(14);
    text("SELECT TOPICS", menuTopicX+20, menuTitleY+15);//TITLE TEXT
    //A - MENU TOPICS - TEXT AND BOX
  for (int i=0; i<20; i++) {
    fill(30, 40, 50);
    stroke(colorsBg[2]+150);    //bg cajas de cada topic
    rect(menuTopicX, menuTitleY+menuTitleH+menuItemH*i, menuItemW, menuItemH ); //Each box for category text
  
    fill(170);
    textSize(12);
    text("Name of Category "+i, menuTopicX+20, menuTitleY+menuTitleH+menuItemH*i + 8);//Each category text
  }//end for
  
}
//1-MenuTOPICS CLOSE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 










//X-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
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
  translate(0, h-10);//Initial position Text Panel
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
//CLOSE X-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  



