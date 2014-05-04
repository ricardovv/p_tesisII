// revisar panelW, lo necesito? 
// crear array boolean para on/of boxes 

void panelTopics() {
  int panelW = gridUnit*11;//width bg panel topics
  int panelH = h - gridUnit*2;
  //Topic Panel position 
  int menuX = 5;//position from left
  int menuY = gridUnit*6;//position from top
  //IMPORTANT
  rectMode(CORNER);
  textFont(fontBodyText);  //sans font w createFont

  //QUESITONS AT THE TOP
//  questions(gridUnit*14, -10, 2);
  //VISUALIZATION STRUCTURE
  menuTopics(menuX, menuY);
  //TEXT PANEL WITH CONTENTS
  //FROM FORLOOPDISTRIBUTION08
  visualizationLabels( gridUnit*46, gridUnit*34 );
  chaptersTopDisplay();
  articlesDisplayBoxes();
  //Boxes to be opened on click article
  textContentPanel(textBoxPosY);

//TEST WHICH TEXT IS LOADING IN THE SCROLL TEXT PANEL  
  //textSize(60);
  //fill(200);
//text(scrollArticleSelected, 200, 100);


}//panelTopics ENDS



//7- void menuTopics(int _x, int _y){
//8- void textContentPanel() {
//9- BUTTONS CATEGORIES
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
  int menuItemW = gridUnit*10;
  int menuItemH = 20;
  int menuTitleY = menuTopicY;
  int menuTitleH = 20;//gridUnit*2;
  //MENU TITLE
  fill(35, 35, 60);
    rect(menuTopicX, menuTitleY, menuItemW, menuTitleH);//rect bg title
  fill(200);
    textAlign(LEFT, TOP);  textSize(10);
    text("SELECT TOPICS", menuTopicX+10, menuTitleY+5);//TITLE TEXT

  //A - MENU TOPICS - TEXT AND BOX
  for (int i=0; i<topicsCategoryNames.length; i++) {
      //bg cajas de cada topic
//    rect(menuTopicX, menuTitleY+menuTitleH+menuItemH*i, menuItemW, menuItemH ); //Each box for category text
//    fill(170);
 //   textSize(12);
  //  text("Name of Category "+i, menuTopicX+20, menuTitleY+menuTitleH+menuItemH*i + 8);//Each category text
  articlesButtonsCategories(menuTopicX, menuTitleY+menuTitleH+menuItemH*i, menuItemW, menuItemH, i, topicsCategoryNames[i]);

  }//end for
}
//7- MenuTOPICS CLOSE - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




//9- BUTTONS CATEGORIES - - - - - - - - - - - - - - - - - - - - - - - - 
void articlesButtonsCategories(int _x, int _y, int _w, int _h, int _i, String _t) {
  int bX = _x;
  int bY = _y;
  int bW = _w;
  int bH = _h;
  int found = -1;
  int onOver = 30;
  String text = _t;
  int myI = _i; 
  //check mouse over
  if (  (mouseX>bX && mouseX<bX+bW)   &&  (mouseY>bY && mouseY<bY+bH)  ) {//if the mouse position is inside the specific rect. 
    found = 1;//select that specific rect
  }
  if (found >=0) {//check if there is a specific rect available.
    if (mousePressed) {
      onOver = 70;
        //Check button to highlight articles boxes
        for(int i=0; i<articlesCategoryHighligth.length;i++){
          if (myI+1 == articlesCategoryHighligth[i]) { // check myI & categories are equal, myI+1 to avoid 0
             boxOn[i] = true;
          }             
        }//close forloop 
        
     }else {
       onOver = 50;
       boxOn[myI] = false;
     }//close if mousePressed
  }//close if found
//  rectMode(CORNERS);
  fill(onOver);
    rect(bX, bY, bW, bH);
  fill(100,30,0);
    rect(bX, bY, bW, 1);//linea roja
  
  fill(150);
  textSize(10);  
  textAlign(LEFT);
  text(text, bX+10, bY+14);
}//2- LOSE MAIN NAV BUTTONS AT THE TOP - - - - - - - - - - - - - - - - - - - - - - - - 




