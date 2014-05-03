//8-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
//2- //TOPIC TEXT SCROLL CLOSE - - - - - - - - 

//8-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
void textContentPanel(float _textY) {
  int infoW = w - gridUnit*4;
  int infoH = h - gridUnit*3;
  float infoYAll = _textY;
  int infoX = gridUnit*2;
  int infoY = gridUnit*4;
  //TEXT
  int textPosX = infoX*2;//position of text box
  int textPosY = infoY+gridUnit*1;//position of text box
  int textW = 550;

  rectMode(CORNER);
  noStroke();  
  textFont(fontBodyText);  //sans font w createFont

  pushMatrix();
    translate(0, infoYAll);
    //CAJA 1 BG NEGRO
    fill(0, 100);
    rect(0, gridUnit*2, w, h);//position rect BG 
    textFont(fontBodyText);

    //BG 1
    if (articleTextPanelUp == false) {
      articleTextPanelY = lerp(articleTextPanelY, 800, .12);
    }
    else {
      articleTextPanelY = lerp(articleTextPanelY, 0, .12);
    }
  
    //BG BoxTEXT
    fill(20);
    rect(infoX, infoY, infoW, infoH );
  
    //SCROLL
    scrollText(0);
    fill(0); 
    rect(infoX, gridUnit*2, infoW, gridUnit*2 );//TO COVER TEXT SCROLL
  
    //BG IMAGE OR DESIGN?
    fill(40);
    rect(infoX, infoY, infoW, gridUnit*4 );
  
    //TITLES TEXT ATICLE PANEL
    fill(200);
    textAlign(LEFT);  textSize(20);
    text("ARTICLE N XX", textPosX, textPosY, textW, 400);  
    //TITLE TOPICS
    textSize(12);
    text("Topics: ", textPosX, textPosY+25, textW/2, 400);
  //  text("Tools: " + panelArticleDetailTest[1], textPosX, textPosY+gridUnit*4, textW/2, 400);
  
    //TEXT PANET UP AND DOWN
    butCircleCloseTextTopic.display(articleTextPanelY-40, "articletext");
    //TOOLS
    textTools(infoX, infoY);
    //FEEDBACK 
    textFeedback(infoX+665, infoY);

  //TOPIC TEXT SCROLL - - - - - - - -
  popMatrix();

}//CLOSE X-PANEL THAT UPS WITH TEXT WHEN CALLED - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  




//SCROLL INITIAL VALUES - - - - - - - - - - - - - - - - - - - - - - -  
void scrollTextIntial() {

  scrollArticlesAll = loadStrings("articles/articlesAll.txt");//LOAD FILE
  scrollArticlesAllJoined = join(scrollArticlesAll, " ");//CREATE 1 STRING
  scrollArticlesAllSplitted = split(scrollArticlesAllJoined, "*");//SPLIT THE STRING BASED ON A CHARACTER
  scrollArticleSelected = 0;// SETS INITIAL ARTICLE NUMBER TO SHOW 
  
  totalNumCharac = scrollArticlesAllJoined.length();

//CALCULATE NUMBER OF WORDS TO LENGTH OF SCROLL
  boolean scrollOn = false;
  scrollBoxConstrain = scrollPosY+1;//initial value scroll box
  artWords = (totalNumCharac / charPerLine) *6 ;  
  artTextLenght = artWords;
  scrollH = artWords;
}//SCROLL INITIAL VALUES - - - - - - - - - - - - - - - - - - - - - - - 




