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

//FROM FORLOOPDISTRIBUTION08
  visualizationLabels( gridUnit*45, 150 );
  chaptersTopDisplay();
  articlesDisplayBoxes();


}//panelTopics ENDS



//7- void menuTopics(int _x, int _y){
//8- void textContentPanel() {

//1- void  checkCategory() {
//2- void chaptersTopDisplay(){
//3- void chapterDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _chapterTitle, String _chapterDescription ) {  
//4- void articlesDisplayBoxes(){
//5- void articleDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _articleNumberText, int _articleWordsNum, String _articleTopics ) {  
//6- void visualizationLabels(float _x, float _y){



//7-MenuTOPICS - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
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
//MenuTOPICS CLOSE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//8-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
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
}//CLOSE X-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  




//FROM FORLOOPDISTRIBUITON08
  
//1- CHECK CATEGORY HEIGHT OR WIDTHS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void  checkCategory() {
//  posY[0] = 0;//starting at...
  for(int i=0; i<articlesCategory.length; i++){
    fill(200);
    if(articlesCategory[i]==1){ bH[i]  = articleBoxHintial*1.0; }//category 1 & 2 the same
    if(articlesCategory[i]==2){ bH[i]  = articleBoxHintial*1.0; }
    if(articlesCategory[i]==3){ bH[i]  = articleBoxHintial*1.5; }
    if(articlesCategory[i]==4){ bH[i]  = articleBoxHintial*2.0; }//4 & 5 equals
    if(articlesCategory[i]==5){ bH[i]  = articleBoxHintial*2.0; }
    if(articlesCategory[i]==6){ bH[i]  = articleBoxHintial*2.5; }
    if(articlesCategory[i]==7){ bH[i]  = articleBoxHintial*3.0; }// from here 1 point less
    if(articlesCategory[i]==8){ bH[i]  = articleBoxHintial*3.0; }
    if(articlesCategory[i]==9){ bH[i]  = articleBoxHintial*3.5; }
    if(articlesCategory[i]==10){ bH[i] = articleBoxHintial*4.0; }
    if(articlesCategory[i]==11){ bH[i] = articleBoxHintial*4.5; }
    if(articlesCategory[i]==12){ bH[i] = articleBoxHintial*6.0; }
    if(articlesCategory[i]==13){ bH[i] = articleBoxHintial*6.5; }
    if(articlesCategory[i]==14){ bH[i] = articleBoxHintial*7.0; }
    if(articlesCategory[i]==15){ bH[i] = articleBoxHintial*7.5; }
    if(articlesCategory[i]==16){ bH[i] = articleBoxHintial*8.0; }
    if(articlesCategory[i]==17){ bH[i] = articleBoxHintial*8.5; }
    if(articlesCategory[i]==18){ bH[i] = articleBoxHintial*9.0; }
    if(articlesCategory[i]==19){ bH[i] = articleBoxHintial*9.5; }
  }
}//CLOSE 1- CHECK CATEGORY HEIGHT OR WIDTHS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//2- DISPLAY CHAPTERS TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void chaptersTopDisplay(){
  for (int i=0; i<chaptersNumber.length; i++) {
      boxChapterX = visualPosX + boxChapterW*i;
      boxChapterY = visualPosY - boxChapterH;
      
      fill(240, 100, 20);
      rect(boxChapterX, boxChapterY, boxChapterW-sep*5, boxChapterH);//boxes each section, negative value to show at -height
      fill(250);textAlign(LEFT);textSize(10);
      text(chaptersNumber[i], 4+visualPosX+articleBoxW*i, boxChapterY+10);//boxes each article
      //BOXES ARTICLES
      if (i == 15) {//select first columt to color
        fill(150, 200, 250);
      }else {
        fill(200, 240, 240);
      }
    //BOX VIS ARTICLE TOP ROLLOVER
    if (  (mouseX>boxChapterX && mouseX<boxChapterX+articleBoxW-sep*5)  &&  (mouseY>boxChapterY && mouseY<boxChapterY+boxChapterH)  ) {
      chapterDetailsOverVisualization( mouseX, visualPosY, chaptersTitle[i], "Topic 1, Topic 2, Topic 3, Topic 4, Topic 5, Topic 6" );
    }
  }//close for
}//2- BOXES CHAPTERS TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//3- DETAILS OVER CHAPTERS on chaptersTopDisplay() - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void chapterDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _chapterTitle, String _chapterDescription ) {  
  int boxW = 320;
  int boxH = 70;
  int boxPosX = -boxW/2;
  int dis = 4;
  noStroke();
  pushMatrix();
    translate(_newPosBoxX, visualPosY-90);    //CHECK IF IS BEYOND WIDTH
    //TRIANGLE BELOW GRIS
    fill(50, 150); //COLOR BG colorTop[13]-200 
    triangle(-10+dis, dis+boxH-10, 10+dis, dis+boxH-10, 0+dis, dis+boxH);
    rect(boxPosX+dis, -10+dis, boxW, boxH);
    //BOX AND TRIANGE OVER
    fill(250, 150, 50); //COLOR TEXT 
    triangle(-10, boxH-10, 10, boxH-10, 0, boxH);
    fill(250, 150, 50); //COLOR TEXT 
    rect(boxPosX, -10, boxW, boxH);
      fill(240, 130, 30); //COLOR TEXT 
      rect(boxPosX, -10, boxW, 27);
    //TEXT
    fill(50);
    textSize(12);
    textAlign(CENTER);textLeading(14);
    text(_chapterTitle, boxPosX+5, -4, boxW-10, boxH-15 );//TEXT TITLE
    textSize(10);
    text(_chapterDescription, boxPosX+10, 20, boxW-20, boxH );//Text description
  popMatrix();
}//3- CLOSE OVER VISUALIZATIONS CHAPTER TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//4- DISPLAY ARTICLES  - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void articlesDisplayBoxes(){
  //  posY[0] = 0;//starting at...
  
  //1- ASSIGN VALUES
  for(int i=0; i<articlesCategory.length; i++){
    fill(200);
    //CHECK THE STARTING ARTICE NUMBER TO ASIGN NEW X POS TO THE RIGHT
    for(int j=0; j<chapterStartAt.length; j++){
      if(articlesIdNumber[i] == chapterStartAt[j]){
        posY[i] = 0;
        posY[i+1] = posY[i]+bH[i];  
        if(chapterStartAt[j]>0){ 
           countToRight = j;//to avoid to move animated to the left...  
        } //to aoid to move one more W at start 
      }else {
        posY[i+1] = posY[i]+bH[i];  
      }//close if 
    }//CLOSE FOR 2
    //STORE NEW POSITIONS
//    newPosX = visualPosX + articleBoxW*countToRight;
//    newPosY = visualPosY + posY[i] + sep;
//    articlesPosX[i] = int(newPosX) ;
//    articlesPosY[i] = int(newPosY) ;
    articlesPosX[i] = int(visualPosX + articleBoxW*countToRight);
    articlesPosY[i] = int(visualPosY + posY[i] + sep);
    //DRAW BOXES
    //    rect( newPosX ,articlesPosY[i] ,articleBoxW-sep*5, bH[i]-sep );
    rect( articlesPosX[i] ,articlesPosY[i] ,articleBoxW-sep*5, bH[i]-sep );
    //DRAW TEXT
    textSize(8);textAlign(LEFT);fill(100);
    text(articlesTitNumber[i], 2+articlesPosX[i], articlesPosY[i]+8);
  }//CLOSE FOR 1- ASSIGN VALUES

 //SHOW DETAILS ON ROLLOVERS
   for(int i=0; i<articlesCategory.length; i++){
     if (  (mouseX>articlesPosX[i] && mouseX<articlesPosX[i]+articleBoxW-sep*5)  &&  (mouseY>articlesPosY[i] && mouseY<articlesPosY[i]+bH[i]-sep)  ) {
        articleDetailsOverVisualization( mouseX, mouseY, articlesTitNumber[i], articlesWordLength[i], "XXXXARTICLES Topic 1, Topic 2, Topic 3, Topic 4, Topic 5, Topic 6" );
     } 
   } //CLOSE SHOW DETAILS ON ROLLOVERS

}//4- CLOSE DISPLAY CHAPTER BOXES - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//5- DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes()- - - - - - - - - - - - - - - 
void articleDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _articleNumberText, int _articleWordsNum, String _articleTopics ) {  
  int boxW = 175;
  int boxH = 125;
  int boxPosX = 0;
  int moveX = -120;
  int dis = 2;
  noStroke();
  pushMatrix();
    //CHECK IF IS BEYOND WIDTH
    if (mouseX > width-boxW) {
      boxPosX = boxPosX+ moveX;
    } else {
      boxPosX = 0;
    } 
    translate(_newPosBoxX-15, _newPosBoxY-boxH-15);
    //TRIANGLE BELOW
    fill(50, 150); //COLOR BG colorTop[13]-200 
    triangle(10+dis, boxH+dis, 20+dis, boxH+dis, 15+dis, boxH+dis+10);
    //CAJA Y TRIANG DEBAJO
    fill(20, 150); //COLOR BG colorTop[13]-200 
    rect(boxPosX+dis, 0+dis, boxW+dis, boxH+dis);
    //BOX AND TRIANGE OVER
    fill(150, 220, 250); //COLOR TEXT 
    triangle(10, boxH, 20, boxH, 15, boxH+10);
    rect(boxPosX, 0, boxW, boxH);
      fill(100, 200, 210); //COLOR TEXT 
      rect(boxPosX, 0, boxW, 30);
    //TEXT
    fill(50);
    textSize(14);
    textAlign(LEFT);
    text("Article nº "+_articleNumberText, boxPosX+8, 6, boxW-15, boxH-12 );
    textSize(10);
    text("Words: "+_articleWordsNum, boxPosX+8, 35, boxW-15, boxH-1 );
    text("Topics: "+_articleTopics, boxPosX+8, 55, boxW-15, boxH-15 );
    text("CLICK TO VIEW", boxPosX+8, 105, boxW-15, boxH-15 );
  popMatrix();
}//5- CLOSE DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes() - - - - - - - - - - - - - - -  


//6- LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void visualizationLabels(float _x, float _y){
  float posX = _x;
  float posY = _y;
  fill(200);
  textSize(10);
  textAlign(LEFT);
  //TITLES
  text("Chapters", posX, posY);
  text("Articles", posX, posY+27);
  text("Label 1", posX, posY+480);
  text("Label 2", posX, posY+500);  
  text("Label 3", posX, posY+520);  
  fill(255, 0, 0);
//  rect(posX-10, posY-10, 1, 18);
//  fill(200);
//  rect(posX-10, posY+11, 1, 520);
} 
//6- END LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