//FROM FORLOOPDISTRIBUITON08
  
//1- CHECK CATEGORY HEIGHT OR WIDTHS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void  checkCategory() {
//  posY[0] = 0;//starting at...
  for(int i=0; i<articlesLengthCategory.length; i++){
    fill(200);
    if(articlesLengthCategory[i]==1){ bH[i]  = articleBoxHintial*1.0; }//category 1 & 2 the same
    if(articlesLengthCategory[i]==2){ bH[i]  = articleBoxHintial*1.0; }
    if(articlesLengthCategory[i]==3){ bH[i]  = articleBoxHintial*1.5; }
    if(articlesLengthCategory[i]==4){ bH[i]  = articleBoxHintial*2.0; }//4 & 5 equals
    if(articlesLengthCategory[i]==5){ bH[i]  = articleBoxHintial*2.0; }
    if(articlesLengthCategory[i]==6){ bH[i]  = articleBoxHintial*2.5; }
    if(articlesLengthCategory[i]==7){ bH[i]  = articleBoxHintial*3.0; }// from here 1 point less
    if(articlesLengthCategory[i]==8){ bH[i]  = articleBoxHintial*3.0; }
    if(articlesLengthCategory[i]==9){ bH[i]  = articleBoxHintial*3.5; }
    if(articlesLengthCategory[i]==10){ bH[i] = articleBoxHintial*4.0; }
    if(articlesLengthCategory[i]==11){ bH[i] = articleBoxHintial*4.5; }
    if(articlesLengthCategory[i]==12){ bH[i] = articleBoxHintial*6.0; }
    if(articlesLengthCategory[i]==13){ bH[i] = articleBoxHintial*6.5; }
    if(articlesLengthCategory[i]==14){ bH[i] = articleBoxHintial*7.0; }
    if(articlesLengthCategory[i]==15){ bH[i] = articleBoxHintial*7.5; }
    if(articlesLengthCategory[i]==16){ bH[i] = articleBoxHintial*8.0; }
    if(articlesLengthCategory[i]==17){ bH[i] = articleBoxHintial*8.5; }
    if(articlesLengthCategory[i]==18){ bH[i] = articleBoxHintial*9.0; }
    if(articlesLengthCategory[i]==19){ bH[i] = articleBoxHintial*9.5; }
  }
}//CLOSE 1- CHECK CATEGORY HEIGHT OR WIDTHS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


//2- DISPLAY CHAPTERS TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void chaptersTopDisplay(){
  for (int i=0; i<chaptersNumber.length; i++) {
      boxChapterX = visualPosX + boxChapterW*i;
      boxChapterY = visualPosY - boxChapterH;
      noStroke();
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
      chapterDetailsOverVisualization( mouseX, visualPosY, chaptersTitle[i], chaptersDescriptions[i]);
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

//To avoid the details go out of screen
  if(mouseX>w-180){
    boxPosX = boxPosX-100;
  }
  if(mouseX<320){
    boxPosX = boxPosX+100;
  }

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
      rect(boxPosX, -10, boxW, 25);
    //TEXT
    fill(50);
    textSize(12);
    textAlign(CENTER);textLeading(9);
    text(_chapterTitle, boxPosX+5, -5, boxW-10, boxH-15 );//TEXT TITLE
    textSize(10); textLeading(12);
    text(_chapterDescription, boxPosX+6, 18, boxW-14, boxH );//Text description
  popMatrix();
}//3- CLOSE OVER VISUALIZATIONS CHAPTER TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