//SCROLL GUI - - - - - - - - - - - - - - - - - - - - - - - 
void scrollText(int _scrollBoxY) {
  // Scroll Cosntrain
  int scrollBoxX = scrollPosX+360;
  int scrollBoxY = _scrollBoxY;
  int scrollBoxW = 20;
  int scrollBoxH = 10;
  int scrollBoxTop = 0;
  //  int scrollBoxBottom = 400;
  int scrollBoxBottom = scrollPosY+346;
  noStroke();
  textSize(scrollTextSize);
  textAlign(LEFT);

  //CHECK MOUSE OVER
  if (  mousePressed && mouseX>scrollBoxX && mouseX<scrollBoxX+scrollBoxW   ) {
    scrollBoxConstrain = constrain(mouseY, scrollBoxY+scrollPosY, scrollBoxBottom);
  }  
  // Scroll Map
  float  posYMapped = map(scrollBoxConstrain, scrollPosY, scrollBoxBottom, 0, (scrollH+100)*-1);

  //SCROLL BAR
  fill(0);//color bg scroll
  rect(scrollBoxX-1, scrollPosY, scrollBoxW+2, scrollBoxX-91);//Bellow
  //  pushMatrix();
  fill(140);//color smal square
  rect(scrollBoxX, scrollBoxConstrain, scrollBoxW, scrollBoxH );
  //  popMatrix();

  //TextScroll
  fill(10, 0); 
  rect(scrollPosX, scrollPosY, scrollW, scrollH);
  fill(180);
//  text("HOLA HOLA HOLA FEO"+scrollArticleJoined, scrollPosX, scrollPosY+posYMapped, scrollW, scrollH+100);
  text(scrollArticlesAllSplitted[scrollArticleSelected], scrollPosX, scrollPosY+posYMapped, scrollW, scrollH+100);

}//END SCROLL GUI - - - - - - - - - - - - - - - - - - - - - - - 



//TEXT TOOLS SIDE - - - - - - - - - - - - - - - - - - - - - - - 
void textTools(int _textToolsX, int _textToolsY){
  int textToolsX = _textToolsX;
  int textToolsY = _textToolsY*2;
  int textToolsSep = 20;

//BG COLOR
  fill(30);
  rect(textToolsX, textToolsY, 260, 600);

//TITLES TOOLS QUESTIONS
  fill(120);
  textAlign(LEFT);  textSize(20);
  textSize(16);
  text("Some Questions", _textToolsX+textToolsSep, textToolsSep+textToolsY, 220, 600);
  //DETAIL
  textSize(12);
  text("Quesitons Todo", _textToolsX+textToolsSep, textToolsSep+textToolsY+30, 220, 600);
//  text(panelArticleDetailTest[1], _textToolsX+textToolsSep, textToolsSep+textToolsY+30, 220, 600);


//TITLES TOOLS DEFINITIONS
  fill(120);
  textAlign(LEFT);  textSize(20);
  textSize(16);
  text("Definitions", _textToolsX+textToolsSep, textToolsSep+textToolsY+300, 220, 600);
  //DETAIL
  textSize(12);
  text("definitins todo", _textToolsX+textToolsSep, textToolsSep+textToolsY+330, 220, 600);
//  text(panelArticleDetailTest[1], _textToolsX+textToolsSep, textToolsSep+textToolsY+330, 220, 600);
}//TEXT TOOLS SIDE CLOSE - - - - - - - - - - - - - - - - - - - - - - - 



//TEXT FEEDBACK SIDE - - - - - - - - - - - - - - - - - - - - - - - 
void textFeedback(int _textFeedbackX, int _textFeedbackY){
  int textFeedbackX = _textFeedbackX;
  int textFeedbackY = _textFeedbackY*2;
  int textFeedbackSep = 20;

//BG COLOR
  fill(30);
  rect(textFeedbackX, textFeedbackY, 260, 600);

//TITLES FEEDBACK QUESTIONARY
  fill(120);
  textAlign(LEFT);  textSize(20);
  textSize(16);
  text("Questionary", _textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY, 220, 600);
  //DETAIL
  textSize(12);
  text("Quesitonarie todo", _textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+30, 220, 600);
  //text(panelArticleDetailTest[1], _textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+30, 220, 600);

//TITLES FEEDBACK OPINION
  fill(120);
  textAlign(LEFT);  textSize(20);
  textSize(16);
  //Opinion
  text("Your Brief Opinion", textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+300, 220, 600);
  textSize(12);
  text("Your name...\n\n\nWrite your Opinion (max 140 ch.)", textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+330, 220, 600);
  //Boxes Opinion
  fill(50);
  rect(textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+350, 220, 20);
  rect(textFeedbackX+textFeedbackSep, textFeedbackSep+textFeedbackY+410, 220, 100);
}//TEXT TOOLS SIDE CLOSE - - - - - - - - - - - - - - - - - - - - - - - 