//4- DISPLAY ARTICLES  - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void articlesDisplayBoxes(){
  //  posY[0] = 0;//starting at...
  int foundOverBox = -1;
  
  //1- ASSIGN VALUES
  for(int i=0; i<articlesLengthCategory.length; i++){
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
    articlesPosX[i] = int(visualPosX + articleBoxW*countToRight);
    articlesPosY[i] = int(visualPosY + posY[i] + sep);
    //DRAW BOXES
    if(boxOn[i] == false){//change state from category button
      fill(190);
    }else{
      fill(250);
    }
    rect( articlesPosX[i] ,articlesPosY[i] ,articleBoxW-sep*5, bH[i]-sep );
    //DRAW TITLES TEXT 
    textSize(8);textAlign(LEFT);fill(80);
    text(articlesTitNumber[i], 2+articlesPosX[i], articlesPosY[i]+8);
  }//CLOSE FOR 1- ASSIGN VALUES


 //SHOW DETAILS ON ROLLOVERS
   for(int i=0; i<articlesLengthCategory.length; i++){
     if (  (mouseX>articlesPosX[i] && mouseX<articlesPosX[i]+articleBoxW-sep*5)  &&  (mouseY>articlesPosY[i] && mouseY<articlesPosY[i]+bH[i]-sep)  ) {
        articleDetailsOverVisualization( mouseX, mouseY, articlesTitNumber[i], articlesWordLength[i], "Topic 1, Topic 2, Topic 3, Topic 4, Topic 5, Topic 6" );
        //SELECT NUMNER OF ARTOCLE TO LOAD
        scrollArticleSelected = i;   
        //Change state of overbutotns 
        foundOverBox = 1;
        //boxOver[i] = true;//no sirve 
         //TEST IF IS READING THE ARTICLE NUMBER
//         textSize(40);fill(200);
//         text("textBoxOver; "+foundOverBox, 500, 90);
     } 
   //TEST IF IS OVER
//     textSize(40);fill(200);
//     text("textBoxOver; "+foundOverBox, 500, 90);

//To check if is over butotn or not, and change over state
//  if (titleButton == "i") { 
      if(foundOverBox == 1){textBoxOver = true;
  }        
      if(foundOverBox == -1){textBoxOver = false;}    
//  }//close if button info

   }
 

}//4- CLOSE DISPLAY CHAPTER BOXES - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





//5- DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes()- - - - - - - - - - - - - - - 
void articleDetailsOverVisualization( float _newPosBoxX, float _newPosBoxY, String _articleNumberText, int _articleWordsNum, String _articleTopics ) {  
  int boxW = 230;
  int boxH = 110;
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
    text("Article nº "+_articleNumberText, boxPosX+8, 6, boxW-13, boxH-12 );
    textSize(10);
    text("Words: "+_articleWordsNum, boxPosX+8, 34, boxW-15, boxH-1 );
    text("Topics: "+_articleTopics, boxPosX+8, 54, boxW-15, boxH-15 );
    text("- click to view text", boxPosX+8, 90, boxW-15, boxH-15 );
  popMatrix();
}//5- CLOSE DETAILS OVER ARTICLES BELLOW - on articlesDisplayBoxes() - - - - - - - - - - - - - - -  


//6- LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void visualizationLabels(float _x, float _y){
  float posX = _x;
  float posY = _y;
  float moveDown = 15;
  float bW=20;
  float bH=10;
  float sepX = bW+10;
  float sepY = bH+ 5;
  color colText = color(200, 200, 200);
  color col1 = color(200, 0, 0);
  color col2 = color(200, 200, 0);
  color col3 = color(0, 200, 200);
  color col4 = color(0, 0, 200);


  noStroke();
  fill(colText);
  textSize(10); textLeading(11);
  textAlign(LEFT, TOP);
  //TITLES
    text("Chapters", posX+sepX, posY+sepY*0);
    text("Articles", posX+sepX, posY+sepY*1);
    text("Cross\nReferences", posX+sepX, posY+sepY*2);
//    text("Label 4", posX+sepX, posY+sepY*3);

    fill(col1);
    rect(posX, 1+posY+sepY*0, bW, bH);
    fill(col2);
    rect(posX, 1+posY+sepY*1, bW, bH);
    fill(col3);
    rect(posX, 1+posY+sepY*2, bW, bH);
  //  fill(col4);
   // rect(posX, 1+posY+sepY*3, bW, bH);

} 
//6- END LABELS VISUALIZATIONS - - - - - - - - - - - - - - - - - - - - - - - - - - - - 


